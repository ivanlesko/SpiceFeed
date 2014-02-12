//
//  TrendingCollectionViewCell.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/10/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrendingCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) PFObject *flave;
@property (nonatomic, weak) IBOutlet PFImageView *imageView;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@end
