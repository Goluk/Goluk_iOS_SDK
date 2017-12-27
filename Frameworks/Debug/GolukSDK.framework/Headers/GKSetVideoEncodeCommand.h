//
//  GKSetVideoEncodeCommand.h
//  Goluk
//
//  Created by apple on 15/12/30.
//  Copyright © 2015年 Mobnotex. All rights reserved.
//

#import "GKIPCCommand.h"

@interface GKSetVideoEncodeCommand : GKIPCCommand

@property (nonatomic, strong) NSNumber * videoQuality;
@property (nonatomic, strong) NSNumber * audioEnabled;

- (NSDictionary *)dictParameter;

@end
