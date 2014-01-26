//
//  User.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/26/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Followers, Tag;

@interface User : NSManagedObject

@property (nonatomic, retain) NSNumber * active;
@property (nonatomic, retain) NSDate * dateJoined;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSNumber * followerCount;
@property (nonatomic, retain) NSNumber * friendCount;
@property (nonatomic, retain) NSDate * lastLogin;
@property (nonatomic, retain) NSDate * lastLogout;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * portfolioPage;
@property (nonatomic, retain) NSData * profilePic;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSSet *collections;
@property (nonatomic, retain) NSSet *favoriteTags;
@property (nonatomic, retain) Followers *followers;
@property (nonatomic, retain) NSManagedObject *friends;
@property (nonatomic, retain) NSSet *flaves;
@property (nonatomic, retain) NSManagedObject *userList;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addCollectionsObject:(NSManagedObject *)value;
- (void)removeCollectionsObject:(NSManagedObject *)value;
- (void)addCollections:(NSSet *)values;
- (void)removeCollections:(NSSet *)values;

- (void)addFavoriteTagsObject:(Tag *)value;
- (void)removeFavoriteTagsObject:(Tag *)value;
- (void)addFavoriteTags:(NSSet *)values;
- (void)removeFavoriteTags:(NSSet *)values;

- (void)addFlavesObject:(NSManagedObject *)value;
- (void)removeFlavesObject:(NSManagedObject *)value;
- (void)addFlaves:(NSSet *)values;
- (void)removeFlaves:(NSSet *)values;

@end
