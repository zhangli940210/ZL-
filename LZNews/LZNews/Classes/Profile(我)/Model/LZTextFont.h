//
//  LZTextFont.h
//  LZNews
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZTextFont : NSObject

/** 字体*/
@property (nonatomic, strong) NSString *name;

/** 是否被勾选 */
@property (nonatomic, assign, getter = isChecked) BOOL checked;

@end
