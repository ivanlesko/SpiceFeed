//
//  SFCategory.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/13/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "SFCategory.h"
#import <Parse/PFObject+Subclass.h>

@implementation SFCategory

@dynamic name;
@synthesize flaves = _flaves;

+ (NSString *)parseClassName {
    return kSFCategoryClassKey;
}

- (void)setFlaves:(PFRelation *)flaves {
    _flaves = flaves;
}

- (PFRelation *)flaves {
    if (!self.flaves) {
        _flaves = [self relationForKey:kSFCategoryFlavesKey];
    }
    
    return _flaves;
}

@end
