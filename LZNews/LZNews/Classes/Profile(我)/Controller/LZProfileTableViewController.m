//
//  LZProfileTableViewController.m
//  LZNews
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZProfileTableViewController.h"
#import "LZSettingTableViewController.h"

@interface LZProfileTableViewController ()

@end

@implementation LZProfileTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(setting)];
}

/**
 *  设置
 */
- (void)setting
{
    LZSettingTableViewController *settingVC = [[LZSettingTableViewController alloc] init];
    [self.navigationController pushViewController:settingVC animated:YES];
}

@end
