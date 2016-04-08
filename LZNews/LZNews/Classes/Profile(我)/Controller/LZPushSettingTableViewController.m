//
//  LZPushSettingTableViewController.m
//  LZNews
//
//  Created by apple on 16/3/19.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZPushSettingTableViewController.h"

@interface LZPushSettingTableViewController ()

@end

@implementation LZPushSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置标题
    self.title = @"推送设置";
    //添加2组
    [self addGroup0];
    [self addGroup1];

}

// 第0组
- (void)addGroup0
{
    LZSwitchItem *item = [LZSwitchItem settingRowItemWithImage:nil title:@"要闻推送"];

    item.isChoose = YES;

    // 创建一个行数组
    NSArray *rowArray = @[item];
    
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    
    [self.groupArray addObject:groupItem];
}

// 第1组
- (void)addGroup1
{
    LZSwitchItem *item = [LZSwitchItem settingRowItemWithImage:nil title:@"夜间推送"];
    item.isChoose = YES;
    // 创建一个行数组
    NSArray *rowArray = @[item];
    
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    groupItem.footerT = @"开启后,晚上22:00~早晨6:00将接收推送部分设置次日生效";
    
    [self.groupArray addObject:groupItem];
}

// 返回每组的行高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    // 三个方法并用，实现自定义分割线效果
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        cell.separatorInset = insets;
    }
    
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:insets];
    }
    
    
    if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
}

@end
