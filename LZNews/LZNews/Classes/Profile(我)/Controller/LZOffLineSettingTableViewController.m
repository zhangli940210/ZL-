//
//  LZOffLineSettingSettingTableViewController.m
//  LZNews
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZOffLineSettingTableViewController.h"

@interface LZOffLineSettingTableViewController ()

@end

@implementation LZOffLineSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置标题
    self.title = @"离线设置";
    //添加1组
    [self addGroup0];
    [self addGroup1];
}

- (void)addGroup0
{
    LZSwitchItem *item = [LZSwitchItem settingRowItemWithImage:nil title:@"匿名跟帖"];
    item.isChoose = YES;
    // 创建一个行数组
    NSArray *rowArray = @[item];
    
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
//    groupItem.footerT = @"其他网友将不会看到你的用户名,头像和个人主页";
    
    [self.groupArray addObject:groupItem];
}

// 第1组
- (void)addGroup1
{
    LZSwitchItem *item1 = [LZSwitchItem settingRowItemWithImage:nil title:@"头条"];
    LZSwitchItem *item2 = [LZSwitchItem settingRowItemWithImage:nil title:@"军事"];
    LZSwitchItem *item3 = [LZSwitchItem settingRowItemWithImage:nil title:@"热点"];
    LZSwitchItem *item4 = [LZSwitchItem settingRowItemWithImage:nil title:@"历史"];
    LZSwitchItem *item5 = [LZSwitchItem settingRowItemWithImage:nil title:@"广州"];
    LZSwitchItem *item6 = [LZSwitchItem settingRowItemWithImage:nil title:@"订阅"];
    LZSwitchItem *item7 = [LZSwitchItem settingRowItemWithImage:nil title:@"轻松一刻"];
    LZSwitchItem *item8 = [LZSwitchItem settingRowItemWithImage:nil title:@"原创"];
    LZSwitchItem *item9 = [LZSwitchItem settingRowItemWithImage:nil title:@"图片"];
    LZSwitchItem *item10 = [LZSwitchItem settingRowItemWithImage:nil title:@"跟帖"];
    LZSwitchItem *item11 = [LZSwitchItem settingRowItemWithImage:nil title:@"直播"];
    LZSwitchItem *item12 = [LZSwitchItem settingRowItemWithImage:nil title:@"游戏"];
    
    item1.isChoose = YES;
    
    item2.isChoose = YES;
    
    item3.isChoose = YES;
    
    item4.isChoose = YES;
    
    item5.isChoose = YES;
    
    item6.isChoose = YES;
    
    item7.isChoose = YES;
    
    item8.isChoose = YES;
    
    item9.isChoose = YES;
    
    item10.isChoose = YES;
    
    item11.isChoose = YES;
    
    item12.isChoose = YES;
    
    // 创建一个行数组
    NSArray *rowArray = @[item1, item2, item3, item4, item5, item6,
                          item7, item8, item9, item10, item11, item12];
    
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    
    [self.groupArray addObject:groupItem];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 创建Cell
    LZSettingCell *cell = [LZSettingCell cellWithTableView:tableView style:UITableViewCellStyleSubtitle];
    // 取出当前是第几组
    LZSettingGroupItem *groupItem  = self.groupArray[indexPath.section];
    LZSettingRowItem *rowItem = groupItem.rowArray[indexPath.row];
    // 给Cell赋值模型
    cell.rowItem = rowItem;
    return cell;
}

// 返回每组的行高
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 20;
//}

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
