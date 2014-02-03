//
//  Constants.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/2/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "Constants.h"

#pragma mark - NSUserDefaults
NSString *const kSFUserDefaultsActivityFeddViewControllerLastRefreshKey = @"com.Parse.SpiceFeed.userDefaults.activityFeedViewController.lastRefresh";

#pragma mark - Launch URLs
NSString *const kSFLaunchURLHostTakePicture;

#pragma mark - NSNotification
NSString *const SFAppDelegateApplicationDidReceiveRemoteNotification              = @"com.parse.SpiceFeed.appDelegate.applicationDidReceiveRemoteNotification";
NSString *const SFUtilityUserFollowingChangedNotification                         = @"com.parse.SpiceFeed.utility.userFollowingChanged";
NSString *const SFUtilityUserReflavedUnflavedFlaveCallbackFinishedNotification    = @"com.parse.SpiceFeed.utility.userReflavedUnflavedFlavePhotoCallbackFinished";
NSString *const SFUtilityDidFinishProcessingProfilePictureNotification            = @"com.parse.SpiceFeed.utility.didFinishProcessingProfilePictureNotification";
NSString *const SFTabBarControllerDidFinishEditingFlaveNotification               = @"com.parse.SpiceFeed.tabBarController.didFinishEditingFlave";            /** tabBarController may cause issues. */
NSString *const SFTabBarControllerDidFinishFlaveFileUploadNotification            = @"com.parse.SpiceFeed.tabBarController.didFinishFlaveUploadNotification"; /** tabBarController may cause issues. */
NSString *const SFFlaveDetailsViewControllerUserDeletedFlaveNotification          = @"com.parse.SpiceFeed.flaveDetailsViewController.userDeletedFlave";
NSString *const SFFlaveDetailsViewControllerUserReflavedUnflavedFlaveNotification = @"com.parse.SpiceFeed.flaveDetailsViewController.userReflavedUnflavedFlaveInFlaveDetailsViewNotification";

#pragma mark - User Info Keys
NSString *const SFFlaveDetailsViewControllerUserReflavedUnflavedFlaveNotificationUserInfoReflavedKey = @"reflaved";

#pragma mark - Installation Class

// Field Keys
NSString *const kSFInstallationUserKey = @"user"; /** May cause issues.  Might have to use user or username for key */

#pragma mark - PFObject Activity Class
// Class key
NSString *const kSFActivityClassKey = @"Activity";

// Field keys
NSString *const kSFActivityTypeKey      = @"type";
NSString *const kSFActivityFromUserKey  = @"fromUser";
NSString *const kSFActivityToUserKey    = @"toUser";
NSString *const kSFActivityContentKey   = @"content";
NSString *const kSFActivityFlaveKey     = @"flave";

// Type values
NSString *const kSFActivityTypeReflave  = @"reflave";
NSString *const kSFActivityTypeFollow   = @"follow";
NSString *const kSFActivityTypeJoined   = @"joined";

#pragma mark - PFObject User Class

// Field keys
NSString *const kSFUserDisplayNameKey                         = @"displayName";
NSString *const kSFUserFacebookIDKey                          = @"facebookID";
NSString *const kSFUserPhotoIDKey                             = @"photoID";
NSString *const kSFUserProfilePicSmallKey                     = @"profilePictureSmall";
NSString *const kSFUserProfilePicMediumKey                    = @"profilePictureMedium";
NSString *const kSFUserFacebookFriendsKey                     = @"facebookFriends";
NSString *const kSFUserAlreadyAutoFollowedFacebookFriendsKey  = @"userAlreadyAutoFollowedFacebookFriends";

#pragma mark - PFObject Flave Class

// Class key
NSString *const kSFFlaveClassKey = @"Flave";

// Field keys
NSString *const kSFFlavePictureKey     = @"image";
NSString *const kSFFlaveThumbnailKey   = @"thumbnail";
NSString *const kSFFlaveUserKey        = @"user"; /** This may need to be username. */
NSString *const kSFFlaveOpenGraphIDKey = @"fbOpenGraphID";

#pragma mark - PFObject Tags Class

// Class key
NSString *const kSFTagClassKey  = @"Tag";

// Field keys
NSString *const kSFTagNameKey      = @"name";
NSString *const kSFTagCountKey     = @"count";
NSString *const kSFTagUserCountKey = @"userCount";

#pragma mark - Cached Photo Attributes
// keys
NSString *const kSFFlaveAttributesIsReflavedByCurrentUserKey = @"isReflavedByCurrentUser";
NSString *const kSFFlaveAttributesReflavesCountKey           = @"reflaveCount";
NSString *const kSFFlaveAttributesReflaversKey               = @"reflavers";

#pragma mark - Cached User Attributes
// keys
NSString *const kSFUserAttributesFlaveCountKey               = @"flaveCount";
NSString *const kSFUserAttributesIsFollowedByCurrentUserKey  = @"isFollowedByCurrentUser";

#pragma mark - PFPush Notification Payload keys

NSString *const kSFNSAlertKey = @"alert";
NSString *const kSFNSBadgeKey = @"badge";
NSString *const kSFNSSoundKey = @"sound";

NSString *const kSFPushPayloadPayloadTypeKey         = @"p";
NSString *const kSFPushPayloadPayloadActivityTypeKey = @"a";

NSString *const kSFPushPayloadActivityTypeKey        = @"t";
NSString *const kSFPushPayloadActivityReflaveKey     = @"l";
NSString *const kSFPushPayloadActivityFollowKey      = @"f";

NSString *const kSFPushPayloadFromUserObjectIDKey    = @"fu";
NSString *const kSFPushPayloadToUserObjectIDkey      = @"tu";
NSString *const kSFPushPayloadFlaveObjectIDKey       = @"pid";











