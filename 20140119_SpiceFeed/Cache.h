//
//  Cache.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/2/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cache : NSObject

+ (id)sharedCache;

- (void)clear;
- (NSDictionary *)attributesForFlave:(PFObject *)flave;
- (NSNumber *)reflaveCountForPhoto:(PFObject *)flave;
- (NSArray *)reflaversForFlave:(PFObject *)flave;
- (void)setFlaveIsReflavedByCurrentUser:(PFObject *)flave reflaved:(BOOL)reflaved;
- (BOOL)isFlaveReflavedByCurrentUser:(PFObject *)flave;
- (void)incrementReflaveCountForFlave:(PFObject *)flave;
- (void)decrementReflaveCountForFlave:(PFObject *)flave;

- (NSDictionary *)attributesForUser:(PFUser *)user;
- (NSNumber *)flaveCountForUser:(PFUser *)user;
- (BOOL)followStatusForUser:(PFUser *)user;
- (void)setFlaveCount:(NSNumber *)count user:(PFUser *)user;
- (void)setFollowStatus:(BOOL)following user:(PFUser *)user;

@end
