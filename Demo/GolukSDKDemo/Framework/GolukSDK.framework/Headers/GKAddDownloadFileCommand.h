//
//  GKAddDownloadFileCommand.h
//  Goluk
//
//  Created by apple on 15/12/30.
//  Copyright © 2015年 Mobnotex. All rights reserved.
//

#import "GKIPCCommand.h"
#import "GKTypes.h"

/**
 *  Download video.
 */
@interface GKAddDownloadFileCommand : GKIPCCommand <GKIPCCommandOperationFileDownloadProtocol>

@property (nonatomic, assign) GKVideoType videoType;
/**
 *  videoName or picName! Only one!
 */
@property (nonatomic, copy  ) NSString    * videoName;
@property (nonatomic, copy  ) NSString    * picName;

@end
