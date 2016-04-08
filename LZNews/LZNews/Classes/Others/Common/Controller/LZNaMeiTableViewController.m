//
//  LZNaMeiTableViewController.m
//  LZNewsHome
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZNaMeiTableViewController.h"

@interface LZNaMeiTableViewController ()

@end

@implementation LZNaMeiTableViewController

static NSString *ID = @"namei";

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSLog(@"%s", __func__);
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.textLabel.text = [NSString stringWithFormat:@"namei---%zd", indexPath.row];
    
    return cell;
}

@end
