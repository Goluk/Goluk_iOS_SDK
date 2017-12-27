//
//  GKSetVoiceTypeCommand.h
//  Goluk
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 Mobnotex. All rights reserved.
//

#import "GKIPCCommand.h"

/**
 *  Set voice type for IPC
 *  voiceType : 0 means Chinease
                1 means English.
 */
@interface GKSetVoiceTypeCommand : GKIPCCommand

@property (nonatomic, strong) NSNumber *voiceType;

@end
