//
//  GKSetVideoEncodeConfigCommand.h
//  GolukSDK
//
//  Created by Gang Liu on 2017/9/25.
//  Copyright © 2017年 Goluk. All rights reserved.
//

#import "GKIPCCommand.h"
#import "GKTypes.h"

@interface GKSetVideoConfigCommand : GKIPCCommand

/**
 Only take effect in 10 to 30
 */
@property (nonatomic, assign) NSInteger frameRate;
@property (nonatomic, assign) NSInteger bitrate;
@property (nonatomic, assign) GKBitStreamType bitStreamType;
/**
 1. The resolution value must be GKVideoQuality_480P when bitStreamType is GKBitStreamSub
 2. The resolution value must be GKVideoQuality_1080P_H|GKVideoQuality_1080P|GKVideoQuality_720P_H|GKVideoQuality_720P
    when bitStreamType is GKBitStreamPrimary
 */
@property (nonatomic, assign) GKVideoQualityType resolution;

@end
