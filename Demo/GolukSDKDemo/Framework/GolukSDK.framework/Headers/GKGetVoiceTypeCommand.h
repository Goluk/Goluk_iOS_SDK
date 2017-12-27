//
//  GKGetVoiceTypeCommand.h
//  Goluk
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 Mobnotex. All rights reserved.
//

#import "GKIPCCommand.h"

/**
 *  Get the Voice type setting of IPC device.
 *  The result of this command as below:
 {
    type = 1;
 }
 type 1 means English.
      0 means Chinese.
 */
@interface GKGetVoiceTypeCommand : GKIPCCommand

@end
