//
//  ZKBezierPathViewController.m
//  AnimationDemo
//
//  Created by 王小腊 on 2017/8/18.
//  Copyright © 2017年 王小腊. All rights reserved.
//

#import "ZKBezierPathViewController.h"
#import "RYCuteView.h"
@interface ZKBezierPathViewController ()

@end

@implementation ZKBezierPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"果冻动画";
    self.view.backgroundColor = [UIColor whiteColor];
    
    RYCuteView *cuteView      = [[RYCuteView alloc] initWithFrame:CGRectMake(0, 64, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    cuteView.backgroundColor  = [UIColor whiteColor];
    [self.view addSubview:cuteView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
