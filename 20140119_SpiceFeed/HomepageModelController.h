//
//  HomepageModelController.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/19/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HomeNetworkViewController.h"
#import "HomeTrendingViewController.h"
#import "HomeCategoriesViewController.h"

@interface HomepageModelController : NSObject

@property (nonatomic, weak) UIPageViewController *pageViewController;

@end
