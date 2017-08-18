//
//  ZKEmitterLayerViewController.m
//  AnimationDemo
//
//  Created by 王小腊 on 2017/8/18.
//  Copyright © 2017年 王小腊. All rights reserved.
//

#import "ZKEmitterLayerViewController.h"
#import "WclEmitterButton.h"
@interface ZKEmitterLayerViewController ()
@property (nonatomic, strong) WclEmitterButton *myButton;
@end

@implementation ZKEmitterLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"点赞粒子效果";
    
    if (self.myButton == nil) {
        self.myButton = [[WclEmitterButton alloc]initWithFrame:CGRectMake(100, 150, 30, 30)];
        [self.myButton setImage:[UIImage imageNamed:@"priase_dafault"] forState:UIControlStateNormal];
        [self.myButton setImage:[UIImage imageNamed:@"priase_select"] forState:UIControlStateSelected];
        [self.myButton addTarget:self action:@selector(wclButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.myButton];
    }

}
- (void)wclButtonAction:(UIButton *)sender {
    sender.selected = !sender.selected;
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
