//
//  EmailResendConfirmationViewController.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/22/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "EmailResendConfirmationViewController.h"

@interface EmailResendConfirmationViewController ()

@end

@implementation EmailResendConfirmationViewController

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

- (IBAction)doneButton:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
