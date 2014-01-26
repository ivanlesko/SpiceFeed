//
//  Followers.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/26/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Followers : NSManagedObject

@property (nonatomic, retain) NSNumber * count;
@property (nonatomic, retain) NSSet *users;
@end

@interface Followers (CoreDataGeneratedAccessors)

- (void)addUsersObject:(NSManagedObject *)value;
- (void)removeUsersObject:(NSManagedObject *)value;
- (void)addUsers:(NSSet *)values;
- (void)removeUsers:(NSSet *)values;

@end
