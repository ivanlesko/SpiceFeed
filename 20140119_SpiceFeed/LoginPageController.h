//
//  LoginPageController.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/19/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginPageController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

- (IBAction)performLoginSuccessSegueIfValid:(id)sender;

@end
