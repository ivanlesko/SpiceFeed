//
//  LandingPageViewController.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/9/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LandingPageTitleBar.h"

#import "TrendingPageViewController.h"
#import "CategoriesPageViewController.h"
#import "NetworkPageViewController.h"

#import "FlaveDetailsView.h"

@interface LandingPageViewController : UIPageViewController <UIPageViewControllerDataSource, TrendingPageViewControllerDelegate>

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) TrendingPageViewController   *trendingVC;
@property (nonatomic, strong) CategoriesPageViewController *categoriesVC;
@property (nonatomic, strong) NetworkPageViewController    *networkVC;

@property (nonatomic, strong) LandingPageTitleBar *titleBar;

@end
