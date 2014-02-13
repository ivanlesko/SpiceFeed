//
//  TrendingPageViewController.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/9/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TrendingTableViewCell.h"

#import "Flave.h"

@interface TrendingPageViewController : PFQueryTableViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSString *parseClassName;

@property (nonatomic, assign) NSInteger index;

@property (nonatomic, strong) NSMutableArray *trendingFlaves;

@end
