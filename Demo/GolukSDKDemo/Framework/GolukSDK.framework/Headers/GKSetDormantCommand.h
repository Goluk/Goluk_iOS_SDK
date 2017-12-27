//
//  GKSetDormantCommand.h
//  Goluk
//
//  Created by apple on 16/1/4.
//  Copyright © 2016年 Mobnotex. All rights reserved.
//

#import "GKIPCCommand.h"

/**
 *  Set the dormant of IPC
 *  enable:  NO  means disable
             YES means enable.
 */
@interface GKSetDormantCommand : GKIPCCommand

@property (nonatomic, assign) BOOL enable;

@end
