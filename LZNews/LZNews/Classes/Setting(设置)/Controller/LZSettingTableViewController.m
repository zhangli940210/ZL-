//
//  LZSettingTableViewController.m
//  LZNews
//
//  Created by apple on 16/3/11.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZSettingTableViewController.h"
#import "LZPersonalSettingTableViewController.h"
#import "LZTextFontTableViewController.h"
#import "LZPushSettingTableViewController.h"
#import "LZProgramaSettingTableViewController.h"


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
    LZArrowItem *item1 = [LZArrowItem settingRowItemWithImage:nil title:@"个人设置"];
    LZRightImageItem *item2 = [LZRightImageItem settingRowItemWithImage:nil title:@"绑定其他平台"];
    
    item1.desClass = [LZPersonalSettingTableViewController class];
    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item1, item2];
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    
    [self.groupArray addObject:groupItem];
    
}
// 第二组
- (void)addGroup1
{
    LZArrowItem *item1 = [LZArrowItem settingRowItemWithImage:nil title:@"字体设置"];
    __block LZArrowItem *item2 = [LZArrowItem settingRowItemWithImage:nil title:@"正文字号"];
    
    item1.detailTitle = @"汉仪旗黑";
    item2.detailTitle = @"巨无霸";
    
    __weak  typeof(self) weakSelf = self;
    item2.myTask = ^ (NSIndexPath *indexPath) { // 这个indexPath为当前页面点击的第几组，第几行
        
        LZTextFontTableViewController *textFontVC = [[LZTextFontTableViewController alloc] init];
        
        textFontVC.pBlock = ^ (NSString *textFont) {
            
            item2.detailTitle = textFont;
            // 刷新
            [self.tableView reloadData];
            
        };
    
        [weakSelf.navigationController pushViewController:textFontVC animated:YES];
    };
  
    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item1, item2];
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    
    [self.groupArray addObject:groupItem];
}
// 第三组
- (void)addGroup2
{
    LZSwitchItem *item1 = [LZSwitchItem settingRowItemWithImage:nil title:@"夜间模式"];
    LZSwitchItem *item2 = [LZSwitchItem settingRowItemWithImage:nil title:@"自动设置夜间模式"];
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
    LZArrowItem *item1 = [LZArrowItem settingRowItemWithImage:nil title:@"推送设置"];
    item1.desClass = [LZPushSettingTableViewController class];
    LZArrowItem *item2 = [LZArrowItem settingRowItemWithImage:nil title:@"栏目插件设置"];
    item2.desClass = [LZProgramaSettingTableViewController class];
    LZArrowItem *item3 = [LZArrowItem settingRowItemWithImage:nil title:@"离线设置"];
    LZSwitchItem *item4 = [LZSwitchItem settingRowItemWithImage:nil title:@"智能头条"];
    item4.isChoose = YES;
    LZSwitchItem *item5 = [LZSwitchItem settingRowItemWithImage:nil title:@"仅Wi-Fi网络下载图片"];
    LZSettingRowItem *item6 = [LZSettingRowItem settingRowItemWithImage:nil title:@"清理缓存"];
    item6.detailTitle = @"5.1MB";
    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item1, item2, item3, item4, item5, item6];
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    
    [self.groupArray addObject:groupItem];
}

// 第四组
- (void)addGroup4
{
    LZArrowItem *item1 = [LZArrowItem settingRowItemWithImage:nil title:@"帮助与反馈"];
    LZArrowItem *item2 = [LZArrowItem settingRowItemWithImage:nil title:@"为网易新闻评分"];
    LZArrowItem *item3 = [LZArrowItem settingRowItemWithImage:nil title:@"态度封面"];
    LZArrowItem *item4 = [LZArrowItem settingRowItemWithImage:nil title:@"关于"];
    
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
