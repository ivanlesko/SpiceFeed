//
//  Flave.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/11/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Parse/Parse.h>

@interface Flave : PFObject <PFSubclassing>

@property (retain) PFFile *image;
@property (retain) PFFile *thumbnail;
@property (retain) PFUser *user;
@property (retain) NSNumber *isTrending;
@property (retain) NSNumber *reflaveCount;
@property (retain) NSString *source;
@property (retain) NSString *originalUploader;
@property (retain) PFRelation *tags;

+ (NSString *)parseClassName;

@end
