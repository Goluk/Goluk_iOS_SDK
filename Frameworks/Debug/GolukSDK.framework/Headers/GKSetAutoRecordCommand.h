//
//  GKSetAutoLoopCommand.h
//  Goluk
//
//  Created by apple on 15/12/29.
//  Copyright © 2015年 Mobnotex. All rights reserved.
//

#import "GKIPCCommand.h"

/**
 *  Set the loop recording state of IPC.
 *  autoRecord: NO  means disable
                YES means enable.
 */
@interface GKSetAutoRecordCommand : GKIPCCommand

@property (nonatomic, assign) BOOL autoRecord;

@end
