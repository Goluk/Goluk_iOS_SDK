//
//  GKGetVersionCommand.h
//  Goluk
//
//  Created by apple on 15/12/28.
//  Copyright © 2015年 Mobnotex. All rights reserved.
//

#import "GKIPCCommand.h"

/**
 *  Get the Version of IPC device.
 *  The result of this command is:
 {
    model = "1.0";
    product = "1.0";
    productname = T1;
    serial = ZTSD01611501228G;
    version = "T1_V1.3.0425.0637";
 }
 */
@interface GKGetVersionCommand : GKIPCCommand

@end
