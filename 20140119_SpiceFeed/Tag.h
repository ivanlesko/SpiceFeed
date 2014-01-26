//
//  Tag.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/26/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Tag : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSManagedObject *flaves;
@property (nonatomic, retain) NSSet *users;
@property (nonatomic, retain) NSManagedObject *tagList;
@end

@interface Tag (CoreDataGeneratedAccessors)

- (void)addUsersObject:(NSManagedObject *)value;
- (void)removeUsersObject:(NSManagedObject *)value;
- (void)addUsers:(NSSet *)values;
- (void)removeUsers:(NSSet *)values;

@end
