//
//  Flave.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/26/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class FlaveList, Tag, User;

@interface Flave : NSManagedObject

@property (nonatomic, retain) NSString * flaveID;
@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSNumber * reflaves;
@property (nonatomic, retain) NSString * source;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * uploadDate;
@property (nonatomic, retain) NSSet *collections;
@property (nonatomic, retain) FlaveList *flaveList;
@property (nonatomic, retain) User *originalUploader;
@property (nonatomic, retain) NSSet *tags;
@end

@interface Flave (CoreDataGeneratedAccessors)

- (void)addCollectionsObject:(NSManagedObject *)value;
- (void)removeCollectionsObject:(NSManagedObject *)value;
- (void)addCollections:(NSSet *)values;
- (void)removeCollections:(NSSet *)values;

- (void)addTagsObject:(Tag *)value;
- (void)removeTagsObject:(Tag *)value;
- (void)addTags:(NSSet *)values;
- (void)removeTags:(NSSet *)values;

@end
