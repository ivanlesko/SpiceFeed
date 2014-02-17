//
//  FlaveDetailsPageViewController.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/16/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "FlaveDetailsPageViewController.h"

@interface FlaveDetailsPageViewController ()

@end

@implementation FlaveDetailsPageViewController

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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UITapGestureRecognizer *dismissTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideDetailsView)];
    [self.view addGestureRecognizer:dismissTap];
}

- (void)hideDetailsView {
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
