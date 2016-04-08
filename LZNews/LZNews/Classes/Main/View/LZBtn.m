//
//  LZBtn.m
//  LZ彩票系统
//
//  Created by apple on 16/3/4.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZBtn.h"

@implementation LZBtn

// 取消按钮选中状态
- (void)setHighlighted:(BOOL)highlighted
{

}

// 代码创建的时候调用
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
// xib或者storyboard的时候调用
- (void)awakeFromNib
{
    [self setup];
}

- (void)setup
{
    // 设置文字普通状态下，为黑色
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    // 设置文字居中显示
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    // 设置文字字体大小
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    // 设置图片居中模式
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.titleLabel.x > self.imageView.x) {
        
        CGRect titleRect = CGRectMake(0, self.size.height * 0.7, self.size.width, self.size.height * 0.3);
        self.titleLabel.frame = titleRect;
        
        CGFloat x = self.size.width * 0.2;
        CGFloat y = self.size.height * 0.15;
        CGFloat w = self.size.width - x * 2;
        CGFloat h = self.size.height * 0.4;
        CGRect imageRect = CGRectMake(x, y, w, h);
        self.imageView.frame = imageRect;
        
    }
    
}

@end
