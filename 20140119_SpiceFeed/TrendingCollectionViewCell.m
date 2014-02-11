//
//  TrendingCollectionViewCell.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/10/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "TrendingCollectionViewCell.h"

@implementation TrendingCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setFlave:(PFObject *)flave {
    _flave = flave;
    
    self.image = [[PFImageView alloc] initWithFrame:self.frame];
    self.image.contentMode = UIViewContentModeScaleAspectFill;
    
    self.image.file = _flave[kSFFlaveImageKey];
    [self.image loadInBackground];
    
    [self addSubview:self.image];
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
