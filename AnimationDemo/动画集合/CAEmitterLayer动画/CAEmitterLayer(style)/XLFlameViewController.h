//
//  XLFlameViewController.h
//  AnimationDemo
//
//  Created by 王小腊 on 2017/9/12.
//  Copyright © 2017年 王小腊. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CAEmitterLayer;

/**
 火焰燃烧
 */
@interface XLFlameViewController : UIViewController


@property (strong) CAEmitterLayer *fireEmitter;
@property (strong) CAEmitterLayer *smokeEmitter;

- (void) controlFireHeight:(id)sender;
- (void) setFireAmount:(float)zeroToOne;

@end
