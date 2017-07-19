//
//  XLAdsorptionBallViewController.m
//  动画
//
//  Created by 王小腊 on 2017/7/14.
//  Copyright © 2017年 王小腊. All rights reserved.
//

#import "XLAdsorptionBallViewController.h"
#import "XLAdsorptionBallView.h"

@interface XLAdsorptionBallViewController ()

@property (nonatomic, strong) XLAdsorptionBallView *animationView;
@end

@implementation XLAdsorptionBallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"吸附小球动画";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //解决在nav 遮挡的时候 还会透明的显示问题;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.animationView = [[XLAdsorptionBallView alloc] init];
    self.animationView.backgroundColor = [UIColor whiteColor];
    //为了避免和系统生成的自动伸缩的约束不冲突 一般加上这句
    self.animationView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.animationView];
    
    [self.view addConstraints:
  @[[NSLayoutConstraint constraintWithItem:self.animationView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:10],
    [NSLayoutConstraint constraintWithItem:self.animationView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-10],
    [NSLayoutConstraint constraintWithItem:self.animationView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:10],
    [NSLayoutConstraint constraintWithItem:self.animationView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-10]
    ]];
    [self.animationView startAnimation];
}
- (void)dealloc
{
    [self.animationView removeFromSuperview];
    self.animationView = nil;
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
