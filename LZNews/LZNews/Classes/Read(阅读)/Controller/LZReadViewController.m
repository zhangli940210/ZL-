//
//  LZReadViewController.m
//  LZNews
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZReadViewController.h"
#import "ChildViewController.h"

#import "LZLuFeiViewController.h"
#import "LZSuoLongViewController.h"
#import "LZXiangJiViewController.h"
#import "LZNaMeiTableViewController.h"
#import "LZLuoBinTableViewController.h"
#import "LZXunLuTableViewController.h"

@interface LZReadViewController ()

@end

@implementation LZReadViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    CGFloat y = 0;
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    
    // 设置搜索框
    CGFloat searchH = 44;
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, y, screenW, searchH)];
    
    [self.view addSubview:searchBar];
    
    
    // 设置整体内容尺寸（包含标题滚动视图和底部内容滚动视图）
    [self setUpContentViewFrame:^(UIView *contentView) {
        
        CGFloat contentX = 0;
        
        CGFloat contentY = CGRectGetMaxY(searchBar.frame);
        
        CGFloat contentH = screenH - contentY;
        
        contentView.frame = CGRectMake(contentX, contentY, screenW, contentH);
        
    }];

    // *推荐方式(设置标题渐变)
    [self setUpTitleGradient:^(BOOL *isShowTitleGradient, YZTitleColorGradientStyle *titleColorGradientStyle, CGFloat *startR, CGFloat *startG, CGFloat *startB, CGFloat *endR, CGFloat *endG, CGFloat *endB) {
        
        // 不需要设置的属性，可以不管
        *isShowTitleGradient = YES;
        
        // 设置结束时，RGB通道各个值
        //        *endR = 1;
        //        *endG = 130 / 255.0;
        //        *endB = 44 / 255.0;
        
        *endR = 1;
        *endG = 0;
        *endB = 0;
        
    }];
    
    
    /****** 设置遮盖 ******/
    //    self.isShowTitleCover = YES;
    //    self.coverColor = [UIColor colorWithWhite:0.7 alpha:0.4];
    //    self.coverCornerRadius = 13;
    
    // *推荐方式(设置遮盖)
    [self setUpCoverEffect:^(BOOL *isShowTitleCover, UIColor **coverColor, CGFloat *coverCornerRadius) {
        // 设置是否显示标题蒙版
        *isShowTitleCover = YES;
        
        // 设置蒙版颜色
        *coverColor = [UIColor colorWithWhite:0.7 alpha:0.4];
        
        // 设置蒙版圆角半径
        *coverCornerRadius = 13;
    }];
    
    // 3.添加所有子控制器
    [self setupAllChildViewController];
}

#pragma mark - 添加所有子控制器
// 3.添加所有子控制器
- (void)setupAllChildViewController
{
    LZLuFeiViewController *lufei = [[LZLuFeiViewController alloc] init];
    lufei.title = @"路飞";
    [self addChildViewController:lufei];
    
    LZSuoLongViewController *suolong = [[LZSuoLongViewController alloc] init];
    suolong.title = @"索隆";
    [self addChildViewController:suolong];
    
    LZXiangJiViewController *xiangji = [[LZXiangJiViewController alloc] init];
    xiangji.title = @"香吉";
    [self addChildViewController:xiangji];
    
    LZNaMeiTableViewController *namei = [[LZNaMeiTableViewController alloc] init];
    namei.title = @"娜美";
    [self addChildViewController:namei];
    
    LZLuoBinTableViewController *luobin = [[LZLuoBinTableViewController alloc] init];
    luobin.title = @"罗宾";
    [self addChildViewController:luobin];
    
    LZXunLuTableViewController *xunlu = [[LZXunLuTableViewController alloc] init];
    xunlu.title = @"驯鹿";
    [self addChildViewController:xunlu];
}



@end
