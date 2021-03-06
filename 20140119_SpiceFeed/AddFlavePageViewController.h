//
//  AddFlavePageViewController.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/29/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddFlavePageViewController : SFViewController <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *tagsTextfield;
@property (weak, nonatomic) IBOutlet UIButton *spiceItButton;

@property (nonatomic, strong) UIActionSheet *actionSheet;
@property (nonatomic, strong) UIImagePickerController *imagePicker;

@property (weak, nonatomic) IBOutlet UIImageView *selectedImage;
@property (nonatomic, strong) NSString *selectedImageSource;
@property (nonatomic, strong) NSData *selectedImageData;

@property (nonatomic, strong) PFFile *flaveFile;
@property (nonatomic, strong) PFFile *thumbnailFile;
@property (nonatomic) CGSize imageSize;
@property (nonatomic, assign) UIBackgroundTaskIdentifier fileUploadBackgroundTaskID;
@property (nonatomic, assign) UIBackgroundTaskIdentifier postFlaveBackgroundTaskID;

- (IBAction)addFlavePushed:(id)sender;
- (IBAction)spiceItButtonPushed:(id)sender;

- (BOOL)shouldUploadImage:(UIImage *)image;

@end
