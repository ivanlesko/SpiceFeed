//
//  NetworkPageViewController.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/9/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NetworkPageViewController : UIViewController <UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, assign) NSInteger index;

@end
