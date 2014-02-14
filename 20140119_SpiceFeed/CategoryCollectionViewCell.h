//
//  CategoryCollectionViewCell.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/11/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryCollectionViewCell : PFTableViewCell
@property (weak, nonatomic) IBOutlet PFImageView *categoryImageView;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;



@end
