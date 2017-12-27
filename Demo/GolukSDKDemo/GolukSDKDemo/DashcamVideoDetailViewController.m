//
//  DashcamVideoDetailViewController.m
//  GolukSDKDemo
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 Goluk. All rights reserved.
//

#import "DashcamVideoDetailViewController.h"
#import <GolukSDK/GolukSDK.h>
#import <MediaPlayer/MediaPlayer.h>
#import "SVProgressHUD/SVProgressHUD.h"

@interface DashcamVideoDetailViewController ()

@property (nonatomic, weak) IBOutlet UILabel * nameLabel;
@property (nonatomic, weak) IBOutlet UILabel * periodLabel;
@property (nonatomic, weak) IBOutlet UILabel * resolutionLabel;
@property (nonatomic, weak) IBOutlet UILabel * sizeLabel;
@property (nonatomic, weak) IBOutlet UILabel * timeLabel;
@property (nonatomic, weak) IBOutlet UILabel * downloadProgressLabel;
@property (nonatomic, weak) IBOutlet UIImageView * snapshotIV;

@property (nonatomic, assign) GKVideoType videoType;

@end

@implementation DashcamVideoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GKQuerySingleCommand * cmd = [GKQuerySingleCommand new];
    cmd.videoName = self.videoName;
    __weak typeof (self) weakSelf = self;
    [cmd setCommandFinish:^(id _Nullable x) {
        /**
         x is a dictionary.
         {
         id = 3245235;
         location = "NRM_20160601134603_stream0_1_000_TX_1_0179.mp4";
         period = 179;
         resolution = 1080p;
         size = "277.7306318283";
         time = 1464759963;
         timestamp = 20160601134603;
         total = 1;
         type = 1;
         withGps = 0;
         withSnapshot = 1;
         withThumb = 1;
         }
         */
        NSDictionary * dict = x;
        weakSelf.nameLabel.text = dict[@"location"];
        weakSelf.periodLabel.text = [NSString stringWithFormat:@"%@ S", [dict[@"period"] stringValue]];
        weakSelf.resolutionLabel.text = dict[@"resolution"];
        weakSelf.sizeLabel.text = [NSString stringWithFormat:@"%@ M",[dict[@"size"] stringValue]];
        NSDateFormatter * df = [[NSDateFormatter alloc] init];
        df.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        NSDate * date = [NSDate dateWithTimeIntervalSince1970:[dict[@"time"] longValue]];
        weakSelf.timeLabel.text = [df stringFromDate:date];
        
        weakSelf.videoType = [dict[@"type"] integerValue];
        [SVProgressHUD showSuccessWithStatus:@"Query Video Success!"];
    }];
    [cmd setCommandError:^(NSError * _Nullable error) {
        [SVProgressHUD showErrorWithStatus:@"Query Video Error!"];
    }];
    [cmd send];
}

- (IBAction)playRemoteVideo:(id)sender
{
    NSString * remoteVideoPath = [GKSDKEngine parseToRemoteVideoUrl:self.videoName];
    MPMoviePlayerViewController* mp = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:remoteVideoPath]];
    
    mp.moviePlayer.fullscreen = YES;
    mp.moviePlayer.repeatMode = MPMovieRepeatModeOne;
    [self presentViewController:mp animated:YES completion:^{
    }];
}

- (IBAction)playLocalVideo:(id)sender
{
    NSString * localVideoPath = [GKSDKEngine parseToLocalVideoPath:self.videoName];
    MPMoviePlayerViewController* mp = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL fileURLWithPath:localVideoPath]];
    
    mp.moviePlayer.fullscreen = YES;
    mp.moviePlayer.repeatMode = MPMovieRepeatModeOne;
    [self presentViewController:mp animated:YES completion:^{
    }];
}

- (IBAction)downloadRemoteVideo:(id)sender
{
    __weak typeof (self) weakSelf = self;
    GKAddDownloadFileCommand * cmd = [GKAddDownloadFileCommand new];
    cmd.videoType = self.videoType;
    // NOT SET picName
    cmd.videoName = self.videoName;
    [cmd setCommandProgress:^(id _Nullable x) {
        /**
         x is a dictionary:
         {
         fileid = 0;
         filename = "URG_event_20160526181822_1_TX_1_0016.mp4";
         filerecvsize = 505852;
         filesize = 25406806;
         tag = downloadvideo;
         }
         */
        NSDictionary * dict = x;
        weakSelf.downloadProgressLabel.text = [NSString stringWithFormat:@"%ld / %ld", [dict[@"filerecvsize"] longValue], [dict[@"filesize"] longValue]];
    }];
    [cmd setCommandFinish:^(id _Nullable x) {
        weakSelf.downloadProgressLabel.text = @"Download Success!";
        [SVProgressHUD showSuccessWithStatus:@"Download Success!"];
    }];
    [cmd setCommandError:^(NSError * _Nullable error) {
        [SVProgressHUD showErrorWithStatus:@"Download video Error!"];
    }];
    [cmd send];
}

- (IBAction)cancelDownloadVideo:(id)sender
{
    // This Command will stop all download tasks.
    GKStopDownloadFileCommand * cmd = [GKStopDownloadFileCommand new];
    // NO Progress for download image.
    [cmd setCommandFinish:^(id _Nullable x) {
        [SVProgressHUD showSuccessWithStatus:@"Stop Download Success!"];
    }];
    [cmd setCommandError:^(NSError * _Nullable error) {
        [SVProgressHUD showErrorWithStatus:@"Stop Download Error"];
    }];
    [cmd send];
}


- (IBAction)downloadSnapshot:(id)sender
{
    __weak typeof (self) weakSelf = self;
    GKAddDownloadFileCommand * cmd = [GKAddDownloadFileCommand new];
    cmd.videoType = self.videoType;
    // NOT SET videoName
    cmd.picName = [GKSDKEngine parseToSnapshotName:self.videoName];
    // NO Progress for download image.
    [cmd setCommandFinish:^(id _Nullable x) {
        NSString * imagePath = [GKSDKEngine parseToLocalSnapshotPath:weakSelf.videoName];
        weakSelf.snapshotIV.image = [UIImage imageWithContentsOfFile:imagePath];
        [SVProgressHUD showSuccessWithStatus:@"Download Snapshot Success!"];
    }];
    [cmd setCommandError:^(NSError * _Nullable error) {
        [SVProgressHUD showErrorWithStatus:@"Download Snapshot Error"];
    }];
    [cmd send];
}

@end
