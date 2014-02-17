//
//  TrendingPageViewController.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/9/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LandingPageTitleBar.h"

#import "TrendingTableViewCell.h"
#import "CellBackground.h"

#import "Flave.h"

#import "FlaveDetailsView.h"

@protocol TrendingPageViewControllerDelegate <NSObject>

- (void)didSelectTrendingFlave:(Flave *)flave;

@end

@interface TrendingPageViewController : PFQueryTableViewController <UITableViewDataSource, UITableViewDelegate>

@property (unsafe_unretained) id <TrendingPageViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, assign) NSInteger index;

@end
