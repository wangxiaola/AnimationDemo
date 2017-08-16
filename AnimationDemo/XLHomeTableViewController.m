//
//  XLHomeTableViewController.m
//  AnimationDemo
//
//  Created by 王小腊 on 2017/7/14.
//  Copyright © 2017年 王小腊. All rights reserved.
//

#import "XLHomeTableViewController.h"

@interface XLHomeTableViewController ()

@property (nonatomic, strong, readonly) NSMutableArray <NSDictionary *>*dataArray;

@end

@implementation XLHomeTableViewController
@synthesize dataArray = _dataArray;

- (NSMutableArray<NSDictionary *> *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = [NSMutableArray arrayWithObjects:
  @{@"name":@"吸附小球",@"class":@"XLAdsorptionBallViewController"},
  @{@"name":@"视图更新动画",@"class":@"XLViewUpdataViewController"},
  @{@"name":@"播放按钮动画",@"class":@"XLPlayButtonViewController"},nil];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title  = @"动画集合";
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeCell" forIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.text  = [[self.dataArray objectAtIndex:indexPath.row] valueForKey:@"name"];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *className = [[self.dataArray objectAtIndex:indexPath.row] valueForKey:@"class"];
    [self.navigationController pushViewController:[NSClassFromString(className) new] animated:YES];
    
    
}
@end
