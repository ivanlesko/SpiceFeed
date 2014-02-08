//
//  FlaveProfilePageCollectionViewCell.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/8/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "FlaveProfilePageCollectionViewCell.h"

@implementation FlaveProfilePageCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.thumbnailView = [[UIImageView alloc] initWithFrame:frame];
        
        [self.backgroundView addSubview:self.thumbnailView];
    }
    return self;
}

- (void)setFlave:(SFFlave *)flave
{
    _flave = flave;
    self.thumbnailView.image = [self.flave objectForKey:kSFFlaveThumbnailKey];
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
