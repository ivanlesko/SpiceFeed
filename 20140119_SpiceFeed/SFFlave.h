//
//  SFFlave.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/8/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Parse/Parse.h>

@class SFFlave;

@protocol SFFlaveDelegate <NSObject>

- (void)didFinishDownloadingImageForFlave:(PFObject *)flave;
- (void)didFinishDownloadingThumbnailForFlave:(PFObject *)flave;

@end

@interface SFFlave : PFObject

@property (nonatomic, strong) UIImage  *image;
@property (nonatomic, strong) UIImage  *thumbnail;
@property (nonatomic, strong) PFObject *user;
@property (nonatomic, strong) NSMutableArray *tags;
@property (nonatomic, assign) NSUInteger reflaveCount;
@property (nonatomic) BOOL isTrending;
@property (nonatomic) BOOL isDownloading;

@property (unsafe_unretained) id <SFFlaveDelegate> delegate;

- (void)downloadImageOnQueue:(NSOperationQueue *)queue;
- (void)downloadThumbnailOnQueue:(NSOperationQueue *)queue;

@end
