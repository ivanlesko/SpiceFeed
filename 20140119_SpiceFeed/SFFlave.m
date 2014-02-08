//
//  SFFlave.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/8/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "SFFlave.h"

@implementation SFFlave

@synthesize image, thumbnail, user, tags, isTrending, reflaveCount, isDownloading, delegate;

- (id)init {
    self = [super init];
    if (self) {
        isDownloading = NO;
    }
    
    return self;
}

- (void)downloadImageOnQueue:(NSOperationQueue *)queue {
    self.isDownloading = YES;
    [queue addOperationWithBlock:^{
        NSData *imageData = [self objectForKey:kSFFlaveImageKey];
        self.image = [UIImage imageWithData:imageData];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.isDownloading = NO;
            [self.delegate didFinishDownloadingImageForFlave:self];
        }];
        
    }];
}

- (void)downloadThumbnailOnQueue:(NSOperationQueue *)queue {
    self.isDownloading = YES;
    [queue addOperationWithBlock:^{
        NSData *thumbnailData = [self objectForKey:kSFFlaveThumbnailKey];
        self.thumbnail = [UIImage imageWithData:thumbnailData];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.isDownloading = NO;
            [self.delegate didFinishDownloadingThumbnailForFlave:self];
        }];
    }];
}

@end
