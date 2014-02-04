//
//  ParseUtilities.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/4/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParseUtilities : NSObject

+ (ParseUtilities *)sharedInstance;

- (void)setupAPIkeys;

@end
