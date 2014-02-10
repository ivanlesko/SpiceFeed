//
//  ProfilePageCollectionViewCell.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/9/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "ProfilePageCollectionViewCell.h"

@implementation ProfilePageCollectionViewCell

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
    
    self.thumbnail.file = [_flave objectForKey:kSFFlaveThumbnailKey];
    [self.thumbnail loadInBackground];
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
