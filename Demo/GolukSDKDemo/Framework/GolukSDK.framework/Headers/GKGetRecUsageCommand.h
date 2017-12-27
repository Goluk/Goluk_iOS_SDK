//
//  GKGetRecUsageCommand.h
//  Goluk
//
//  Created by apple on 15/12/29.
//  Copyright © 2015年 Mobnotex. All rights reserved.
//

#import "GKIPCCommand.h"

/**
 *  Get the sd card usage.
 *  The result of this command as below:
 {
    SDCardActive = 1;
    isSpaceTooSmall = 0;
    leftSize = 8786;
    normalRecQuota = 22824;
    normalRecSize = 21491;
    picQuota = 1521;
    picSize = 0;
    totalSdSize = 30435;
    urgentRecQuota = 3651;
    urgentRecSize = 78;
    userFilesSize = 21649;
    wonderfulRecQuota = 2434;
    wonderfulRecSize = 75;
 }
 
 totalSdSize: All the size of the sd card.
 userFilesSize: Used size of the sd card.
 */
@interface GKGetRecUsageCommand : GKIPCCommand

@end
