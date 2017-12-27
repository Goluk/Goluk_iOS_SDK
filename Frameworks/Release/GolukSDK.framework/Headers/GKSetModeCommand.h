//
//  GKSetModeCommand.h
//  Goluk
//
//  Created by apple on 15/12/27.
//  Copyright © 2015年 Mobnotex. All rights reserved.
//

#import "GKIPCCommand.h"
#import "GKTypes.h"

@interface GKSetModeCommand : GKIPCCommand

@property (nonatomic, assign) GKIPCSeriesType seriesType;

@end
