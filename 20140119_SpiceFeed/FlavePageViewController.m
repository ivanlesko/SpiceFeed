//
//  FlavePageViewController.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/19/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "FlavePageViewController.h"

@interface FlavePageViewController ()

@end

@implementation FlavePageViewController

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
	
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.image.file = [self.flave objectForKey:kSFFlaveImageKey];
    [self.image loadInBackground:^(UIImage *image, NSError *error) {
        if (!error) {
            
        }
    }];
    
    PFUser *uploader = [self.flave objectForKey:kSFFlaveUserKey];
    NSLog(@"uploader: %@", uploader);
//    NSString *username = [uploader objectForKey:kSFUserUserNameKey];
//    NSLog(@"username: %@", username);
    
//    self.userLabel.text = [self.flave objectForKey:kSFFlaveUserKey];
//    self.reflaveLabel.text = [self.flave objectForKey:kSFFLaveReflaveCountKey];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
