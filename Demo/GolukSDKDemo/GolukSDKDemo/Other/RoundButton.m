//
//  RoundButton.m
//  GolukSDKDemo
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 Goluk. All rights reserved.
//

#import "RoundButton.h"

@implementation RoundButton

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 3;
}

@end
