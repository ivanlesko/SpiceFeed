//
//  AddFlavePageViewController.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/29/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "AddFlavePageViewController.h"

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
        CGSize dimensions = image.size;
        
        if (dimensions.height > dimensions.width) {
            
            /**
             * FIX THESE CONTEXT SIZES.
             * THEY ARE JUST PLACEHOLDERS
             * IMAGE CONTEXT SHOULD REFLECT THE ASPECT
             * RATIO OF THE SELECTED IMAGE
             **/
            
            // If the image is portrait.
            UIGraphicsBeginImageContext(CGSizeMake(640, 960));
            [image drawInRect:CGRectMake(0, 0, 640, 960)];
        } else if (dimensions.width > dimensions.height) {
            // If the image is landscape.
            UIGraphicsBeginImageContext(CGSizeMake(960, 640));
            [image drawInRect:CGRectMake(0, 0, 960, 640)];
        } else {
            // If the image is square.
            UIGraphicsBeginImageContext(CGSizeMake(640, 640));
            [image drawInRect:CGRectMake(0, 0, 640, 640)];
        }
        
        // Resize Image
        UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        // Place compressed image onto the screen.
        self.selectedImage.image = smallImage;
        NSData *imageData = UIImageJPEGRepresentation(smallImage, 0.7f);
        self.selectedImageData = imageData;
        
        self.selectedImage.alpha = 0.0f;
        [UIView animateWithDuration:0.4
                         animations:^{
                             self.selectedImage.alpha = 1.0f;
                             self.tagsTextfield.alpha = 1.0f;
                             self.tagsTextfield.userInteractionEnabled = YES;
                         }];
    }];
}

- (IBAction)spiceItButtonPushed:(id)sender
{
    [self saveNewFlaveWIthImageData:self.selectedImageData];
    
    BOOL framePositionCheck = CGRectEqualToRect(self.view.frame, [[self.view superview]frame]);
    
    if (!framePositionCheck) {
        [UIView moveViewToParentViewBounds:self.view withParentView:self.view.superview withTimeInterval:SLIDE_TIMER];
        [self.tagsTextfield resignFirstResponder];
    }
}

- (void)saveNewFlaveWIthImageData:(NSData *)imageData
{
    self.tagsTextfield.text = @"";
    
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    NSString *uniqueString = (__bridge_transfer NSString*)CFUUIDCreateString(kCFAllocatorDefault, theUUID);
    NSString *uniqueName = [NSString stringWithFormat:@"%@.jpg", uniqueString];
    
    // Create the image file for the flave.
    PFFile *imageFile = [PFFile fileWithName:uniqueName data:imageData];
    
    // Save the image file.
    [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            PFObject *newFlave = [PFObject objectWithClassName:@"Flave"];
            newFlave[@"uploader"] = [[PFUser currentUser] objectForKey:@"username"];
            newFlave[@"image"] = imageFile;
            newFlave[@"source"] = self.selectedImageSource;
            newFlave[@"reflaveCount"] = @0;
            newFlave[@"isTrending"] = @NO;
            newFlave.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
            
            [newFlave saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (!error) {
                    NSArray *tags = [NSArray new];
                    tags = [self.tagsTextfield.text componentsSeparatedByString:@","];
                    newFlave[@"tags"] = tags;
                    
                    for (NSString *newTag in tags) {
                        PFObject *tag = [PFObject objectWithClassName:@"Tag"];
                        tag[@"name"] = newTag;
                        tag[@"user"] = [[PFUser currentUser] objectForKey:@"username"];
                        [tag saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                            if (!error) {
                                // Tag saved okay.
                            } else {
                                NSLog(@"Tag Save Error: %@", error.localizedDescription);
                                NSLog(@"Tag Save Error: %@", error.debugDescription);
                            }
                        }];
                    }
                    
                    PFRelation *relation = [[PFUser currentUser] relationForKey:@"flaves"];
                    [relation addObject:newFlave];
                    
                    // Update the user's flaveCount to match the current amount.
                    PFQuery *query = [PFUser query];
                    
                    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                        if (!error) {
                            NSLog(@"%d", objects.count);
                            [[PFUser currentUser] setObject:@(objects.count) forKey:@"flaveCount"];
                            NSLog(@"%d", [[[PFUser currentUser] objectForKey:@"flaveCount"] intValue]);
                            
                            [[PFUser currentUser] saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                                if (!error) {
                                    
                                } else {
                                    NSLog(@"Update User Error: %@", error.localizedDescription);
                                    NSLog(@"Update User Error: %@", error.debugDescription);
                                }
                                self.selectedImage.image = [UIImage imageNamed:@"imagePlaceholder.png"];
                                self.spiceItButton.enabled = NO;
                            }];
                        } else {
                            NSLog(@"%@", error.localizedDescription);
                            NSLog(@"%@", error.debugDescription);
                        }
                    }];
                }
                else {
                    NSLog(@"Error: %@", error.localizedDescription);
                    NSLog(@"Error: %@", error.debugDescription);
                }
            }];
        } else {
            NSLog(@"ImageFile Error: %@", error.localizedDescription);
            NSLog(@"ImageFile Error: %@", error.debugDescription);
        }
    }];
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


@end










