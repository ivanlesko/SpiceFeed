//
//  TrendingCollectionViewCell.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/10/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "TrendingTableViewCell.h"

@implementation TrendingTableViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"initing cell");
    }
    return self;
}

- (void)setFlaveImageView:(PFImageView *)flaveImageView {
    _flaveImageView = flaveImageView;
    NSLog(@"setting flave image view");
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
