//
//  CategoriesPageViewController.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/9/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CategoryCollectionViewCell.h"

@interface CategoriesPageViewController : PFQueryTableViewController

@property (nonatomic, assign) NSInteger index;
@property (strong, nonatomic) IBOutlet UITableView *tableView;



@end
