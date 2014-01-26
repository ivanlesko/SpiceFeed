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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)performJoinSuccessSegueIfValid:(id)sender
{
    PFUser *newUser = [PFUser user];
    newUser.username = self.usernameField.text;
    newUser.password = self.passwordConfirmField.text;
    newUser.email    = self.emailField.text;
    
    // Check and make sure the user is only using a-Z and 0-9 in their usernames.
    if ([self.usernameField.text  rangeOfCharacterFromSet:[NSCharacterSet illegalCharacterSet]].location == NSNotFound ||
        [self.firstNameField.text rangeOfCharacterFromSet:[NSCharacterSet illegalCharacterSet]].location == NSNotFound ||
        [self.lastNameField.text  rangeOfCharacterFromSet:[NSCharacterSet illegalCharacterSet]].location == NSNotFound) {
        self.errorLabl.text = @"Invalid characters used.  Please use a-z and 0-9";
    } else {
        // If all character checks are clean, attempt to make a new user account.
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                // If there was no error.
                [self performSegueWithIdentifier:@"joinSuccess" sender:self];
            } else {
                // If Parse threw an error.
                self.errorLabl.text = [NSString stringWithFormat:@"%d", error.code];
            }
        }];
    }
}
@end











