//
//  LandingPageViewController.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/9/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TrendingPageViewController.h"
#import "CategoriesPageViewController.h"
#import "NetworkPageViewController.h"

@interface LandingPageViewController : UIPageViewController <UIPageViewControllerDataSource>

@property (nonatomic, strong) TrendingPageViewController   *trendingVC;
@property (nonatomic, strong) CategoriesPageViewController *categoriesVC;
@property (nonatomic, strong) NetworkPageViewController    *networkVC;

@end
