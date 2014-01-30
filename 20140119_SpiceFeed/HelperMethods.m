//
//  HelperMethods.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/30/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "HelperMethods.h"

@implementation HelperMethods

+ (void)enableDismissKeyboardsOnTouchInView:(UIView *)theView
{
    for (UIControl *aControl in theView.subviews) {
        [aControl resignFirstResponder];
    }
}

@end
