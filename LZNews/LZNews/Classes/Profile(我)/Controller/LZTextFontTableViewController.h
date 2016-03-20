//
//  LZTextFontTableViewController.h
//  LZNews
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^textFontBlock)(NSString *);

@interface LZTextFontTableViewController : UITableViewController

/** block变量*/
@property (nonatomic, copy) textFontBlock pBlock;
@end
