//
//  XLStarRainViewController.h
//  AnimationDemo
//
//  Created by 王小腊 on 2017/9/12.
//  Copyright © 2017年 王小腊. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CAEmitterLayer;
/**
 星雨发散
 */
@interface XLStarRainViewController : UIViewController


@property (strong) CAEmitterLayer *ringEmitter;

- (void) touchAtPosition:(CGPoint)position;

@end
