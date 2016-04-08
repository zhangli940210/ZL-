//
//  ViewController.m
//  LZNewsHome
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZViewController.h"



@interface LZViewController () <UIScrollViewDelegate>

/** titleScrollView*/
@property (nonatomic, weak) UIScrollView *titleScrollView;
/** contentScrollView*/
@property (nonatomic, weak) UIScrollView *contentScrollView;
/** 上一次选中的按钮,之前用的是strong,但是仔细想想,总共创建好的button都已经添加到
    titleScrollView中,有强引用指向了,要想引用某个按钮,只需要弱引用就满足了*/
@property (nonatomic, weak) UIButton *selectedButton;
/** 装门用来存按钮的,纯净*/
@property (nonatomic ,strong) NSMutableArray *titleButtons;
/** 是否初始化*/
@property (nonatomic, assign) BOOL isInitial;
@end

@implementation LZViewController

#pragma mark - 懒加载
- (NSMutableArray *)titleButtons
{
    if (_titleButtons == nil) {
        _titleButtons = [NSMutableArray array];
    }
    return _titleButtons;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.添加标题滚动视图
    [self setupTitleScrollView];
    // 2.添加内容滚动视图
    [self setupContentScrollView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_isInitial == NO) {
        
        // 4.设置所有标题
        [self setupAllTitleButton];
        _isInitial = YES;
    }
}

// 1.添加标题滚动视图
- (void)setupTitleScrollView
{
    // 创建UIScrollView对象
    UIScrollView *titleScrollView = [[UIScrollView alloc] init];
    // 设置背景色
    titleScrollView.backgroundColor = [UIColor brownColor];
    // 隐藏水平滚动条
    titleScrollView.showsHorizontalScrollIndicator = NO;
    // 设置尺寸
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = ScreenW;
    CGFloat height = 35;
    titleScrollView.frame = CGRectMake(x, y, width, height);
    // 添加到自身的view上
    [self.view addSubview:titleScrollView];
    // 保存到属性
    _titleScrollView = titleScrollView;
}

// 2.添加内容滚动视图
- (void)setupContentScrollView
{
    // 创建UIScrollView对象
    UIScrollView *contentScrollView = [[UIScrollView alloc] init];
    // 设置背景色
    contentScrollView.backgroundColor = [UIColor redColor];
    // 设置可以分页
    contentScrollView.pagingEnabled = YES;
    // 设置代理
    contentScrollView.delegate = self;
    // 设置尺寸
    CGFloat x = 0;
    CGFloat y = CGRectGetMaxY(self.titleScrollView.frame);
    CGFloat width = ScreenW;
    CGFloat height = ScreenH - y;
    contentScrollView.frame = CGRectMake(x, y, width, height);
    // 添加到自身的view上
    [self.view addSubview:contentScrollView];
    // 保存到属性
    _contentScrollView = contentScrollView;
}


// 4.设置所有标题
- (void)setupAllTitleButton
{
    // 创建按钮
    // 1.拿到所有子控制器的个数
    NSInteger count = self.childViewControllers.count;
    // 2.for循环创建按钮
    // 2.1设置位置
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnH = 35;
    CGFloat btnW = 100;
    for (NSInteger i = 0; i <count ; i++) {
        UIButton *btn = [[UIButton alloc] init];
        btn.tag = i;
        btnX = i * btnW;
        // 3.设置尺寸
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        // 4.设置文字
        // 4.1拿到对应的子控制器
        UIViewController *VC = self.childViewControllers[i];
        // 4.2设置上去
        [btn setTitle:VC.title forState:UIControlStateNormal];
        // 5.设置按钮文字颜色
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        // 6.设置按钮背景色
//        btn.backgroundColor = LZRandomColor;
        // 7.设置按钮点击事件
        [btn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        // 添加到titleScrollView里面
        [self.titleScrollView addSubview:btn];
        // 添加到titleButtons里面
        [self.titleButtons addObject:btn];
        
        if (i == 0) {
            [self titleClick:btn];
        }
    }
    
    // 6.设置titleScrollView.contentSize
    self.titleScrollView.contentSize = CGSizeMake(count * btnW, 0);
    // 7.设置contentScrollView.contentSize
    self.contentScrollView.contentSize = CGSizeMake(count * ScreenW, 0);
}

// 点击按钮触发事件
- (void)titleClick:(UIButton *)button
{
    // 1.选中按钮
    [self selectButton:button];
    
    // 2.把按钮文字对应的控制器的View添加到对应的位置
    // 2.1拿到button绑定的索引,tag
    NSInteger i = button.tag;
    // 添加对应子控制器的view
    [self setupOneChildViewController:i];
    
    CGFloat x = i * ScreenW;
    // 3.设置scrollView移动到要显示的view上,前面的操作已经把对应子控制器的View排布好了
    [self.contentScrollView setContentOffset:CGPointMake(x, 0) animated:YES];
}

#pragma mark - UIScrollViewDelegate 方法
// 减速完毕之后调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 设置滚动停止之后该视图所对应的按钮的文字颜色
    // 1.拿到滚动到的视图的下标
    NSInteger i = (NSInteger)(scrollView.contentOffset.x / ScreenW);
    // 2.获取选中标题按钮
    UIButton *selectButton = self.titleButtons[i];
    // 选中按钮
    [self selectButton:selectButton];
    
    // 2.把对应子控制器的view添加上去
    [self setupOneChildViewController:i];
}

