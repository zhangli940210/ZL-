//
//  LZNewsTableViewController.m
//  LZNews
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZNewsTableViewController.h"
#import "LZLuFeiViewController.h"
#import "LZSuoLongViewController.h"
#import "LZXiangJiViewController.h"
#import "LZNaMeiTableViewController.h"
#import "LZLuoBinTableViewController.h"
#import "LZXunLuTableViewController.h"

@interface LZNewsTableViewController ()

@end

@implementation LZNewsTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    

    
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
