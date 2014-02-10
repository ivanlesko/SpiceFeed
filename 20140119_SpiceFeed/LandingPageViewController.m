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
    
    self.trendingVC   = [self.storyboard instantiateViewControllerWithIdentifier:@"trendingVC"];
    self.categoriesVC = [self.storyboard instantiateViewControllerWithIdentifier:@"categoriesVC"];
    self.networkVC    = [self.storyboard instantiateViewControllerWithIdentifier:@"networkVC"];
    
    self.dataSource = self;
    
    NSArray *viewControllers = @[self.trendingVC];
    [self setViewControllers:viewControllers
                                  direction:UIPageViewControllerNavigationDirectionForward
                                   animated:NO
                                 completion:nil];
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    pageControl.backgroundColor = [UIColor orangeColor];
    
    pageControl.frame = CGRectMake(pageControl.frame.origin.x,
                                   pageControl.frame.origin.y - 75,
                                   pageControl.frame.size.width,
                                   pageControl.frame.size.height);
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
    } else if (viewController == self.categoriesVC) {
        index = self.categoriesVC.index;
    } else if (viewController == self.networkVC) {
        index =self.networkVC.index;
    } else {
        return nil;
    }
    
//    NSLog(@"current index: %d", index);
    index --;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSInteger index = 0;
    if (viewController == self.trendingVC) {
        index = self.trendingVC.index;
    } else if (viewController == self.categoriesVC) {
        index = self.categoriesVC.index;
    } else if (viewController == self.networkVC) {
        index =self.networkVC.index;
    } else {
        return nil;
    }
    
//    NSLog(@"current index: %d", index);
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
            NSLog(@"case 1");
            self.trendingVC.index = index;
            return self.trendingVC;
            break;
            
        case 1:
            NSLog(@"case 2");
            self.categoriesVC.index = index;
            return self.categoriesVC;
            break;
            
        case 2:
            NSLog(@"case 3");
            self.networkVC.index = index;
            return self.networkVC;
            break;
            
        default:
            break;
    }
    
    return nil;
}


@end






