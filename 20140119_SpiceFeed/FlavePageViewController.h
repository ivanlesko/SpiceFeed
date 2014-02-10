//
//  FlavePageViewController.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/19/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlavePageViewController : UIViewController

@property (nonatomic, strong) PFObject *flave;

@property (weak, nonatomic) IBOutlet PFImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *reflaveLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagsLabel;

@end
