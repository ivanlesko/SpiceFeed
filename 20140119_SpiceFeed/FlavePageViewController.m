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
    
    self.userLabel.text = [NSString stringWithFormat:@"flaved by %@", [self.flave objectForKey:kSFFlaveOriginalUploaderKey]];
    self.reflaveLabel.text = [NSString stringWithFormat:@"%@ reflaves", [self.flave objectForKey:kSFFLaveReflaveCountKey]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closePage:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end





