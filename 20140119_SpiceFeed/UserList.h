//
//  UserList.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/26/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface UserList : NSManagedObject

@property (nonatomic, retain) NSData * emails;
@property (nonatomic, retain) NSNumber * numberOfUsers;
@property (nonatomic, retain) NSSet *users;
@end

@interface UserList (CoreDataGeneratedAccessors)

- (void)addUsersObject:(User *)value;
- (void)removeUsersObject:(User *)value;
- (void)addUsers:(NSSet *)values;
- (void)removeUsers:(NSSet *)values;

@end
