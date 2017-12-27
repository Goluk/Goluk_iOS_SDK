//
//  GKQuerySingleCommand.h
//  Goluk
//
//  Created by apple on 15/12/30.
//  Copyright © 2015年 Mobnotex. All rights reserved.
//

#import "GKIPCCommand.h"

/**
 *  Query a specific file in IPC device.
 *  The result of this command as below:
 {
    id = 3245235;
    location = "NRM_20160601134603_stream0_1_000_TX_1_0179.mp4";
    period = 179;
    resolution = 1080p;
    size = "277.7306318283";
    time = 1464759963;
    timestamp = 20160601134603;
    total = 1;
    type = 1;
    withGps = 0;
    withSnapshot = 1;
    withThumb = 1;
 }
 */
@interface GKQuerySingleCommand : GKIPCCommand

@property (nonatomic, copy) NSString * videoName;

@end
