//
//  GKSetRecAudioCommand.h
//  Goluk
//
//  Created by apple on 15/12/30.
//  Copyright © 2015年 Mobnotex. All rights reserved.
//

#import "GKSetVideoEncodeCommand.h"

/**
 *  Set the audio setting of IPC
 *  Please see GKSetVideoEncodeCommand.
 *  set audioEnabled.
    audioEnabled: NO  means disable.
                  YES means enable.
 */
@interface GKSetRecAudioCommand : GKSetVideoEncodeCommand

@end
