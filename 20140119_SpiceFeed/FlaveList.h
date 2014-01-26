//
//  FlaveList.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/26/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface FlaveList : NSManagedObject

@property (nonatomic, retain) NSNumber * numberOfFlaves;
@property (nonatomic, retain) NSSet *flaves;
@end

@interface FlaveList (CoreDataGeneratedAccessors)

- (void)addFlavesObject:(NSManagedObject *)value;
- (void)removeFlavesObject:(NSManagedObject *)value;
- (void)addFlaves:(NSSet *)values;
- (void)removeFlaves:(NSSet *)values;

@end
