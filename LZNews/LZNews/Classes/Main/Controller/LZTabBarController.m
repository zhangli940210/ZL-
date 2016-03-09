//
//  LZTabBarController.m
//  LZNews
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZTabBarController.h"
#import "LZNavigationController.h"
#import "LZNewsTableViewController.h"
#import "LZProfileTableViewController.h"
#import "LZReadTableViewController.h"
#import "LZSeeListenTableViewController.h"
#import "LZThemeTableViewController.h"
#import "LZTabBar.h"

@interface LZTabBarController ()

/** 存放tabbaritem的可变数组*/
@property (nonatomic, strong) NSMutableArray *itemArray;

@end

@implementation LZTabBarController

#pragma mark -懒加载数据
- (NSMutableArray *)itemArray
{
    if (_itemArray == nil) {
        _itemArray = [NSMutableArray array];
    }
    return _itemArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加所有的子子控制器
    [self addAllChildVC];
    
    // 自定义自己的tabbar
    LZTabBar *tabBar = [[LZTabBar alloc] init];
    tabBar.pBlock = ^ (NSInteger index) {
        self.selectedIndex = index;
    };
    tabBar.itemArray = self.itemArray;
    // 设置尺寸
    tabBar.frame = self.tabBar.bounds;
    // 把自己创建的tabbar添加到系统的tabbar上面
    [self.tabBar addSubview:tabBar];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 在view将要显示的时候，删除系统的UIBarButton
    for (UIView *childVc in self.tabBar.subviews) {
        if (![childVc isKindOfClass:[LZTabBar class]]) {
            [childVc removeFromSuperview];
        }
    }
    
}

- (void)addAllChildVC
{
    // 添加子控制器
    LZNewsTableViewController *newsVC = [[LZNewsTableViewController alloc] init];
    [self addChildVC:newsVC image:[UIImage imageNamed:@"tabbar_icon_news_normal"] selImage:[UIImage imageNamed:@"tabbar_icon_news_highlight"] title:@"新闻"];

    LZReadTableViewController *readVC = [[LZReadTableViewController alloc] init];
    [self addChildVC:readVC image:[UIImage imageNamed:@"tabbar_icon_reader_normal"] selImage:[UIImage imageNamed:@"tabbar_icon_reader_highlight"] title:@"阅读"];
    
    LZSeeListenTableViewController *seeListenVC = [[LZSeeListenTableViewController alloc] init];
    [self addChildVC:seeListenVC image:[UIImage imageNamed:@"tabbar_icon_media_normal"] selImage:[UIImage imageNamed:@"tabbar_icon_media_highlight"] title:@"视听"];
    
    LZThemeTableViewController *themeVC = [[LZThemeTableViewController alloc] init];
    [self addChildVC:themeVC image:[UIImage imageNamed:@"tabbar_icon_bar_normal"] selImage:[UIImage imageNamed:@"tabbar_icon_bar_highlight"] title:@"话题"];
    
    LZProfileTableViewController *profileVC = [[LZProfileTableViewController alloc] init];
    [self addChildVC:profileVC image:[UIImage imageNamed:@"tabbar_icon_me_normal"] selImage:[UIImage imageNamed:@"tabbar_icon_me_highlight"] title:@"我"];

}

- (void)addChildVC:(UIViewController *)childVC image:(UIImage *)image selImage:(UIImage *)selImage title:(NSString *)title
{
    childVC.title = title;
    childVC.tabBarItem.image = image;
    childVC.tabBarItem.selectedImage = selImage;
    
    [self.itemArray addObject:childVC.tabBarItem];
    childVC.view.backgroundColor = LZRandomColor;
    
    LZNavigationController *nav = [[LZNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];

}

@end
