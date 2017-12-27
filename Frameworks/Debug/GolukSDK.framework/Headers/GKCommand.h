//
//  GKCommand.h
//  Goluk
//
//  Created by apple on 16/1/14.
//  Copyright © 2016年 Mobnotex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GKCommand : NSObject

@property (nonatomic, assign, readonly) NSInteger  mID;
@property (nonatomic, assign, readonly) NSInteger  timeout;
@property (nonatomic, assign, readonly) NSUInteger cmd;
@property (nonatomic, assign, readonly) BOOL       noNeedCallBack;

@property (nonatomic, copy,   readonly, nullable) NSString   * parameter;
@property (nonatomic, copy,   readonly, nullable) NSString   * cmdName;

@property (nonatomic, copy, nonnull) void(^commandStart)(void);
@property (nonatomic, copy, nonnull) void(^commandProgress)(_Nullable id info);
@property (nonatomic, copy, nonnull) void(^commandFinish)(_Nullable id info);
@property (nonatomic, copy, nonnull) void(^commandError)(NSError * _Nullable error);

- (void)send;

- (nullable id)handleOriginResponse:(nullable id)originData;

@end
