//
//  ViewController.m
//  GolukSDKDemo
//
//  Created by apple on 16/5/27.
//  Copyright © 2016年 Goluk. All rights reserved.
//

#import "ViewController.h"
#import <GolukSDK/GolukSDK.h>
#import "SVProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(deviceDidConnect)
                                                 name:GK_IPC_CONNECTED_NOTIFICATION
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(deviceDidDisconnect)
                                                 name:GK_IPC_DISCONNECT_NOTIFICATION
                                               object:nil];
}

#pragma mark - Notifications

- (void)deviceDidConnect
{
    [SVProgressHUD showSuccessWithStatus:@"Connected to Deivce. "];
    [[GKGetVideoConfigCommand new] send];
}

- (void)deviceDidDisconnect
{
    NSLog(@"Device Did Disconnect");
    [SVProgressHUD showErrorWithStatus:@"Disonnected to Deivce. Caused by some issues."];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [self doConnect];
        } else if (indexPath.row == 1) {
            [self doDisconnect];
        }
    }
}

#pragma mark - Phase 1

- (void)doConnect
{
    [[GKConnectCommand new] send];
}

- (void)doDisconnect
{
    [[GKDisconnectCommand new] send];
    [SVProgressHUD showErrorWithStatus:@"User Disonnected to Deivce."];
}

@end
