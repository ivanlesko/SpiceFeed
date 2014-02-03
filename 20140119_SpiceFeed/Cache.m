//
//  Cache.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/2/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "Cache.h"

@interface Cache()

@property (nonatomic, strong) NSCache *cache;

@end

@implementation Cache

+ (id)sharedCache
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    
    return _sharedObject;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.cache = [[NSCache alloc] init];
    }
    
    return self;
}

- (void)clear
{
    [self.cache removeAllObjects];
}

@end
