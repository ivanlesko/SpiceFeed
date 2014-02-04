//
//  ParseUtilities.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/4/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "ParseUtilities.h"


@implementation ParseUtilities

+ (ParseUtilities *)sharedInstance
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    
    return _sharedObject;
}

- (id)init {
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (void)setupAPIkeys {
    [Parse setApplicationId:@"4EQeSriecIvi5kYcRRk0cTEsjOj8aNtI115HOoNe"
                  clientKey:@"LESHLEU9pyjg4u5mZDUIAWguDTCSlhxIuiqKHpIA"];
}

@end
