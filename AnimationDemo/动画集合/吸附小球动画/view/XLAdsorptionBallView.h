//
//  XLAdsorptionBallView.h
//  AnimationDemo
//
//  Created by 王小腊 on 2017/7/14.
//  Copyright © 2017年 王小腊. All rights reserved.
//

#import <UIKit/UIKit.h>

struct CGPointSize {
    CGFloat min;
    CGFloat max;
};
typedef struct CGPointSize CGPointSize;

CG_INLINE CGPointSize
CGPointSizeMake(CGFloat min, CGFloat max)
{
    CGPointSize size; size.min = min; size.max = max;
    return size;
}

@interface XLAdsorptionBallView : UIView
/**
 小点的数量
 */
@property (assign, nonatomic) NSUInteger pointNumber;
/**
 小点的随机大小范围 
 */
@property (nonatomic) CGPointSize pointSize;

// 圆点尺寸
@property (assign, nonatomic) CGFloat cirleLineWidth;

// 线条宽度
@property (assign, nonatomic) CGFloat  lineLineWidth;
/**
 开始动画
 */
- (void)startAnimation;

/**
 停止动画并销毁
 */
- (void)stopAnimation;

@end
