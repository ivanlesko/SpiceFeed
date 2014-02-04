//
//  Cache.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/2/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFCache : NSObject

+ (id)sharedCache;

- (void)clear;

// Flave Info
- (void)setAttributesForFlave:(PFObject *)flave reflavers:(NSArray *)reflavers tags:(NSArray *)tags reflavedByCurrentUser:(BOOL)reflavedByCurrentUser;
- (NSDictionary *)attributesForFlave:(PFObject *)flave;
- (NSNumber *)reflaveCountForPhoto:(PFObject *)flave;
- (NSArray *)reflaversForFlave:(PFObject *)flave;
- (NSNumber *)tagCountForPhoto:(PFObject *)flave;
- (NSArray *)tagsForFlave:(PFObject *)flave;
- (void)setFlaveIsReflavedByCurrentUser:(PFObject *)flave reflaved:(BOOL)reflaved;
- (BOOL)isFlaveReflavedByCurrentUser:(PFObject *)flave;
- (void)incrementReflaveCountForFlave:(PFObject *)flave;
- (void)decrementReflaveCountForFlave:(PFObject *)flave;

// User Info
- (void)setAttributesForUser:(PFUser *)user flaveCount:(NSNumber *)count followedByCurrentUser:(BOOL)following;
- (NSDictionary *)attributesForUser:(PFUser *)user;
- (NSNumber *)flaveCountForUser:(PFUser *)user;
- (BOOL)followStatusForUser:(PFUser *)user;
- (void)setFlaveCount:(NSNumber *)count user:(PFUser *)user;
- (void)setFollowStatus:(BOOL)following user:(PFUser *)user;

// Tag Info
- (void)setAttributesForTag:(PFObject *)tag count:(NSNumber *)count userCount:(NSNumber *)userCount;
- (NSDictionary *)attributesForTag:(PFObject *)tag;
- (NSNumber *)countForTag:(PFObject *)tag;
- (NSNumber *)userCountForTag:(PFObject *)tag;

@end
