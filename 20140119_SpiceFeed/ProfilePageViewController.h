//
//  ProfilePageViewController.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/19/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ProfilePageCollectionViewCell.h"

@interface ProfilePageViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;

@property (nonatomic, strong) NSMutableArray *userFlaves;
@property (weak, nonatomic) IBOutlet UIView *profileInfoView;

@property (nonatomic, strong) NSOperationQueue *backgroundQueue;

@end
