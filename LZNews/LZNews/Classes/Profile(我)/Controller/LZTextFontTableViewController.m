//
//  LZTextFontTableViewController.m
//  LZNews
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZTextFontTableViewController.h"
#import "MJExtension.h"
#import "LZTextFont.h"
#import "LZTextFontCell.h"

@interface LZTextFontTableViewController ()

/** 上一次选中的行*/
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;
/** 模型数据 */
@property (nonatomic, strong) NSArray *textFontArray;

@end

@implementation LZTextFontTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

#pragma mark - 懒加载
- (NSArray *)textFontArray
{
    if (_textFontArray == nil) {
        _textFontArray = [LZTextFont mj_objectArrayWithFilename:@"textFont.plist"];
    }
    return _textFontArray;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] init];
}



#pragma mark - Table view data source
// 每组返回多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.textFontArray.count;
}
// 每行显示什么内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"textFont";
    LZTextFontCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([LZTextFontCell class]) owner:nil options:nil] lastObject];
    }
    
    cell.textFont = self.textFontArray[indexPath.row];

    if (cell.textFont.isChecked) {
        _selectedIndexPath = indexPath;
    }
    return cell;
}


#pragma mark - <代理方法>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 取消上次选中的按钮
    if (self.selectedIndexPath != indexPath) {
        // 如果两次点击的是不同的cell,那么就进来重新改变,是相同的cell，那么就不做任何事
        
        // 设置上次选中的按钮为取消选中
        LZTextFont *pretextFont = self.textFontArray[self.selectedIndexPath.row];
        pretextFont.checked = NO;
        // 设置现在点击的按钮选中为选中状态
        LZTextFont *textFont = self.textFontArray[indexPath.row];
        textFont.checked = YES;
        // 赋值给上一次按钮作为选中按钮
        self.selectedIndexPath = indexPath;

        // 刷新
        [tableView reloadData];
        
        if (_pBlock) {
            _pBlock(textFont.name);
        }

        // 保存该界面修改的信息
        // 1.获取文件路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"textFont" ofType:@"plist"];
        // 2.创建可变数组,用来装字典，这里和懒加载里面的可变数组不一样
        NSMutableArray *mArr = [NSMutableArray array];
        // 3.遍历,把所有的模型转化为字典
        for (LZTextFont *textfont in self.textFontArray) {
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:textfont.name,@"name", @(textfont.isChecked), @"checked", nil];
            [mArr addObject:dict];
        }
        // 4.保存到文件中
        [mArr writeToFile:path atomically:YES];

    }
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

// 返回每组的行高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

@end
