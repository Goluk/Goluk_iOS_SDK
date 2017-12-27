//
//  DashcamSettingsViewController.m
//  GolukSDKDemo
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 Goluk. All rights reserved.
//

#import "DashcamSettingsViewController.h"
#import <GolukSDK/GolukSDK.h>
#import "SVProgressHUD.h"

@interface DashcamSettingsViewController ()

@property (nonatomic, weak) IBOutlet UILabel * audioEnableLabel;
@property (nonatomic, weak) IBOutlet UILabel * timeLabel;
@property (nonatomic, weak) IBOutlet UILabel * dormantLabel;
@property (nonatomic, weak) IBOutlet UILabel * vociceLanguageLabel;
@property (nonatomic, weak) IBOutlet UILabel * autoRecordingLabel;
@property (nonatomic, weak) IBOutlet UILabel * versionLabel;
@property (nonatomic, weak) IBOutlet UILabel * diskUsageLabel;

@end

@implementation DashcamSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Audio Setting

- (IBAction)getAudioSetting:(id)sender
{
    __weak typeof(self) weakSelf = self;
    GKGetRecAudioCommand * cmd = [GKGetRecAudioCommand new];
    [cmd setCommandFinish:^(id _Nullable x) {
        /*
         x is a dictionary, and value is:
         {
            AudioEnable = 1;
         }
         */
        NSDictionary * dict = x;
        weakSelf.audioEnableLabel.text = [dict[@"AudioEnable"] integerValue] == 1 ? @"Opened" : @"Closed";
        [SVProgressHUD showSuccessWithStatus:@"Get Audio Setting Done"];
    }];
    [cmd setCommandError:^(NSError * _Nullable error) {
        [SVProgressHUD showErrorWithStatus:@"Get Audio Setting Error"];
    }];
    [cmd send];
}

- (IBAction)setAudioSetting:(id)sender
{
    GKSetRecAudioCommand * cmd = [GKSetRecAudioCommand new];
    cmd.audioEnabled = @([sender isOn]);
    [cmd setCommandFinish:^(id _Nullable x) {
        [SVProgressHUD showSuccessWithStatus:@"Set Audio Setting Done"];
    }];
    [cmd setCommandError:^(NSError * _Nullable error) {
        [SVProgressHUD showErrorWithStatus:@"Set Audio Setting Error"];
    }];
    [cmd send];
}

#pragma mark - Time Setting

- (IBAction)getTimeSetting:(id)sender
{
    __weak typeof(self) weakSelf = self;
    GKGetTimeCommand * cmd = [GKGetTimeCommand new];
    [cmd setCommandFinish:^(id _Nullable x) {
        [SVProgressHUD showSuccessWithStatus:@"Get Time Setting Done"];
        NSDictionary * dict = x;
        NSDate * date = [NSDate dateWithTimeIntervalSince1970:[dict[@"IPCTime"] doubleValue]];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        weakSelf.timeLabel.text = [dateFormatter stringFromDate:date];
    }];
    [cmd setCommandError:^(NSError * _Nullable error) {
        [SVProgressHUD showErrorWithStatus:@"Get Time Setting Error"];
    }];
    [cmd send];
}

- (IBAction)setTimeSetting:(id)sender
{
    UIDatePicker * datePicker = sender;
    GKSetTimeCommand * cmd = [GKSetTimeCommand new];
    cmd.time = datePicker.date;
    [cmd setCommandFinish:^(id _Nullable x) {
        [SVProgressHUD showSuccessWithStatus:@"Set Time Setting Done"];
    }];
    [cmd setCommandError:^(NSError * _Nullable error) {
        [SVProgressHUD showErrorWithStatus:@"Set Time Setting Error"];
    }];
    [cmd send];
}

#pragma mark - Dormant Setting

- (IBAction)getDormantSetting:(id)sender
{
    __weak typeof(self) weakSelf = self;
    GKGetFunctionCommand * cmd = [GKGetFunctionCommand new];
    [cmd setCommandFinish:^(id _Nullable x) {
        /*
         x is a dictionary, and value is:
         {
            Dormant = 1;
         }
         */
        NSDictionary * dict = x;
        weakSelf.dormantLabel.text = [dict[@"Dormant"] integerValue] == 1 ? @"Opened" : @"Closed";
        [SVProgressHUD showSuccessWithStatus:@"Get Dormant Setting Done"];
    }];
    [cmd setCommandError:^(NSError * _Nullable error) {
        [SVProgressHUD showErrorWithStatus:@"Get Dormant Setting Error"];
    }];
    [cmd send];
}

- (IBAction)setDormantSetting:(id)sender
{
    GKSetDormantCommand * cmd = [GKSetDormantCommand new];
    cmd.enable = [sender isOn];
    [cmd setCommandFinish:^(id _Nullable x) {
        [SVProgressHUD showSuccessWithStatus:@"Set Dormant Setting Done"];
    }];
    [cmd setCommandError:^(NSError * _Nullable error) {
        [SVProgressHUD showErrorWithStatus:@"Set Dormant Setting Error"];
    }];
    [cmd send];
}

#pragma mark - Voice Language Setting

