//
//  LZNewFeatureViewController.m
//  LZ彩票系统
//
//  Created by apple on 16/3/6.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZNewFeatureViewController.h"
#import "LZNewFeatureCell.h"

#define LZItemCount 3

@interface LZNewFeatureViewController ()

//上一次的offset.x
@property (nonatomic ,assign) CGFloat preOffsetX;
//guide1ImageV
@property (nonatomic , weak) UIImageView *guide1ImageV;

@end

@implementation LZNewFeatureViewController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init
{
    // 创建流水布局
    UICollectionViewFlowLayout *flowL = [[UICollectionViewFlowLayout alloc] init];
    // 设置每一个格子的大小
    flowL.itemSize = CGSizeMake(ScreenW, ScreenH);
    // 设置最小行间距
    flowL.minimumLineSpacing = 0;
    // 设置每个格子之间的间距
    flowL.minimumInteritemSpacing = 0;
    // 设置滚动的方向
    flowL.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [super initWithCollectionViewLayout:flowL];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 使用CollectionView时必须得要注册Cell
    [self.collectionView registerClass:[LZNewFeatureCell class] forCellWithReuseIdentifier:reuseIdentifier];
    //取消弹簧效果
    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
}

#pragma mark <UICollectionViewDataSource>
// 总共有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

// 每组多少行
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LZNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.image = [UIImage imageNamed:[NSString stringWithFormat:@"start_guide_%zd",indexPath.item + 1]];
    
    // 设置立即体验按钮是否隐藏显示
    [cell setStartBtnHidden:indexPath count:LZItemCount];
    
    return cell;
}


@end
