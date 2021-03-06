//
//  XLPlayButtonViewController.m
//  AnimationDemo
//
//  Created by 王小腊 on 2017/8/16.
//  Copyright © 2017年 王小腊. All rights reserved.
//

#import "XLPlayButtonViewController.h"
#import "iQiYiPlayButton.h"
#import "YouKuPlayButton.h"

@interface XLPlayButtonViewController ()
{
    iQiYiPlayButton *_iQiYiPlayButton;
    
    YouKuPlayButton *_youKuPlayButton;
}

@end

@implementation XLPlayButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"按钮点击动画";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //创建播放按钮，需要初始化一个状态，即显示暂停还是播放状态
    _iQiYiPlayButton = [[iQiYiPlayButton alloc] initWithFrame:CGRectMake(0, 0, 60, 60) state:iQiYiPlayButtonStatePlay];
    _iQiYiPlayButton.center = CGPointMake(self.view.center.x, self.view.bounds.size.height/3);
    [_iQiYiPlayButton addTarget:self action:@selector(iQiYiPlayMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_iQiYiPlayButton];
    
    //创建播放按钮，需要初始化一个状态，即显示暂停还是播放状态
    _youKuPlayButton = [[YouKuPlayButton alloc] initWithFrame:CGRectMake(0, 0, 60, 60) state:YouKuPlayButtonStatePlay];
    _youKuPlayButton.center = CGPointMake(self.view.center.x, self.view.bounds.size.height*2/3);
    [_youKuPlayButton addTarget:self action:@selector(youKuPlayMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_youKuPlayButton];
}

- (void)iQiYiPlayMethod {
    //通过判断当前状态 切换显示状态
    if (_iQiYiPlayButton.buttonState == iQiYiPlayButtonStatePause) {
        _iQiYiPlayButton.buttonState = iQiYiPlayButtonStatePlay;
    }else {
        _iQiYiPlayButton.buttonState = iQiYiPlayButtonStatePause;
    }
}

- (void)youKuPlayMethod {
    //通过判断当前状态 切换显示状态
    if (_youKuPlayButton.buttonState == YouKuPlayButtonStatePause) {
        _youKuPlayButton.buttonState = YouKuPlayButtonStatePlay;
    }else {
        _youKuPlayButton.buttonState = YouKuPlayButtonStatePause;
    }
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
