//
//  XLCAEmitterLayerTableViewController.m
//  AnimationDemo
//
//  Created by 王小腊 on 2017/9/12.
//  Copyright © 2017年 王小腊. All rights reserved.
//

#import "XLCAEmitterLayerTableViewController.h"

@interface XLCAEmitterLayerTableViewController ()

@property (nonatomic, strong) NSMutableArray <NSDictionary *>*dataArray;
@end

@implementation XLCAEmitterLayerTableViewController

- (NSMutableArray<NSDictionary *> *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = [NSMutableArray arrayWithObjects:
                      @{@"name":@"雪花飘落",@"class":@"XLSnowViewController"},
                      @{@"name":@"烟雾扩散",@"class":@"XLSmokeViewController"},
                      @{@"name":@"火焰燃烧",@"class":@"XLFlameViewController"},
                      @{@"name":@"星雨发散",@"class":@"XLStarRainViewController"},
                      @{@"name":@"礼花发射",@"class":@"XLFireworksViewController"},nil];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationItem.title = @"CAEmitterLayer";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.textColor = [UIColor blackColor];
    
    NSDictionary *dic = self.dataArray[indexPath.row];
    cell.textLabel.text = [dic valueForKey:@"name"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *className = [[self.dataArray objectAtIndex:indexPath.row] valueForKey:@"class"];
    [self.navigationController pushViewController:[NSClassFromString(className) new] animated:YES];
    
}
@end
