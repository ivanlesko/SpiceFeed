//
//  LoginPageController.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/19/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "LoginPageController.h"

@interface LoginPageController ()

@end

@implementation LoginPageController

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
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.emailField.delegate = self;
    self.passwordField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    // Hide the nav bar on the login page.  No reason for it to be there on the landing page.
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    self.view.backgroundColor = [UIColor spicerGrey];
}

- (void)viewWillDisappear:(BOOL)animated
{
    // Reveal the navigation bar when the landing page will disappear.
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Dismiss keyboards.
    for (UIControl *aControl in self.view.subviews) {
        [aControl endEditing:YES];
    }
}

- (IBAction)performLoginSuccessSegueIfValid:(id)sender
{
    [PFUser logInWithUsernameInBackground:self.emailField.text
                                 password:self.passwordField.text
                                    block:^(PFUser *user, NSError *error)
    {
        NSLog(@"login error");
        // If there was no error, login.
        if (!error) {
            [self performSegueWithIdentifier:@"login" sender:self];
        }
    }];
}

#pragma mark - Textfield delegate methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (self.emailField.text.length != 0 &&
        self.passwordField.text.length != 0) {
        // If the user has entered account information, enable the login button.
        self.loginButton.enabled = YES;
    }
    
    return YES;
}

@end