- (IBAction)getVoiceLanguageSetting:(id)sender
{
    __weak typeof(self) weakSelf = self;
    GKGetVoiceTypeCommand * cmd = [GKGetVoiceTypeCommand new];
    [cmd setCommandFinish:^(id _Nullable x) {
        /*
         x is a dictionary, and value is:
         {
            type = 1;
         }
         */
        NSDictionary * dict = x;
        weakSelf.vociceLanguageLabel.text = [dict[@"type"] integerValue] == 0 ? @"Chinese" : @"English";
        [SVProgressHUD showSuccessWithStatus:@"Get Voice Language Setting Done"];
    }];
    [cmd setCommandError:^(NSError * _Nullable error) {
        [SVProgressHUD showErrorWithStatus:@"Get Voice Language Setting Error"];
    }];
    [cmd send];
}

- (IBAction)setVoiceLanguageSetting:(id)sender
{
    GKSetVoiceTypeCommand * cmd = [GKSetVoiceTypeCommand new];
    cmd.voiceType = [sender isOn] ? @(1) : @(0);
    [cmd setCommandFinish:^(id _Nullable x) {
        [SVProgressHUD showSuccessWithStatus:@"Set Voice Language Setting Done"];
    }];
    [cmd setCommandError:^(NSError * _Nullable error) {
        [SVProgressHUD showErrorWithStatus:@"Set Voice Language Setting Error"];
    }];
    [cmd send];
}

#pragma mark - Auto Recording Setting

- (IBAction)getAutoRecordingSetting:(id)sender
{
    __weak typeof(self) weakSelf = self;
    GKGetRecordStateCommand * cmd = [GKGetRecordStateCommand new];
    [cmd setCommandFinish:^(id _Nullable x) {
        /*
         x is a dictionary, and value is:
         {
         status = 1;
         }
         */
        NSDictionary * dict = x;
        weakSelf.autoRecordingLabel.text = [dict[@"status"] integerValue] == 1 ? @"Opened" : @"Closed";
        [SVProgressHUD showSuccessWithStatus:@"Get Auto Recording Setting Done"];
    }];
    [cmd setCommandError:^(NSError * _Nullable error) {
        [SVProgressHUD showErrorWithStatus:@"Get Auto Recording Setting Error"];
    }];
    [cmd send];
}

- (IBAction)setAutoRecordingSetting:(id)sender
{
    GKSetAutoRecordCommand * cmd = [GKSetAutoRecordCommand new];
    cmd.autoRecord = [sender isOn];
    [cmd setCommandFinish:^(id _Nullable x) {
        [SVProgressHUD showSuccessWithStatus:@"Set Auto Recording Setting Done"];
    }];
    [cmd setCommandError:^(NSError * _Nullable error) {
        [SVProgressHUD showErrorWithStatus:@"Set Auto Recording Setting Error"];
    }];
    [cmd send];
}

#pragma mark - IPC Version

- (IBAction)getIPCVersionSetting:(id)sender
{
    __weak typeof(self) weakSelf = self;
    GKGetVersionCommand * cmd = [GKGetVersionCommand new];
    [cmd setCommandFinish:^(id _Nullable x) {
        /*
         x is a dictionary, and value is:
         {
         model = "1.0";
         product = "1.0";
         productname = T1;
         serial = ZTSD01611501228G;
         version = "T1_V1.3.0425.0637";
         }
         */
        NSDictionary * dict = x;
        weakSelf.versionLabel.text = dict[@"version"];
        [SVProgressHUD showSuccessWithStatus:@"Get Version Done"];
    }];
    [cmd setCommandError:^(NSError * _Nullable error) {
        [SVProgressHUD showErrorWithStatus:@"Get Version Error"];
    }];
    [cmd send];
}

#pragma mark - Restore

- (IBAction)restoreIPC:(id)sender
{
    GKRestoreCommand * cmd = [GKRestoreCommand new];
    [cmd setCommandFinish:^(id _Nullable x) {
        /*
         x is NULL
         */
        [SVProgressHUD showSuccessWithStatus:@"Restore IPC Done"];
        /**
         * MUST MUST MUST send GKDisconnectCommand after restore IPC.
         **/
        [[GKDisconnectCommand new] send];
    }];
    [cmd setCommandError:^(NSError * _Nullable error) {
        [SVProgressHUD showErrorWithStatus:@"Restore IPC Error"];
    }];
    [cmd send];
}

#pragma mark - Get Disk Usage

- (IBAction)getDiskUsage:(id)sender
{
    __weak typeof(self) weakSelf = self;
    GKGetRecUsageCommand * cmd = [GKGetRecUsageCommand new];
    [cmd setCommandFinish:^(id _Nullable x) {
        /*
         x is a dictionary, and value is:
         {
         SDCardActive = 1;
         isSpaceTooSmall = 0;
         leftSize = 8786;
         normalRecQuota = 22824;
         normalRecSize = 21491;
         picQuota = 1521;
         picSize = 0;
         totalSdSize = 30435;
         urgentRecQuota = 3651;
         urgentRecSize = 78;
         userFilesSize = 21649;
         wonderfulRecQuota = 2434;
         wonderfulRecSize = 75;
         }
         */
        NSDictionary * dict = x;
        weakSelf.diskUsageLabel.text = [NSString stringWithFormat:@"Used: %ld MB/ Left: %ld MB/ Total: %ld MB",
                                        [dict[@"userFilesSize"] longValue],
                                        [dict[@"totalSdSize"] longValue] - [dict[@"userFilesSize"] longValue],
                                        [dict[@"totalSdSize"] longValue]];
        [SVProgressHUD showSuccessWithStatus:@"Get Disk Usage Done"];
    }];
    [cmd setCommandError:^(NSError * _Nullable error) {
        [SVProgressHUD showErrorWithStatus:@"Get Disk Usage Error"];
    }];
    [cmd send];
}

@end
