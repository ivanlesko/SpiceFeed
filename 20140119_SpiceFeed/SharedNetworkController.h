//
//  SharedNetworkController.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/31/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SharedNetworkController : NSObject

+ (SharedNetworkController *)sharedInstance;

- (void)fetchFlavesForUser:(PFUser *)user withCompletion:(void(^)(NSArray *flaves))completionBlock;

@end