// 正在移动scrollView的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 1.拿到左边按钮下标,一开始为0
    NSInteger leftI = (NSInteger)(scrollView.contentOffset.x / ScreenW);
    // 获取左边按钮
    UIButton *leftButton = self.titleButtons[leftI];
    
    // 2.拿到右边按钮的下标
    NSInteger rightI = leftI + 1;
    UIButton *rightButton = nil;
    // 3.判断一下，是否出界,总共有6个按钮,最后一个按钮下标为5,下一次rightI为6的时候,
    // 判断不符合要求,不进来
    if (rightI < self.titleButtons.count) {
        rightButton = self.titleButtons[rightI];
    }
    
    // 4.计算缩放大小,,,,0 ~ 1
    // 4.1计算右边按钮缩放大小
    CGFloat rightScale = scrollView.contentOffset.x / ScreenW - leftI;
    // 4.1计算左边边按钮缩放大小
    CGFloat leftScale = 1 - rightScale;
    
    // 设置按钮形变,,,对标题按钮进行缩放 1 ~ 2
    rightButton.transform = CGAffineTransformMakeScale(rightScale * 0.3 + 1, rightScale * 0.3 + 1);
    leftButton.transform = CGAffineTransformMakeScale(leftScale * 0.3 + 1, leftScale * 0.3 + 1);
    
    // 设置按钮文字颜色
    [rightButton setTitleColor:[UIColor colorWithRed:rightScale green:0 blue:0 alpha:1.0] forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor colorWithRed:leftScale green:0 blue:0 alpha:1.0] forState:UIControlStateNormal];
    
}

#pragma mark -把子控制器的view添加
- (void)setupOneChildViewController:(NSInteger)i
{
    UIViewController *vc = self.childViewControllers[i];
    
    // 判断下有没有父控件
    if (vc.view.superview){
        return;
    }
    
    CGFloat x = i * ScreenW;
    // 设置vc的view的位置
    vc.view.frame = CGRectMake(x, 0, ScreenW, self.contentScrollView.bounds.size.height);
    [self.contentScrollView addSubview:vc.view];
}

// 选中按钮,在这里做文字缩放
- (void)selectButton:(UIButton *)button
{
    // 1.让按钮文字变成红色
    // 1.1取消上一次选中的颜色
    [self.selectedButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    // 1.1.2恢复上一次按钮的大小
    self.selectedButton.transform = CGAffineTransformIdentity;
//    NSLog(@"love--%@", NSStringFromCGAffineTransform(self.selectedButton.transform));
    
    // 1.2设置最新一次按钮的文字颜色
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    // 设置偏移量
    CGFloat offsetX = button.center.x - ScreenW * 0.5;
    
    // 1.判断最小时刻
    if (offsetX < 0) {
        offsetX = 0;
    }
    
    // 2.判断最大时刻
    CGFloat maxFloat = self.titleScrollView.contentSize.width - ScreenW;
    if (offsetX > maxFloat) {
        offsetX = maxFloat;
    }
    
    // 移动
    [self.titleScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    
    // 标题缩放 -> 如何让标题缩放 改形变
    button.transform = CGAffineTransformMakeScale(1.3, 1.3);
//    NSLog(@"love11--%@", NSStringFromCGAffineTransform(button.transform));
    
    // 1.3保存这次操作
    self.selectedButton = button;
}
@end
