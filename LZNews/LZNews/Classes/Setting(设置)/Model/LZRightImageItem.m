//
//  LZRightImageItem.m
//  LZNews
//
//  Created by apple on 16/3/11.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZRightImageItem.h"

@implementation LZRightImageItem

#pragma mark - 按钮懒加载
- (UIButton *)rightBtn
{
    if (_rightBtn == nil) {
        UIButton *rightBtn = [[UIButton alloc] init];
        rightBtn.frame = CGRectMake(0, 0, 30, 30);
        // 设置样式
        rightBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        // 设置背景图片
        [rightBtn setImage:[UIImage imageNamed:@"weibo2"] forState:UIControlStateNormal];
//        [rightBtn setBackgroundImage:[UIImage imageNamed:@"weibo2"] forState:UIControlStateNormal];
        _rightBtn = rightBtn;
    }
    return _rightBtn;
}

@end
