//
//  AddFlavePageViewController.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/29/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "AddFlavePageViewController.h"

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

- (IBAction)spiceItButtonPushed:(id)sender {
}

#pragma mark - Action Sheet Delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.delegate = self;
    
    if (buttonIndex == 0) {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    } else if (buttonIndex == 1) {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    
    [self presentViewController:self.imagePicker
                       animated:YES
                     completion:nil];
}

#pragma mark - Image Picker Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self.imagePicker dismissViewControllerAnimated:YES completion:^{
        // Enable the upload button after the user selects and image.
        self.spiceItButton.enabled = YES;
        
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
    }];
    
    NSLog(@"%@", info);
}

- (IBAction)spiceItPushed:(id)sender
{
    [self saveNewFlaveWIthImageData:self.selectedImageData];
}

- (void)saveNewFlaveWIthImageData:(NSData *)imageData
{
    // If there is image data.
    if (imageData) {
        // Create the image file for the flave.
        PFFile *imageFile = [PFFile fileWithName:@"newFlave.jpg" data:imageData];
        
        // Save the image file.
        [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            
            PFObject *newFlave = [PFObject objectWithClassName:@"Flave"];
            newFlave[@"uploader"] = [[PFUser currentUser] objectForKey:@"username"];
            newFlave[@"image"] = imageFile;
            newFlave[@"reflaveCount"] = @0;
            newFlave[@"isTrending"] = NO;
            newFlave.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
            
            if (![self.tagsTextfield.text isEqualToString:@""]) {
                [newFlave setObject:self.tagsTextfield.text forKey:@"tags"];
            }
            // Save the new Flave.
            [newFlave saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (!error) {
                    PFRelation *relation = [[PFUser currentUser] relationForKey:@"flaves"];
                    [relation addObject:newFlave];
                    
                    // Update the user's flaveCount to match the current amount.
                    PFQuery *query = [PFUser query];
                    
                    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                        PFRelation *flaveRelation = [[PFUser currentUser] relationForKey:@"flaves"];
                        [[flaveRelation query] findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
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
                            }
                        }];
                    }];
                }
                else {
                    NSLog(@"Error: %@", error.localizedDescription);
                    NSLog(@"Error: %@", error.debugDescription);
                }
            }];
        }];
    } else {
        NSLog(@"No image data passed to method.");
    }
}

#pragma mark - Textfield Delegate Methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}


@end










