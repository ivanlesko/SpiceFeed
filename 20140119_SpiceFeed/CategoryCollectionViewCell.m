//
//  CategoryCollectionViewCell.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/11/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "CategoryCollectionViewCell.h"

@implementation CategoryCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        NSLog(@"calling init cell");
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"setting cell through init with style");
    }
    
    return self;
}


//- (void)drawRect:(CGRect)rect
//{
//   
//}


@end
