//
//  HomePageControllerViewController.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/19/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HomeNetworkViewController.h"
#import "HomeTrendingViewController.h"
#import "HomeCategoriesViewController.h"

#import "HomepageModelController.h"

@interface HomePageControllerViewController : UIViewController <UIPageViewControllerDelegate>

@property (nonatomic, strong) UIPageViewController *pageViewController;

- (IBAction)startWalkthrough:(id)sender;
//@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;


@end
