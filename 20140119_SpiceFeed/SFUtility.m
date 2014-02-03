//
//  Utility.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/3/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "SFUtility.h"

@implementation SFUtility

#pragma mark - Utilities
#pragma mark - Reflave Photos

+ (void)reflavedFlaveInBackground:(id)flave block:(void (^)(BOOL succeeded, NSError *error))completionBlock {
    PFQuery *queryExistingReflaves = [PFQuery queryWithClassName:kSFActivityClassKey];
    [queryExistingReflaves whereKey:kSFActivityFlaveKey equalTo:flave];
    [queryExistingReflaves whereKey:kSFActivityTypeKey equalTo:kSFActivityTypeReflave];
    [queryExistingReflaves whereKey:kSFActivityFromUserKey equalTo:[PFUser currentUser]];
    [queryExistingReflaves setCachePolicy:kPFCachePolicyNetworkOnly];
    [queryExistingReflaves findObjectsInBackgroundWithBlock:^(NSArray *activities, NSError *error) {
        if (!error) {
            for (PFObject *activity in activities) {
                [activities delete:activity];
            }
        }
        
        // Proceed to creating new likes
        PFObject *likeActivity = [PFObject objectWithClassName:kSFActivityClassKey];
        [likeActivity setObject:kSFActivityTypeReflave               forKey:kSFActivityTypeKey];
        [likeActivity setObject:[PFUser currentUser]                 forKey:kSFActivityFromUserKey];
        [likeActivity setObject:[flave objectForKey:kSFFlaveUserKey] forKey:kSFActivityToUserKey];
        [likeActivity setObject:flave forKey:kSFActivityFlaveKey];
        
        PFACL *likeACL = [PFACL ACLWithUser:[PFUser currentUser]];
        [likeACL setPublicReadAccess:YES];
        [likeACL setWriteAccess:YES forUser:[flave objectForKey:kSFFlaveUserKey]];
        likeActivity.ACL = likeACL;
        
        [likeActivity saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (completionBlock) {
                completionBlock(succeeded, error);
            }
            
            // Refresh Cache
            PFQuery *query = [self queryForActivitiesOnFlave:flave cachePolicy:kPFCachePolicyNetworkOnly];
            [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                if (!error) {
                    
                    NSMutableArray *reflavers = [NSMutableArray array];
                    
                    BOOL isReflavedByCurrentUser = NO;
                    
                    for (PFObject *activity in objects) {
                        if ([[activity objectForKey:kSFActivityTypeKey] isEqualToString:kSFActivityTypeReflave] && [activity objectForKey:kSFActivityFromUserKey]) {
                            [reflavers addObject:[activity objectForKey:kSFActivityFromUserKey]];
                        }
                        
                        if ([[[activity objectForKey:kSFActivityFromUserKey] objectId] isEqualToString:[[PFUser currentUser] objectId]]) {
                            if ([[activity objectForKey:kSFActivityTypeKey] isEqualToString:kSFActivityTypeReflave]) {
                                isReflavedByCurrentUser = YES;
                            }
                        }
                    }
                    
                    [[SFCache sharedCache] setAttributesForFlave:flave reflavers:reflavers reflavedByCurrentUser:isReflavedByCurrentUser];
                }
                
                [[NSNotificationCenter defaultCenter] postNotificationName:SFUtilityUserReflavedUnflavedFlaveCallbackFinishedNotification
             object:flave
           userInfo:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:succeeded]
                                                forKey:SFFlaveDetailsViewControllerUserReflavedUnflavedFlaveNotificationUserInfoReflavedKey]];
            }];
        }];
    }];
}

+ (void)unflavedFlaveInBackground:(id)flave block:(void (^)(BOOL succeeded, NSError *error))completionBlock {
    PFQuery *queryExistingReflaves = [PFQuery queryWithClassName:kSFActivityClassKey];
    [queryExistingReflaves whereKey:kSFActivityFlaveKey equalTo:flave];
    [queryExistingReflaves whereKey:kSFActivityTypeKey equalTo:kSFActivityTypeReflave];
    [queryExistingReflaves whereKey:kSFActivityFromUserKey equalTo:[PFUser currentUser]];
    [queryExistingReflaves setCachePolicy:kPFCachePolicyNetworkOnly];
    [queryExistingReflaves findObjectsInBackgroundWithBlock:^(NSArray *activities, NSError *error) {
        if (!error) {
            for (PFObject *activity in activities) {
                [activities delete:activity];
            }
        }
        
        if (completionBlock) {
            completionBlock(YES, nil);
        }
        
        // Refresh Cache
        PFQuery *query = [SFUtility queryForActivitiesOnFlave:flave cachePolicy:kPFCachePolicyNetworkOnly];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                
                NSMutableArray *reflavers = [NSMutableArray array];
                
                BOOL isReflavedByCurrentUser = NO;
                
                for (PFObject *activity in objects) {
                    if ([[activity objectForKey:kSFActivityTypeKey] isEqualToString:kSFActivityTypeReflave]) {
                        [reflavers addObject:[activity objectForKey:kSFActivityFromUserKey]];
                    }
                    
                    // Is the current activity's users ID equal to the current user's object ID?
                    if ([[[activity objectForKey:kSFActivityFromUserKey] objectId] isEqualToString:[[PFUser currentUser] objectId]]) {
                        if ([[activity objectForKey:kSFActivityTypeKey] isEqualToString:kSFActivityTypeReflave]) {
                            isReflavedByCurrentUser = YES;
                        }
                    }
                }
                
                [[SFCache sharedCache] setAttributesForFlave:flave reflavers:reflavers reflavedByCurrentUser:isReflavedByCurrentUser];
                
            }
            
            [[NSNotificationCenter defaultCenter] postNotificationName:SFUtilityUserReflavedUnflavedFlaveCallbackFinishedNotification
                                    object:flave
                    userInfo:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO]
                                           forKey:SFFlaveDetailsViewControllerUserReflavedUnflavedFlaveNotificationUserInfoReflavedKey]];
            
        }];
    }];
}

+ (BOOL)userHasProfilePicture:(PFUser *)user {
    return YES;
}

+ (NSString *)displayNameForUser:(PFUser *)user {
    return @"";
}

+ (void)followUserInBackground:(PFUser *)user block:(void (^)(BOOL succeeded, NSError *error))completionBlock {
    
}

+ (void)followUserEventually:(PFUser *)user block:(void (^)(BOOL succeeded, NSError *error))completionBlock {
    
}

+ (void)followUsersEventually:(NSArray *)users block:(void (^)(BOOL succeeded, NSError *error))completionBlock {
    
}

+ (void)unfollowUserEventually:(PFUser *)user {
    
}

+ (void)unfollowUsersEventually:(NSArray *)users
{
    
}

#pragma mark - Activities

+ (PFQuery *)queryForActivitiesOnFlave:(PFObject *)flave cachePolicy:(PFCachePolicy)cachePolicy {
    PFQuery *queryReflaves = [PFQuery queryWithClassName:kSFActivityClassKey];
    [queryReflaves whereKey:kSFActivityFlaveKey equalTo:flave];
    [queryReflaves whereKey:kSFActivityTypeKey equalTo:kSFActivityTypeReflave];
    
    PFQuery *query = [PFQuery orQueryWithSubqueries:@[queryReflaves]];
    [query setCachePolicy:cachePolicy];
    [query includeKey:kSFActivityFromUserKey];
    [query includeKey:kSFActivityFlaveKey];
    
    return query;
}

@end











