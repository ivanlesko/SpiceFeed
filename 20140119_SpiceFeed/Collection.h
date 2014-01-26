//
//  Collection.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/26/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Flave, User;

@interface Collection : NSManagedObject

@property (nonatomic, retain) NSDate * dateCreated;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * numberOfImages;
@property (nonatomic, retain) NSSet *flaves;
@property (nonatomic, retain) User *owner;
@end

@interface Collection (CoreDataGeneratedAccessors)

- (void)addFlavesObject:(Flave *)value;
- (void)removeFlavesObject:(Flave *)value;
- (void)addFlaves:(NSSet *)values;
- (void)removeFlaves:(NSSet *)values;

@end
