//
//  Utility.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/3/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFUtility : NSObject

+ (void)reflavedFlaveInBackground:(id)flave block:(void (^)(BOOL succeeded, NSError *error))completionBlock;
+ (void)unflavedFlaveInBackground:(id)flave block:(void (^)(BOOL succeeded, NSError *error))completionBlock;

+ (BOOL)userHasProfilePicture:(PFUser *)user;

+ (NSString *)displayNameForUser:(PFUser *)user;

+ (void)followUserInBackground:(PFUser *)user block:(void (^)(BOOL succeeded, NSError *error))completionBlock;
+ (void)followUserEventually:(PFUser *)user block:(void (^)(BOOL succeeded, NSError *error))completionBlock;
+ (void)followUsersEventually:(NSArray *)users block:(void (^)(BOOL succeeded, NSError *error))completionBlock;

+ (void)unfollowUserEventually:(PFUser *)user;
+ (void)unfollowUsersEventually:(NSArray *)users;

+ (PFQuery *)queryForActivitiesOnFlave:(PFObject *)flave cachePolicy:(PFCachePolicy)cachePolicy;

@end
