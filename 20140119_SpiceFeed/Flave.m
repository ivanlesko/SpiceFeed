//
//  Flave.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/11/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "Flave.h"
#import <Parse/PFObject+Subclass.h>

@implementation Flave

@dynamic image;
@dynamic thumbnail;
@dynamic user;
@dynamic isTrending;
@dynamic reflaveCount;
@dynamic source;
@dynamic originalUploader;
@synthesize tags = _tags;

+ (NSString *)parseClassName {
    return kSFFlaveClassKey;
}

- (void)setTags:(PFRelation *)tags {
    _tags = tags;
}

- (PFRelation *)tags {
    if (!self.tags) {
        _tags = [self relationForKey:kSFFlaveTagsKey];
    }
    
    return _tags;
}

//- (void)setImage:(PFFile *)image {
//    _image = image;
//}
//
//- (PFFile *)image {
//    if (!_image) {
//        _image = [self objectForKey:kSFFlaveImageKey];
//    }
//    
//    return _image;
//}
//
//- (void)setThumbnail:(PFFile *)thumbnail {
//    _thumbnail = thumbnail;
//}
//
//- (PFFile *)thumbnail {
//    if (!_thumbnail) {
//        _thumbnail = [self objectForKey:kSFFlaveThumbnailKey];
//    }
//    
//    return _thumbnail;
//}


@end






