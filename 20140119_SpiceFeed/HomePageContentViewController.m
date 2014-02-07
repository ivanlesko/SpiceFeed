//
//  HomePageContentViewController.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/6/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "HomePageContentViewController.h"

@interface HomePageContentViewController ()

@end

@implementation HomePageContentViewController

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
    
    self.titleLabel.text = self.titleText;
    self.backgroundImageView.image = [UIImage imageNamed:self.imageFile];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
