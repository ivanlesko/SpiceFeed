//
//  AddFlavePageViewController.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/29/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "AddFlavePageViewController.h"

#import "UIImage+Resize.h"

#define SLIDE_TIMER 0.15

@interface AddFlavePageViewController () <UIActionSheetDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate>

@end

@implementation AddFlavePageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.actionSheet.delegate = self;
    self.tagsTextfield.delegate = self;
    [self.tagsTextfield addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    self.tagsTextfield.alpha = 0.0f;
    self.tagsTextfield.userInteractionEnabled = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    self.fileUploadBackgroundTaskID = UIBackgroundTaskInvalid;
    self.postFlaveBackgroundTaskID  = UIBackgroundTaskInvalid;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [HelperMethods enableDismissKeyboardsOnTouchInView:self.view];
}

- (IBAction)addFlavePushed:(id)sender
{
    self.actionSheet = [[UIActionSheet alloc] initWithTitle:@"Upload by:"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                     destructiveButtonTitle:nil
                                          otherButtonTitles:@"Photo Library", @"Camera", nil];
    
    [self.actionSheet showInView:self.view];
}

#pragma mark - Action Sheet Delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.delegate = self;
    self.tagsTextfield.text = @"";
    
    if (buttonIndex == 0) {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        self.selectedImageSource = @"photoLibrary";
    } else if (buttonIndex == 1) {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.selectedImageSource = @"camera";
    }
    
    [self presentViewController:self.imagePicker
                       animated:YES
                     completion:nil];
}

#pragma mark - Image Picker Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self.imagePicker dismissViewControllerAnimated:YES completion:^{
        
        UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        UIImage *resizedImage = [image resizedImageWithContentMode:UIViewContentModeScaleAspectFit
                                                            bounds:CGSizeMake(560.0f, 560.0f)
                                              interpolationQuality:kCGInterpolationDefault];
        [self shouldUploadImage:image];
        
        // Resize Image
        UIGraphicsBeginImageContext(CGSizeMake(560.0f, 560.0f));
        
        // Place compressed image onto the screen.
        self.selectedImage.image = resizedImage;
        
        [UIView animateWithDuration:0.4
                         animations:^{
                             self.selectedImage.alpha = 1.0f;
                             self.tagsTextfield.alpha = 1.0f;
                             self.tagsTextfield.userInteractionEnabled = YES;
                         }];
    }];
}

- (BOOL)shouldUploadImage:(UIImage *)image
{
    // Resize the selected Image
    UIImage *resizedImage   = [image resizedImageWithContentMode:UIViewContentModeScaleAspectFit
                                                          bounds:CGSizeMake(560.0f, 560.0f)
                                            interpolationQuality:kCGInterpolationHigh];
    UIImage *thumbnailImage = [image thumbnailImage:86.0f interpolationQuality:kCGInterpolationDefault];
    
    NSData *imageData = UIImageJPEGRepresentation(resizedImage, 0.8f);
    NSData *thumbnailData = UIImagePNGRepresentation(thumbnailImage);
    
    if (!imageData || !thumbnailData) {
        return NO;
    }
    
    self.flaveFile = [PFFile fileWithData:imageData];
    self.thumbnailFile = [PFFile fileWithData:thumbnailData];
    
    self.fileUploadBackgroundTaskID = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [[UIApplication sharedApplication] endBackgroundTask:self.fileUploadBackgroundTaskID];
    }];
    
    [self.flaveFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [self.thumbnailFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                [[UIApplication sharedApplication] endBackgroundTask:self.fileUploadBackgroundTaskID];
            }];
        } else {
            [[UIApplication sharedApplication] endBackgroundTask:self.fileUploadBackgroundTaskID];
        }
    }];
    
    return YES;
}

