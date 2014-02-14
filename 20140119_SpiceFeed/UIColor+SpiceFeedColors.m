//
//  UIColor+SpiceFeedColors.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/10/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "UIColor+SpiceFeedColors.h"

@implementation UIColor (SpiceFeedColors)

+ (UIColor *)spicerGrey {
    return [UIColor colorWithRed:0.113725 green:0.090196 blue:0.090196 alpha:1];
}

+ (UIColor *)spicerLightGrey {
    return [UIColor colorWithRed:0.203922 green:0.184314 blue:0.184314 alpha:1];
}

+ (UIColor *)spicerDarkGrey {
    return [UIColor colorWithRed:29.0 / 255.0
                           green:23.0 / 255.0
                            blue:23.0 / 255.0
                           alpha:1];
}

+ (UIColor *)spicerRed {
    return [UIColor colorWithRed:0.803922 green:0.000000 blue:0.207843 alpha:1];
}

+ (UIColor *)spicerBlue {
    return [UIColor colorWithRed:0.184314 green:0.564706 blue:0.752941 alpha:1];
}

@end
