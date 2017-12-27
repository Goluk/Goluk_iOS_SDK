//
//  GKGetVideoConfigCommand.h
//  Goluk
//
//  Created by apple on 15/12/28.
//  Copyright © 2015年 Mobnotex. All rights reserved.
//

#import "GKIPCCommand.h"
#import "GKTypes.h"

/**
 *  Get the video config setting of IPC device.
 {
 audioEnabled = 1;
 bitrate = 10240;
 bitstreams = 0;
 frameRate = 30;
 resolution = 1080P;
 }
 */
@interface GKGetVideoConfigCommand : GKIPCCommand

@property (nonatomic, assign) GKBitStreamType bitStreamType;

@end
