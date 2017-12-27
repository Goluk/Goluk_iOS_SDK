//
//  GKGetFunctionCommand.h
//  Goluk
//
//  Created by apple on 15/12/29.
//  Copyright © 2015年 Mobnotex. All rights reserved.
//

#import "GKIPCCommand.h"

/**
 *  Get funcions for some IPC settings.
 *  You can get the list as below:
 {
    AutoRotation = 1;
    Dormant = 1;
    DriveFatigue = 1;
    MoveMonitor = 0;
    RecLight = 0;
    RecbySec = 0;
    SecurityLight = 0;
    WifiLight = 0;
 }
 */
@interface GKGetFunctionCommand : GKIPCCommand

@end
