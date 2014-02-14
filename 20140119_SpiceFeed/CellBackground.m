//
//  CellBackground.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/13/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "CellBackground.h"

@implementation CellBackground

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextFillRect(context, self.bounds);
}


@end
