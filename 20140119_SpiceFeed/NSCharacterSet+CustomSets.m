//
//  NSCharacterSet+CustomSets.m
//  MorseTorch
//
//  Created by Ivan Lesko on 1/20/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "NSCharacterSet+CustomSets.h"

@implementation NSCharacterSet (CustomSets)

+ (NSCharacterSet *)illegalSetForMorseCode
{
    return [[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789 "] invertedSet];
}

@end
