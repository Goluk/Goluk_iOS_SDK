//
//  GKTypes.h
//  Goluk
//
//  Created by apple on 15/8/24.
//  Copyright (c) 2015年 Mobnotex. All rights reserved.
//

#ifndef Goluk_GKTypes_h
#define Goluk_GKTypes_h

typedef NS_ENUM (NSInteger, GKVideoType) {
    GKVideoLoop      = 1,       // Loop Video
    GKVideoUrgen     = 1 << 1,  // Emergency Video
    GKVideoWonderful = 1 << 2,  // Wonderful Video
};

typedef NS_ENUM(NSInteger, GKVideoQualityType)
{
    GKVideoQuality_1080P_H = 0,
    GKVideoQuality_1080P   = 1,
    GKVideoQuality_720P_H  = 2,
    GKVideoQuality_720P    = 3,
    GKVideoQuality_480P    = 4,
};

typedef NS_ENUM(NSInteger, GKBitStreamType) {
    GKBitStreamPrimary  = 0,  // Primary Stream
    GKBitStreamSub      = 1,  // Sub-Stream
};

typedef NS_ENUM(NSInteger, GKIPCConnectionState) {
    GKIPCStateDisconnected  = 1,        // IPC Disconnected
    GKIPCStateConnecting    = 2,        // IPC Connecting
    GKIPCStateConnected     = 3         // IPC Connected
};

typedef NS_ENUM(NSInteger, GKIPCDeviceType) {
    GKIPCDeviceUnknow = 0,  // Unknow
    GKIPCDeviceG1     = 1,  // G1
    GKIPCDeviceG2     = 2,  // G2
    GKIPCDeviceT1S    = 3,  // T1S, belong to Series G.
    GKIPCDeviceT1     = 4,  // T1
    GKIPCDeviceT2     = 5,  // T2
    GKIPCDeviceT3     = 6,  // T3
};

typedef NS_ENUM(NSInteger, GKIPCSeriesType) {
    GKIPCSeriesUnknow = 0,  // Unknow
    GKIPCSeriesG      = 1,  // Series G
    GKIPCSeriesT      = 2,  // Series T
};

#endif
