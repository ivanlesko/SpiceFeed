//
//  FlaveDetailsView.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/16/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "FlaveDetailsView.h"

@implementation FlaveDetailsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.blurRadius = 40.0f;
        self.dynamic = NO;
        self.tintColor  = [UIColor clearColor];
        
        self.backgroundColor = [UIColor colorWithRed:0
                                               green:0
                                                blue:0
                                               alpha:0.8];
        
        UITapGestureRecognizer *dismissTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissView)];
        [self addGestureRecognizer:dismissTap];
        
        // Gives the view a dark tint.
        UIView *darkOverlay = [[UIView alloc] initWithFrame:frame];
        darkOverlay.backgroundColor = [UIColor colorWithRed:0
                                                      green:0
                                                       blue:0
                                                      alpha:0.6];
        [self addSubview:darkOverlay];
        
    }
    return self;
}

- (void)dismissView {
    [UIView animateWithDuration:0.3f
                     animations:^{
                         self.alpha = 0.0f;
                     }
                     completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
}

@end
