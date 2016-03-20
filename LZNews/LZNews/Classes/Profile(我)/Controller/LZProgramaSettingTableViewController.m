//
//  LZProgramaSettingTableViewController.m
//  LZNews
//
//  Created by apple on 16/3/19.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZProgramaSettingTableViewController.h"

@interface LZProgramaSettingTableViewController ()

@end

@implementation LZProgramaSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置标题
    self.title = @"栏目插件设置";
    //添加1组
    [self addGroup0];
}

// 第三组
- (void)addGroup0
{
    LZSwitchItem *item1 = [LZSwitchItem settingRowItemWithImage:nil title:@"夜间模式"];
    LZSwitchItem *item2 = [LZSwitchItem settingRowItemWithImage:nil title:@"延边"];
    LZSwitchItem *item3 = [LZSwitchItem settingRowItemWithImage:nil title:@"财经"];
    LZSwitchItem *item4 = [LZSwitchItem settingRowItemWithImage:nil title:@"跟帖"];
    LZSwitchItem *item5 = [LZSwitchItem settingRowItemWithImage:nil title:@"夜间模式"];
    LZSwitchItem *item6 = [LZSwitchItem settingRowItemWithImage:nil title:@"延边"];
    LZSwitchItem *item7 = [LZSwitchItem settingRowItemWithImage:nil title:@"夜间模式"];
    LZSwitchItem *item8 = [LZSwitchItem settingRowItemWithImage:nil title:@"延边"];
    LZSwitchItem *item9 = [LZSwitchItem settingRowItemWithImage:nil title:@"夜间模式"];
    LZSwitchItem *item10 = [LZSwitchItem settingRowItemWithImage:nil title:@"延边"];
    LZSwitchItem *item11 = [LZSwitchItem settingRowItemWithImage:nil title:@"夜间模式"];
    LZSwitchItem *item12 = [LZSwitchItem settingRowItemWithImage:nil title:@"延边"];
    
    item1.isChoose = YES;
    item1.detailTitle = @"路飞";
    
    item2.isChoose = YES;
    item2.detailTitle = @"索隆";
    
    item3.isChoose = YES;
    item3.detailTitle = @"山治";
    
    item4.isChoose = YES;
    item4.detailTitle = @"娜美";
    
    item5.isChoose = YES;
    item5.detailTitle = @"罗宾";
    
    item6.isChoose = YES;
    item6.detailTitle = @"乌索普";
    
    item7.isChoose = YES;
    item7.detailTitle = @"弗兰基";
    
    item8.isChoose = YES;
    item8.detailTitle = @"驯鹿";
    
    item9.isChoose = YES;
    item9.detailTitle = @"红发";
    
    item10.isChoose = YES;
    item10.detailTitle = @"红发";
    
    item11.isChoose = YES;
    item11.detailTitle = @"罗杰";
    
    item12.isChoose = YES;
    item12.detailTitle = @"汉库克";
    
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
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
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
