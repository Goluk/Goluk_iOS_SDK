//
//  GKSetTimeCommand.h
//  Goluk
//
//  Created by apple on 15/12/28.
//  Copyright © 2015年 Mobnotex. All rights reserved.
//

#import "GKIPCCommand.h"

/**
 *  Set time for IPC
 */
@interface GKSetTimeCommand : GKIPCCommand

@property (nonatomic, strong) NSDate * time;

@end
