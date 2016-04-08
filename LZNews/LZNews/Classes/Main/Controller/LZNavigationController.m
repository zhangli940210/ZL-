//
//  LZNavigationController.m
//  01-彩票
//
//  Created by xiaomage on 16/3/4.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "LZNavigationController.h"


@interface LZNavigationController ()<UINavigationControllerDelegate>


@end

@implementation LZNavigationController

// 当前类或者它的子类第一次使用的时候调用.
+ (void)initialize {
    
    // 获取指定类下面的导航条
    // iOS9
//    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[LZNavigationController class]]];
    // iOS7
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    //设置导航条
    //设置背景(设置背影图片时, 必须得要使用)
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    //设置导航条上的标题颜色
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [bar setTitleTextAttributes:dict];
    
    
    [bar setTintColor:[UIColor whiteColor]];
    
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
//    dict2[NSForegroundColorAttributeName] = [UIColor blueColor];
    [barItem setTitleTextAttributes:dict2 forState:UIControlStateNormal];
    
    // 让“我的彩票”四个字往上偏移64，使其隐藏
    [barItem setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -64) forBarMetrics:UIBarMetricsDefault];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count != 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
    
}

@end
