//
//  SharedNetworkController.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/31/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "SharedNetworkController.h"

@implementation SharedNetworkController

+ (SharedNetworkController *)sharedInstance
{
    static dispatch_once_t pred;
    static SharedNetworkController *shared = nil;
    
    dispatch_once(&pred, ^{
        shared = [[SharedNetworkController alloc] init];
    });
    return shared;
}

@end
