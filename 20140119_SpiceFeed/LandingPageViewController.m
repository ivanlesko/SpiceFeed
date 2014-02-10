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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Page View Controller Delegate Methods

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger *index =  [(TrendingPageViewController *)viewController index];
    if (index == 0) {
        return nil;
    }
    
    index --;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    return nil;
}

- (UIViewController *)viewControllerAtIndex:(NSInteger)index {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    TrendingPageViewController *trendingVC = [sb instantiateViewControllerWithIdentifier:@"trendingVC"];
    
    CategoriesPageViewController *categoriesVC = [sb instantiateViewControllerWithIdentifier:@"categoriesVC"];
    
    NetworkPageViewController *networkVC = [sb instantiateViewControllerWithIdentifier:@"networkVC"];
    
    switch (index) {
        case 0:
            NSLog(@"case 1");
            return trendingVC;
            break;
            
        case 1:
            NSLog(@"case 2");
            return categoriesVC;
            break;
            
        case 2:
            NSLog(@"case 3");
            return networkVC;
            break;
            
        default:
            break;
    }
    
    return nil;
}


@end






