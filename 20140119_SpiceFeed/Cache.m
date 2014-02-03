//
//  Cache.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/2/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "Cache.h"

@interface Cache()

@property (nonatomic, strong) NSCache *cache;

@end

@implementation Cache

+ (id)sharedCache
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    
    return _sharedObject;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.cache = [[NSCache alloc] init];
    }
    
    return self;
}

- (void)clear
{
    [self.cache removeAllObjects];
}

- (void)setAttributesForFlave:(PFObject *)flave reflavers:(NSArray *)reflavers reflavedByCurrentUser:(BOOL)reflavedByCurrentUser
{
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [NSNumber numberWithBool:reflavedByCurrentUser], kSFFlaveAttributesIsReflavedByCurrentUserKey,
                                @([reflavers count]), kSFFlaveAttributesReflavesCountKey,
                                reflavers, kSFFlaveAttributesReflaversKey,
                                nil];
    
    [self setAttributes:attributes forFlave:flave];
}

- (NSDictionary *)attributesForFlave:(PFObject *)flave
{
    NSString *key = [self keyForFlave:flave];
    
    return [self.cache objectForKey:key];
}

- (NSNumber *)reflaveCountForPhoto:(PFObject *)flave
{
    NSDictionary *attributes = [self attributesForFlave:flave];
    if (attributes) {
        return [attributes objectForKey:kSFFlaveAttributesReflavesCountKey];
    }
    
    return [NSNumber numberWithInt:0];
}

- (NSArray *)reflaversForFlave:(PFObject *)flave
{
    NSDictionary *attributes = [self attributesForFlave:flave];
    if (attributes) {
        return [attributes objectForKey:kSFFlaveAttributesReflaversKey];
    }
    
    return [NSArray array];
}

- (void)setFlaveIsReflavedByCurrentUser:(PFObject *)flave reflaved:(BOOL)reflaved
{
    NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithDictionary:[self attributesForFlave:flave]];
    [attributes setObject:[NSNumber numberWithBool:reflaved] forKey:kSFFlaveAttributesIsReflavedByCurrentUserKey];
    [self setAttributes:attributes forFlave:flave];
}

- (BOOL)isFlaveReflavedByCurrentUser:(PFObject *)flave
{
    NSDictionary *attributes = [self attributesForFlave:flave];
    if (attributes) {
        return [[attributes objectForKey:kSFFlaveAttributesIsReflavedByCurrentUserKey] boolValue];
    }
    
    return NO;
}

- (void)incrementReflaveCountForFlave:(PFObject *)flave
{
    NSNumber *reflaverCount = [NSNumber numberWithInteger:[[self reflaveCountForPhoto:flave] intValue] + 1];
    NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithDictionary:[self attributesForFlave:flave]];
    [attributes setObject:reflaverCount forKey:kSFFlaveAttributesReflavesCountKey];
    [self setAttributes:attributes forFlave:flave];
}

- (void)decrementReflaveCountForFlave:(PFObject *)flave
{
    NSNumber *reflaverCount = [NSNumber numberWithInteger:[[self reflaveCountForPhoto:flave] intValue] - 1];
    NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithDictionary:[self attributesForFlave:flave]];
    [attributes setObject:reflaverCount forKey:kSFFlaveAttributesReflavesCountKey];
    [self setAttributes:attributes forFlave:flave];
}

- (void)setAttributesForUser:(PFUser *)user flaveCount:(NSNumber *)count followedByCurrentUser:(BOOL)following
{
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                count, kSFUserAttributesFlaveCountKey,
                                [NSNumber numberWithBool:following], kSFUserAttributesIsFollowedByCurrentUserKey,
                                nil];
    [self setAttributes:attributes forUser:user];
}

- (NSDictionary *)attributesForUser:(PFUser *)user
{
    NSString *key = [self keyForUser:user];
    return [self.cache objectForKey:key];
}

- (NSNumber *)flaveCountForUser:(PFUser *)user
{
    NSDictionary *attributes = [self attributesForUser:user];
    if (attributes) {
        NSNumber *flaveCount = [attributes objectForKey:kSFUserAttributesFlaveCountKey];
        return flaveCount;
    }
    
    return [NSNumber numberWithInt:0];
}

- (BOOL)followStatusForUser:(PFUser *)user
{
    NSDictionary *attributes = [self attributesForUser:user];
    if (attributes) {
        NSNumber *followerStatus = [attributes objectForKey:kSFUserAttributesIsFollowedByCurrentUserKey];
        return followerStatus;
    }
    
    return NO;
}

- (void)setFlaveCount:(NSNumber *)count user:(PFUser *)user
{
    NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithDictionary:[self attributesForUser:user]];
    [attributes setObject:[NSNumber numberWithBool:count] forKey:kSFUserAttributesFlaveCountKey];
    [self setAttributes:attributes forUser:user];
}

- (void)setFollowStatus:(BOOL)following user:(PFUser *)user
{
    NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithDictionary:[self attributesForUser:user]];
    [attributes setObject:[NSNumber numberWithBool:following] forKey:kSFUserAttributesIsFollowedByCurrentUserKey];
    [self setAttributes:attributes forUser:user];
}

#pragma mark - ()

- (void)setAttributes:(NSDictionary *)attributes forFlave:(PFObject *)flave
{
    NSString *key = [self keyForFlave:flave];
    [self.cache setObject:attributes forKey:key];
}

- (void)setAttributes:(NSDictionary *)attributes forUser:(PFUser *)user
{
    NSString *key = [self keyForUser:user];
    [self.cache setObject:attributes forKey:key];
}


- (NSString *)keyForFlave:(PFObject *)flave{
    return [NSString stringWithFormat:@"flave_%@", [flave objectId]];
}

- (NSString *)keyForUser:(PFUser *)user{
    return [NSString stringWithFormat:@"user_%@", [user objectId]];
}


@end




















