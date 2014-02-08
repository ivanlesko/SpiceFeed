//
//  FlaveProfilePageCollectionViewCell.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/8/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFFlave.h"

@interface FlaveProfilePageCollectionViewCell : UICollectionViewCell

@property (nonatomic) SFFlave *flave;

@property (nonatomic, strong) UIImageView *thumbnailView;

@end
