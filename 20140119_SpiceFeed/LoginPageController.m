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
	// Do any additional setup after loading the view.
    
    PFObject *newUser = [PFObject objectWithClassName:@"User"];
    [newUser setObject:@"mail@ivanlesko.com" forKey:@"email"];
    [newUser setObject:@"Ivan" forKey:@"firstName"];
    [newUser setObject:@"Lesko" forKey:@"lastName"];
    [newUser setObject:@"Ivan Lesko" forKey:@"fullName"];
    [newUser setObject:@"treeflood" forKey:@"username"];
    [newUser setObject:@"http://www.ivanlesko.com" forKey:@"websiteURL"];
    [newUser saveInBackground];

    
    PFObject *newFlave = [PFObject objectWithClassName:@"Flave"];
    newFlave[@"source"] = @"http://www.visualspicer.com";
    newFlave[@"tags"] = @"papercraft, logo, design";
    newFlave[@"uploader"] = newUser[@"username"];
    newFlave[@"reflaves"] = @(15);
    
    [newFlave saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error) {
            NSLog(@"%@", [error localizedDescription]);
        } else {
            NSLog(@"success.");
        }
    }];
    
//    PFQuery *query = [PFQuery queryWithClassName:@"Flave"];
//    [query getObjectInBackgroundWithId:@"Xg1Tsg7kPb" block:^(PFObject *object, NSError *error) {
//        NSLog(@"");
//    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
