//
//  XlAdsorptionBallBaseMode.h
//  AnimationDemo
//
//  Created by 王小腊 on 2017/7/14.
//  Copyright © 2017年 王小腊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 模型参数
 */
typedef struct AdsorptionBallMode {
    CGFloat orignX, orignY, offsetX, offsetY, width;
} AdsorptionBallMode;


/**
 模型数据

 @param orignX orignX
 @param orignY orignY
 @param offsetX offsetX
 @param offsetY offsetY
 @param width width
 @return AdsorptionBallMode
 */
UIKIT_STATIC_INLINE AdsorptionBallMode AdsorptionBallModeMake(CGFloat orignX, CGFloat orignY, CGFloat offsetX, CGFloat offsetY, CGFloat width)
{
    AdsorptionBallMode mode = {orignX, orignY, offsetX, offsetY, width};
    return mode;
}

@interface XlAdsorptionBallBaseMode : NSObject

/**
 模型体
 */
@property (nonatomic) AdsorptionBallMode adsorptionBallMode;

@end
