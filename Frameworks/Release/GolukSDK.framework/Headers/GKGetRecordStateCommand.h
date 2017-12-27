//
//  GKGetRecordStateCommand.h
//  Goluk
//
//  Created by apple on 15/12/29.
//  Copyright © 2015年 Mobnotex. All rights reserved.
//

#import "GKIPCCommand.h"

/**
 *  Get the loop recording state of IPC.
 the result of this command as below:
 {
    channels = 1;
    status = 0;
 }
 
 status: 0 means the IPC device closed the loop recording setting.
         1 means opend.
 */
@interface GKGetRecordStateCommand : GKIPCCommand

@end
