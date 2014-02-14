//
//  LandingPageViewController.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/9/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "LandingPageViewController.h"

@interface LandingPageViewController ()

@end

@implementation LandingPageViewController

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
    
    self.dataSource = self;
    
    self.trendingVC   = [self.storyboard instantiateViewControllerWithIdentifier:@"trendingVC"];
    self.categoriesVC = [self.storyboard instantiateViewControllerWithIdentifier:@"categoriesVC"];
    self.networkVC    = [self.storyboard instantiateViewControllerWithIdentifier:@"networkVC"];
    
    NSArray *viewControllers = @[self.trendingVC];
    [self setViewControllers:viewControllers
                                  direction:UIPageViewControllerNavigationDirectionForward
                                   animated:NO
                                 completion:nil];
    self.view.backgroundColor = [UIColor spicerDarkGrey];
    
    [self setupPageControl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Page View Controller Delegate Methods

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = 0;
    if (viewController == self.trendingVC) {
        index = self.trendingVC.index;
        self.pageControl.currentPage = index;
    } else if (viewController == self.categoriesVC) {
        index = self.categoriesVC.index;
        self.pageControl.currentPage = index;
    } else if (viewController == self.networkVC) {
        index =self.networkVC.index;
        self.pageControl.currentPage = index;
    } else {
        return nil;
    }
    
    index --;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSInteger index = 0;
    if (viewController == self.trendingVC) {
        index = self.trendingVC.index;
        self.pageControl.currentPage = index;
    } else if (viewController == self.categoriesVC) {
        index = self.categoriesVC.index;
        self.pageControl.currentPage = index;
    } else if (viewController == self.networkVC) {
        index =self.networkVC.index;
        self.pageControl.currentPage = index;
    } else {
        return nil;
    }
    
    index ++;
    
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return 3;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}

- (UIViewController *)viewControllerAtIndex:(NSInteger)index {
    
    switch (index) {
        case 0:
            self.trendingVC.index = index;
            return self.trendingVC;
            break;
            
        case 1:
            self.categoriesVC.index = index;
            return self.categoriesVC;
            break;
            
        case 2:
            self.networkVC.index = index;
            return self.networkVC;
            break;
            
        default:
            break;
    }
    
    return nil;
}

- (void)setupPageControl {
    UIView *tabBar = [[self.parentViewController.view subviews] objectAtIndex:1];
    CGFloat pageControlHeight = 20;
    CGRect pageControlRect = CGRectMake(self.view.frame.origin.x,
                                        tabBar.frame.origin.y - pageControlHeight,
                                        self.view.frame.size.width,
                                        pageControlHeight);
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:pageControlRect];
    self.pageControl.numberOfPages = 3;
    self.pageControl.currentPage = 0;
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor spicerRed];
    self.pageControl.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.pageControl];
    [self.view bringSubviewToFront:self.pageControl];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


@end






