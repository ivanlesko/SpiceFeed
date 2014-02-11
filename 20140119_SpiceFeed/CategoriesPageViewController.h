//
//  CategoriesPageViewController.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/9/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoriesPageViewController : UIViewController <UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, assign) NSInteger index;

@end