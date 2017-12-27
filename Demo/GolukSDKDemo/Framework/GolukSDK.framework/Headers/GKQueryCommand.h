//
//  GKQueryCommand.h
//  Goluk
//
//  Created by apple on 15/12/30.
//  Copyright © 2015年 Mobnotex. All rights reserved.
//

#import "GKIPCCommand.h"
#import "GKTypes.h"

/**
 *  Query the list of video file in IPC device
 *  the result of this command as below:
 {
    items =     (
    {
        id = 3245235;
        location = "NRM_20160601141612_stream0_1_000_TX_1_0179.mp4";
        period = 179;
        resolution = 1080p;
        size = "277.5242967605";
        time = 1464761772;
        timestamp = 20160601141612;
        type = 1;
        withGps = 0;
        withSnapshot = 1;
        withThumb = 1;
    },
    {
        id = 3245235;
        location = "NRM_20160601141912_stream0_1_000_TX_1_0179.mp4";
        period = 179;
        resolution = 1080p;
        size = "277.6988077163";
        time = 1464761952;
        timestamp = 20160601141912;
        type = 1;
        withGps = 0;
        withSnapshot = 1;
        withThumb = 1;
    }
    );
    total = 2;
 }
 *
 */
@interface GKQueryCommand : GKIPCCommand

@property (nonatomic, assign) GKVideoType type;
@property (nonatomic, assign) NSInteger   limitCount;
@property (nonatomic, strong) NSDate      *  startTime;
@property (nonatomic, strong) NSDate      *  endTime;

@end
