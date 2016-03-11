//
//  LZSettingTableViewController.m
//  LZNews
//
//  Created by apple on 16/3/11.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZSettingTableViewController.h"

@interface LZSettingTableViewController ()

@end

@implementation LZSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置标题
    self.title = @"设置";
    //添加3组
    [self addGroup0];
    [self addGroup1];
    [self addGroup2];
    [self addGroup3];
    [self addGroup4];
}

// 第一组
- (void)addGroup0
{
    LZArrowItem *item1 = [LZArrowItem settingRowItemWithImage:nil title:@"索隆1"];
    LZArrowItem *item2 = [LZArrowItem settingRowItemWithImage:nil title:@"索隆2"];
    
    //    item2.desClass = [LZScoreViewController class];
    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item1, item2];
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    
    [self.groupArray addObject:groupItem];
    
}
// 第二组
- (void)addGroup1
{
    LZArrowItem *item1 = [LZArrowItem settingRowItemWithImage:nil title:@"索隆1"];
//    LZArrowItem *item2 = [LZArrowItem settingRowItemWithImage:nil title:@"索隆2"];
    LZRightImageItem *item2 = [LZRightImageItem settingRowItemWithImage:nil title:@"路飞"];
    
    item1.detailTitle = @"索隆";
//    item2.detailTitle = @"索隆";
    
//    item2.desClass = [LZScoreViewController class];
    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item1, item2];
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    
    [self.groupArray addObject:groupItem];
}
// 第三组
- (void)addGroup2
{
    LZSwitchItem *item1 = [LZSwitchItem settingRowItemWithImage:nil title:@"山治"];
    LZSwitchItem *item2 = [LZSwitchItem settingRowItemWithImage:nil title:@"山治"];
    item2.isChoose = YES;
    // 创建一个行数组
    NSArray *rowArray = @[item1, item2];
    
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    
    [self.groupArray addObject:groupItem];
}

// 第三组
- (void)addGroup3
{
    LZArrowItem *item1 = [LZArrowItem settingRowItemWithImage:nil title:@"索隆1"];
    LZArrowItem *item2 = [LZArrowItem settingRowItemWithImage:nil title:@"索隆2"];
    LZArrowItem *item3 = [LZArrowItem settingRowItemWithImage:nil title:@"索隆1"];
    LZSwitchItem *item4 = [LZSwitchItem settingRowItemWithImage:nil title:@"山治"];
    item4.isChoose = YES;
    LZSwitchItem *item5 = [LZSwitchItem settingRowItemWithImage:nil title:@"山治"];
    LZSettingRowItem *item6 = [LZSettingRowItem settingRowItemWithImage:nil title:@"清理缓存"];
    item6.detailTitle = @"5.1MB";
    //    item2.desClass = [LZScoreViewController class];
    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item1, item2, item3, item4, item5, item6];
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    
    [self.groupArray addObject:groupItem];
}

// 第四组
- (void)addGroup4
{
    LZArrowItem *item1 = [LZArrowItem settingRowItemWithImage:nil title:@"索隆1"];
    LZArrowItem *item2 = [LZArrowItem settingRowItemWithImage:nil title:@"索隆2"];
    LZArrowItem *item3 = [LZArrowItem settingRowItemWithImage:nil title:@"索隆1"];
    LZArrowItem *item4 = [LZArrowItem settingRowItemWithImage:nil title:@"索隆2"];
    
    //    item2.desClass = [LZScoreViewController class];
    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item1, item2, item3, item4];
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    
    [self.groupArray addObject:groupItem];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 创建Cell
    LZSettingCell *cell = [LZSettingCell cellWithTableView:tableView style:UITableViewCellStyleValue1];
    // 取出当前是第几组
    LZSettingGroupItem *groupItem  = self.groupArray[indexPath.section];
    LZSettingRowItem *rowItem = groupItem.rowArray[indexPath.row];
    // 给Cell赋值模型
    cell.rowItem = rowItem;
    return cell;
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
