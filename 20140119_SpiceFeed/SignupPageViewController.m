//
//  SignupPageViewController.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/25/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "SignupPageViewController.h"


@interface SignupPageViewController ()

@end

@implementation SignupPageViewController

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
    
    self.usernameField.delegate  = self;
    self.emailField.delegate     = self;
    self.firstNameField.delegate = self;
    self.lastNameField.delegate  = self;
    self.passwordField.delegate  = self;
    self.passwordConfirmField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UIControl *aControl in self.view.subviews) {
        [aControl endEditing:YES];
    }
}

- (IBAction)performJoinSuccessSegueIfValid:(id)sender
{
    PFUser *newUser = [PFUser user];
    newUser.username = self.usernameField.text;
    newUser.password = self.passwordConfirmField.text;
    newUser.email    = self.emailField.text;
        
    // Check and make sure the user is only using a-Z and 0-9 in their usernames.
    if ([self.usernameField.text  rangeOfCharacterFromSet:[NSCharacterSet lettersAndNumbers]].location != NSNotFound ||
        [self.firstNameField.text rangeOfCharacterFromSet:[NSCharacterSet lettersAndNumbers]].location != NSNotFound ||
        [self.lastNameField.text  rangeOfCharacterFromSet:[NSCharacterSet lettersAndNumbers]].location != NSNotFound) {
        self.errorLabl.text = @"Invalid characters used.  Please use a-z and 0-9";
        NSLog(@"invalid characters");
    } else {
        // If all character checks are clean, attempt to make a new user account.
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                // If there was no error.
                [newUser setObject:self.firstNameField.text forKey:@"firstName"];
                [newUser setObject:self.lastNameField.text forKey:@"lastName"];
                [self performSegueWithIdentifier:@"joinSuccess" sender:self];
            } else {
                // If Parse threw an error.
                self.errorLabl.text = [NSString stringWithFormat:@"%ld", (long)error.code];
            }
        }];
    }
}

#pragma mark - Textfield Delegate Methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // Check to see if mandatory fields are not blank.
    if (self.usernameField.text.length != 0 &&
        self.emailField.text.length    != 0 &&
        self.passwordField.text.length != 0 &&
        self.passwordConfirmField.text.length != 0) {
            self.joinButton.enabled = YES;
    } else {
        self.joinButton.enabled = NO;
    }
    
    return YES;
}

@end











