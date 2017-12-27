//
//  DashcamVideoViewController.m
//  GolukSDKDemo
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 Goluk. All rights reserved.
//

#import "DashcamVideoViewController.h"
#import <GolukSDK/GolukSDK.h>
#import "VideoTableViewCell.h"
#import "DashcamVideoDetailViewController.h"

@interface DashcamVideoViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray * dataSource;
@property (nonatomic, weak) IBOutlet UITableView * tableView;

@end

@implementation DashcamVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [NSMutableArray new];
    
}

- (IBAction)videoTypeChanged:(id)sender
{
    UISegmentedControl *control = (UISegmentedControl *)sender;
    [self.dataSource removeAllObjects];
    GKVideoType videoType = GKVideoUrgen;
    if (control.selectedSegmentIndex == 0) {
        videoType = GKVideoUrgen;
    } else {
        videoType = GKVideoLoop;
    }
    
    __weak typeof (self) weakSelf = self;
    GKQueryCommand * cmd = [GKQueryCommand new];
    cmd.type = videoType;
    cmd.limitCount = 20;
    cmd.startTime = [NSDate dateWithTimeIntervalSince1970:0];
    cmd.endTime = [NSDate date];
    [cmd setCommandFinish:^(id _Nullable x) {
        /**
         x is a dictionary.
         {
            items =     (
            {
                id = 3245235;
                location = "NRM_20160601141612_stream0_1_000_TX_1_0179.mp4";
                period = 179;
                resolution = 1080p;
                size = "277.5242967605";
                time = 1464761772;
                timestamp = 20160601141612;
                type = 1;
                withGps = 0;
                withSnapshot = 1;
                withThumb = 1;
            },
            {
                id = 3245235;
                location = "NRM_20160601141912_stream0_1_000_TX_1_0179.mp4";
                period = 179;
                resolution = 1080p;
                size = "277.6988077163";
                time = 1464761952;
                timestamp = 20160601141912;
                type = 1;
                withGps = 0;
                withSnapshot = 1;
                withThumb = 1;
            }
            );
         total = 2;
         }
         */
        NSDictionary * dict = x;
        NSArray * items = dict[@"items"];
        [weakSelf.dataSource addObjectsFromArray:items];
        [weakSelf.tableView reloadData];
    }];
    [cmd setCommandError:^(NSError * _Nullable error) {
        
    }];
    [cmd send];
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showDashcamVideoDetailViewController" sender:indexPath];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VideoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"VideoTableViewCell"];
    NSDictionary * dataDict = self.dataSource[indexPath.row];
    cell.nameLabel.text = dataDict[@"location"];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath * indexPath = sender;
    DashcamVideoDetailViewController * videoDetailVC = segue.destinationViewController;
    NSDictionary * dataDict = self.dataSource[indexPath.row];
    videoDetailVC.videoName = dataDict[@"location"];
}

@end
