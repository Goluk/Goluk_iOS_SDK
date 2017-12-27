//
//  GKSDKEngine.h
//  GolukSDK
//
//  Created by apple on 16/5/27.
//  Copyright © 2016年 Goluk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GKIPCCommand;

@interface GKSDKEngine : NSObject

/**
 *  Register app to Goluk.
 */
+ (void)registerApp:(NSString*)appId;

/**
 *  Parse the videoName to local video path.
 */
+ (NSString *)parseToLocalVideoPath:(NSString *)videoName;

/**
 *  Parse the videoName to remote video url.
 */
+ (NSString *)parseToRemoteVideoUrl:(NSString *)videoName;

/**
 *  Parse the videoName to snapshot name.
 */
+ (NSString *)parseToSnapshotName:(NSString *)videoName;

/**
 *  Parse the videoName to local snapshot path.
 */
+ (NSString *)parseToLocalSnapshotPath:(NSString *)videoName;

@end

