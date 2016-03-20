//
//  LZPersonalSettingTableViewController.m
//  LZNews
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZPersonalSettingTableViewController.h"

@interface LZPersonalSettingTableViewController ()

@end

@implementation LZPersonalSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置标题
    self.title = @"个人设置";
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
    LZSettingRowItem *item = [LZSettingRowItem settingRowItemWithImage:nil title:@"通行证"];
    item.detailTitle = @"QQ登录账号无通行证功能";
    
    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item];
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    
    [self.groupArray addObject:groupItem];
    
}
// 第二组
- (void)addGroup1
{
    LZArrowItem *item1 = [LZArrowItem settingRowItemWithImage:nil title:@"字体设置"];
    LZArrowItem *item2 = [LZArrowItem settingRowItemWithImage:nil title:@"正文字号"];
    
    item2.detailTitle = @"iOS-张立-学习";
    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item1, item2];
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    
    [self.groupArray addObject:groupItem];
}
// 第三组
- (void)addGroup2
{
    LZSwitchItem *item = [LZSwitchItem settingRowItemWithImage:nil title:@"匿名跟帖"];
    item.isChoose = YES;
    // 创建一个行数组
    NSArray *rowArray = @[item];
    
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    groupItem.footerT = @"其他网友将不会看到你的用户名,头像和个人主页";
    
    [self.groupArray addObject:groupItem];
}

// 第三组
- (void)addGroup3
{
    LZArrowItem *item = [LZArrowItem settingRowItemWithImage:nil title:@"阅读口味"];

    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item];
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    
    [self.groupArray addObject:groupItem];
}

// 第四组
- (void)addGroup4
{
    LZArrowItem *item1 = [LZArrowItem settingRowItemWithImage:nil title:@"我的道具"];
    LZArrowItem *item2 = [LZArrowItem settingRowItemWithImage:nil title:@"搭上记录"];
    item1.detailTitle = @"钻石*0";
    
    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item1, item2];
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
