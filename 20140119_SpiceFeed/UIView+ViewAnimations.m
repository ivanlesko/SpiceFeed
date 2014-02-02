//
//  UIView+ViewAnimations.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/1/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "UIView+ViewAnimations.h"

@implementation UIView (ViewAnimations)

+ (void)moveViewToParentViewBounds:(UIView *)childView withParentView:(UIView *)parentView withTimeInterval:(NSTimeInterval)theInterval
{
    [UIView animateWithDuration:theInterval
                     animations:^{
                         childView.frame = parentView.frame;
                     }
                     completion:nil];
}

@end