- (IBAction)spiceItButtonPushed:(id)sender
{
    if (!self.flaveFile || !self.thumbnailFile) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Couldn't post your flave"
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"Dismiss", nil];
        [alert show];
        return;
    }
    
    NSArray *tags = [self lowercaseTagsForString:self.tagsTextfield.text];
    
    // Both files have finished uploading.
    
    // Create a flave object
    PFObject *flave = [PFObject objectWithClassName:kSFFlaveClassKey];
    [flave setObject:[PFUser currentUser] forKey:kSFFlaveUserKey];
    [flave setObject:self.flaveFile forKey:kSFFlavePictureKey];
    [flave setObject:self.thumbnailFile forKey:kSFFlaveThumbnailKey];
    [flave setObject:self.selectedImageSource forKey:kSFFlaveSourceTypeKey];
    [flave setObject:@0 forKey:kSFFLaveReflaveCountKey];
    [flave setObject:@NO forKey:kSFFlaveIsTrendingKey];
    
    
    // Flaves are public, but should only be modified by the person who uploaded it.
    PFACL *flaveACL = [PFACL ACLWithUser:[PFUser currentUser]];
    [flaveACL setPublicReadAccess:YES];
    flave.ACL = flaveACL;
    
    PFACL *tagACL = [PFACL ACL];
    [tagACL setPublicReadAccess:YES];
    
    // Request a background execution that allows us to upload even if the app is in the background.
    self.postFlaveBackgroundTaskID = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [[UIApplication sharedApplication] endBackgroundTask:self.postFlaveBackgroundTaskID];
    }];
    
    [flave saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            self.tagsTextfield.text = @"";
            self.tagsTextfield.alpha = 0.0f;
            self.tagsTextfield.userInteractionEnabled = NO;
            
            self.spiceItButton.enabled = NO;
            
            [[SFCache sharedCache] setAttributesForFlave:flave reflavers:[NSArray array] tags:tags reflavedByCurrentUser:NO];
            
            // Check the Tags Table for existing or non-existing tags
            PFQuery *query = [PFQuery queryWithClassName:kSFTagClassKey];
            [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                NSLog(@"%@", objects);
                
                NSMutableArray *tagNames = [NSMutableArray new];
                for (NSDictionary *currentTag in objects) {
                    [tagNames addObject:[currentTag objectForKey:kSFTagNameKey]];
                }
                
                PFRelation *tagsRelation = [[PFObject objectWithClassName:kSFTagClassKey] relationForKey:kSFFlaveTagsKey];
                
                for (int i = 0; i < tags.count; i++) {
                    if ([tagNames containsObject:[tags objectAtIndex:i]]) {
                        // If the tag already exists.
                        for (PFObject *existingTag in objects) {
                            if ([[existingTag objectForKey:kSFTagNameKey] isEqualToString:[tags objectAtIndex:i]]) {
                                [existingTag setObject:[NSNumber numberWithInt:[[existingTag objectForKey:kSFTagCountKey] integerValue] + 1] forKey:kSFTagCountKey];
                                [existingTag saveEventually];
                                
                                [tagsRelation addObject:existingTag];
                                
                                [[SFCache sharedCache] setAttributesForTag:existingTag count:[existingTag objectForKey:kSFTagCountKey] userCount:[existingTag objectForKey:kSFTagUserCountKey]];
                            }
                        }
                    } else {
                        // If the tag does not yet exist.
                        PFObject *newTag = [PFObject objectWithClassName:kSFTagClassKey];
                        [newTag setObject:[NSNumber numberWithInt:1] forKey:kSFTagCountKey];
                        [newTag setObject:[NSNumber numberWithInt:1] forKey:kSFTagUserCountKey];
                        [newTag setACL:tagACL];
                        [newTag saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                            if (succeeded) {
                                [tagsRelation addObject:newTag];
                            }
                        }];
                    }
                }
            }];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Couldn't post your flave"
                                                            message:nil
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"Dismiss", nil];
            [alert show];
            return;
        }
    }];
    
    /**
     * Parse steps end here
     */
    
    BOOL framePositionCheck = CGRectEqualToRect(self.view.frame, [[self.view superview]frame]);
    
    if (!framePositionCheck) {
        [UIView moveViewToParentViewBounds:self.view withParentView:self.view.superview withTimeInterval:SLIDE_TIMER];
        [self.tagsTextfield resignFirstResponder];
    }
}



- (void)createNewFlaveWithImageData:(NSData *)imageData
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    NSString *uniqueString = (__bridge_transfer NSString*)CFUUIDCreateString(kCFAllocatorDefault, theUUID);
    NSString *uniqueName = [NSString stringWithFormat:@"%@.jpg", uniqueString];
    
    // Create the image file for the flave.
    PFFile *imageFile = [PFFile fileWithName:uniqueName data:imageData];
}

#pragma mark - Textfield Delegate Methods

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self moveFrameToTextfield:self.tagsTextfield];
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [UIView moveViewToParentViewBounds:self.view withParentView:self.view.superview withTimeInterval:SLIDE_TIMER];
    
    return YES;
}

- (void)textFieldDidChange:(UITextField *)textField
{
    if (textField.text.length != 0) {
        self.spiceItButton.enabled = YES;
    } else {
        self.spiceItButton.enabled = NO;
    }
}

#pragma mark - Textfield animated method

- (void)moveFrameToTextfield:(UITextField *)textfield
{
    [UIView animateWithDuration:0.35
                     animations:^{
                         self.view.frame = CGRectMake(self.view.frame.origin.x,
                                                      self.view.frame.origin.y - (textfield.frame.origin.y - self.view.frame.size.height * 0.2),
                                                      self.view.frame.size.width,
                                                      self.view.frame.size.height);
                     }
                     completion:nil];
}

- (NSArray *)lowercaseTagsForString:(NSString *)string {
    NSMutableArray *lowercaseTags = [NSMutableArray array];
    NSArray *tags = [NSArray array];
    
    tags = [string componentsSeparatedByString:@","];
    
    for (NSString *tag in tags) {
        NSString *aTag = [tag lowercaseString];
        [lowercaseTags addObject:aTag];
    }
    
    tags = [NSArray arrayWithArray:lowercaseTags];
    
    return tags;
}

@end










