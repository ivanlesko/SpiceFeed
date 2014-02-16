//
//  LandingPageTitleBar.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/15/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "LandingPageTitleBar.h"

@implementation LandingPageTitleBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0
                                               green:0
                                                blue:0
                                               alpha:0.8];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x,
                                                                    frame.origin.y + 25.0f,
                                                                    frame.size.width,
                                                                    20.0f)];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.text = @"Missing";
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:20.0f];
        
        [self addSubview:self.titleLabel];
        
    }
    return self;
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
