//
//  LZTextFontCell.m
//  LZNews
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZTextFontCell.h"
#import "LZTextFont.h"

@interface LZTextFontCell ()

/** 字体属性*/
@property (weak, nonatomic) IBOutlet UILabel *fontLabel;
/** 图片*/
@property (weak, nonatomic) IBOutlet UIImageView *checkImageView;

@end

@implementation LZTextFontCell

- (void)setTextFont:(LZTextFont *)textFont
{
    _textFont = textFont;
    // 设置数据
    self.fontLabel.text = textFont.name;
    // 根据模型的checked属性决定打钩控件显示还是隐藏
    self.checkImageView.hidden = !textFont.isChecked;
}

@end
