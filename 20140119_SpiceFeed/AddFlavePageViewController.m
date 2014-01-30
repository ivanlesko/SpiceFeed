//
//  AddFlavePageViewController.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/29/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "AddFlavePageViewController.h"

@interface AddFlavePageViewController ()

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
    } else {
        NSLog(@"unknown button pressed");
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
        [self saveNewFlaveWIthImageData:imageData];
    }];
    
    NSLog(@"%@", info);
}

- (void)saveNewFlaveWIthImageData:(NSData *)imageData
{
    if (self.selectedImage.image) {
        PFObject *newFlave = [PFObject objectWithClassName:@"Flave"];
        [newFlave setObject:[[PFUser currentUser] objectForKey:@"username"] forKey:@"uploader"];
        [newFlave setObject:imageData forKey:@"imageData"];
        [newFlave setObject:@(0) forKey:@"reflaveCount"];
        if (![self.tagsTextfield.text isEqualToString:@""]) {
            [newFlave setObject:self.tagsTextfield.text forKey:@"tags"];
        }
        
        [newFlave saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                self.selectedImage.image = [UIImage imageNamed:@"imagePlaceholder.png"];
                self.spiceItButton.enabled = NO;
            }
            
            if (error) {
                NSLog(@"Error: %@", error.localizedDescription);
                NSLog(@"Error: %@", error.debugDescription);
            }
        }];
    }
}

- (IBAction)spiceItPushed:(id)sender
{

}


@end










