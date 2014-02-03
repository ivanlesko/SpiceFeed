//
//  Constants.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/2/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - NSUserDefaults
extern NSString *const kSFUserDefaultsActivityFeddViewControllerLastRefreshKey;

#pragma mark - Launch URLs
extern NSString *const kSFLaunchURLHostTakePicture;

#pragma mark - NSNotification
extern NSString *const SFAppDelegateApplicationDidReceiveRemoteNotification;
extern NSString *const SFUtilityUserFollowingChangedNotification;
extern NSString *const SFUtilityUserReflavedUnflavedFlaveCallbackFinishedNotification;
extern NSString *const SFUtilityDidFinishProcessingProfilePictureNotification;
extern NSString *const SFTabBarControllerDidFinishEditinFlaveNotification;
extern NSString *const SFTabBarControllerDidFinishFlaveFileUploadNotification;
extern NSString *const SFFlaveDetailsViewControllerUserDeletedFlaveNotification;
extern NSString *const SFFlaveDetailsViewControllerUserReflavedUnflavedFlaveNotification;

#pragma mark - User Info Keys
extern NSString *const SFFlaveDetailsViewControllerUserReflavedUnflavedFlaveNotificationUserInfoReflavedKey;

#pragma mark - Installation Class

// Field Keys
extern NSString *const kSFInstallationUserKey;

#pragma mark - PFObject Activity Class
// Class key
extern NSString *const kSFActivityClassKey;

// Field keys
extern NSString *const kSFActivityTypeKey;
extern NSString *const kSFActivityFromUserKey;
extern NSString *const kSFActivityToUserKey;
extern NSString *const kSFActivityContentKey;
extern NSString *const kSFActivityFlaveKey;

// Type values
extern NSString *const kSFActivityTypeReflave;
extern NSString *const kSFActivityTypeFollow;
extern NSString *const kSFActivityTypeJoined;

#pragma mark - PFObject User Class

// Field keys
extern NSString *const kSFUserDisplayNameKey;
extern NSString *const kSFUserFacebookIDKey;
extern NSString *const kSFUserPhotoIDKey;
extern NSString *const kSFUserProfilePicSmallKey;
extern NSString *const kSFUserProfilePicMediumKey;
extern NSString *const kSFUserFacebookFriendsKey;
extern NSString *const kSFUserAlreadyAutoFollowedFacebookFriendsKey;

#pragma mark - PFObject Flave Class

// Class key
extern NSString *const kSFFlaveClassKey;

// Field keys
extern NSString *const kSFFlavePictureKey;
extern NSString *const kSFFlaveThumbnailKey;
extern NSString *const kSFFlaveUserKey;
extern NSString *const kSFFlaveOpenGraphIDKey;

#pragma mark - PFObject Tags Class

// Class key
extern NSString *const kSFTagClassKey;

// Field keys
extern NSString *const kSFTagNameKey;
extern NSString *const kSFTagCountKey;
extern NSString *const kSFTagUserCountKey;

#pragma mark - Cached Photo Attributes
// keys
extern NSString *const kSFFlaveAttributesIsReflavedByCurrentUserKey;
extern NSString *const kSFFlaveAttributesReflavesCountKey;
extern NSString *const kSFFlaveAttributesReflaversKey;

#pragma mark - Cached User Attributes
// keys
extern NSString *const kSFUserAttributesFlaveCountKey;
extern NSString *const kSFUserAttributesIsFollowedByCurrentUserKey;

#pragma mark - PFPush Notification Payload keys

extern NSString *const kSFNSAlertKey;
extern NSString *const kSFNSBadgeKey;
extern NSString *const kSFNSSoundKey;

extern NSString *const kSFPushPayloadPayloadTypeKey;
extern NSString *const kSFPushPayloadPayloadActivityTypeKey;

extern NSString *const kSFPushPayloadActivityTypeKey;
extern NSString *const kSFPushPayloadActivityReflaveKey;
extern NSString *const kSFPushPayloadActivityFollowKey;

extern NSString *const kSFPushPayloadFromUserObjectIDKey;
extern NSString *const kSFPushPayloadToUserObjectIDkey;
extern NSString *const kSFPushPayloadFlaveObjectIDKey;


















