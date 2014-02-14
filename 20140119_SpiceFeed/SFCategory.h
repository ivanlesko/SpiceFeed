//
//  SFCategory.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/13/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Parse/Parse.h>

@interface SFCategory : PFObject <PFSubclassing>

@property (retain) NSString *name;
@property (retain) PFRelation *flaves;

+ (NSString *)parseClassName;

@end
