//
//  UIImage+Resize.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/3/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resize)

- (UIImage *)croppedImage:(CGRect)bounds;

- (UIImage *)thumbnailImage:(NSInteger)thumbnailSize
       interpolationQuality:(CGInterpolationQuality)quality;

- (UIImage *)resizedImage:(CGSize)newSize
     interpolationQuality:(CGInterpolationQuality)quality;

- (UIImage *)resizedImageWithContentMode:(UIViewContentMode)contentMode
                                  bounds:(CGSize)bounds
                    interpolationQuality:(CGInterpolationQuality)quality;

@end
