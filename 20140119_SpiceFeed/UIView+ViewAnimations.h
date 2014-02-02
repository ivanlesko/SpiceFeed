//
//  UIView+ViewAnimations.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/1/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ViewAnimations)

+ (void)moveViewToParentViewBounds:(UIView *)childView withParentView:(UIView *)parentView withTimeInterval:(NSTimeInterval)theInterval;

@end
