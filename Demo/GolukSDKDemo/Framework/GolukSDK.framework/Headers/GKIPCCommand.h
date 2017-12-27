//
//  GKIPCCommand.h
//  Goluk
//
//  Created by apple on 15/12/24.
//  Copyright © 2015年 Mobnotex. All rights reserved.
//

#import "GKCommand.h"

@interface GKIPCCommand : GKCommand

#pragma mark - 子类重写，处理数据

@end

/**
 *  命令返回拦截协议
 */
@protocol GKIPCCommandIntercept <NSObject>

@optional

- (BOOL)isFinishWithResponse:(nullable id)response;

- (BOOL)isProgressWithResponse:(nullable id)response;

@end

/**
 *  文件下载
 */
@protocol GKIPCCommandOperationFileDownloadProtocol <NSObject>

@end
