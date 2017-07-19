//
//  XLAdsorptionBallView.m
//  AnimationDemo
//
//  Created by 王小腊 on 2017/7/14.
//  Copyright © 2017年 王小腊. All rights reserved.
//

#import "XLAdsorptionBallView.h"
#import "XLLineMode.h"
#import "XLPointMode.h"

@interface XLAdsorptionBallView ()

@property (assign, nonatomic) CGFloat viewWidth;
@property (assign, nonatomic) CGFloat viewHeight;
@property (strong, nonatomic) CADisplayLink *displayLink;
@property (strong, nonatomic) NSMutableArray <XLPointMode *>*pointsArry;
// 画布
@property (strong, nonatomic) UIView *contenView;
@end
@implementation XLAdsorptionBallView

- (NSMutableArray<XLPointMode *> *)pointsArry
{
    if (!_pointsArry)
    {
        _pointsArry = [NSMutableArray arrayWithCapacity:_pointNumber];
    }
    return _pointsArry;
}
- (UIView *)contenView
{
    if (!_contenView)
    {
        _contenView = [[UIView alloc] init];
        _contenView.frame = CGRectMake(0, 0, self.viewWidth, self.viewHeight);
        _contenView.backgroundColor = [UIColor clearColor];
    }
    return _contenView;
}
#pragma mark  ----初始化----
- (instancetype)init
{
    if (self = [super init])
    {
        // 默认设置
        [self defaultSettings];
        
    }
    return self;
}

/**
 开始动画
 */
- (void)startAnimation;
{
    [self destructionDisplayLink];
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(redrawFrame)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

/**
 停止动画并销毁
 */
- (void)stopAnimation;
{
    [self destructionDisplayLink];
    [self destructionData];
}
#pragma mark  ----默认设置----
- (void)defaultSettings
{
    self.pointNumber = 10;
    self.pointSize = CGPointSizeMake(2, 8);
    
    self.cirleLineWidth = 8;
    self.lineLineWidth = 0.6;
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.viewWidth = self.frame.size.width;
    self.viewHeight = self.frame.size.height;
    if (self.pointsArry.count == 0)
    {
        [self createData];
    }
    
}
#pragma mark  ----动画核心区域----
/**
 重绘尺寸
 */
- (void)redrawFrame
{
    [self destructionData];
    
    [self.pointsArry enumerateObjectsUsingBlock:^(XLPointMode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        AdsorptionBallMode mode = obj.adsorptionBallMode;
        
        mode.orignX += mode.offsetX;
        mode.orignY += mode.offsetY;
        if (mode.orignX > self.viewWidth )
        {
            mode.orignX = 0;
        }else if(mode.orignX < 0)
        {
            mode.orignX = self.viewWidth;
        }
        if (mode.orignY > self.viewHeight) {
            mode.orignY = 0;
        }else if (mode.orignY < 0)
        {
            mode.orignY = self.viewHeight;
        }
        obj.adsorptionBallMode = mode;
    }];
    [self drawLine];
}
/**
 划线
 */
- (void)drawLine
{
    // 画圆圈
    [self.pointsArry enumerateObjectsUsingBlock:^(XLPointMode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        AdsorptionBallMode mode = obj.adsorptionBallMode;
        [self drawCirleWithPrama:mode.orignX andy:mode.orignY andRadio:mode.width andOffsetX:mode.offsetX andOffsetY:mode.offsetY];
    }];
    
    for (int i = 0  ; i<self.pointNumber; i++)
    {
        [self.pointsArry enumerateObjectsUsingBlock:^(XLPointMode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if (i + idx < self.pointNumber)
            {
                XLPointMode *modelOne = self.pointsArry[i+idx];
                XLPointMode *modelTwo = self.pointsArry[i];
                
                float a = ABS(modelOne.adsorptionBallMode.orignX - modelTwo.adsorptionBallMode.orignX);
                float b = ABS(modelOne.adsorptionBallMode.orignY - modelTwo.adsorptionBallMode.orignY);
                float length = sqrtf(a*a+b*b);
                float lineOpacity;
                if (length <= self.viewWidth/2)
                {
                    lineOpacity = 0.2;
                    
                }else if ((self.viewWidth /2) > length > self.viewWidth)
                {
                    lineOpacity = 0.15;
                }else if(self.viewWidth > length > self.viewHeight/2)
                {
                    lineOpacity = 0.1;
                }else{
                    lineOpacity = 0.0;
                }
                if (lineOpacity > 0) {
                    
                    // 划线
                    [self drawLinewithPrama:modelTwo.adsorptionBallMode.orignX + modelTwo.adsorptionBallMode.width/2 andy:modelTwo.adsorptionBallMode.orignY + modelTwo.adsorptionBallMode.width/2 andOpacity:lineOpacity andCloseX:modelOne.adsorptionBallMode.orignX + modelOne.adsorptionBallMode.width / 2 andCloseY:modelOne.adsorptionBallMode.orignY + modelOne.adsorptionBallMode.width/2];
                    
                }
                
            }
            
            
        }];
    }
}

/*
 画圈
 */
- (void)drawCirleWithPrama:(CGFloat)beginx andy:(CGFloat)beginy andRadio:(CGFloat)width andOffsetX:(CGFloat)offsetx andOffsetY:(CGFloat)offsety
{
    CAShapeLayer *solidLine =  [CAShapeLayer layer];
    CGMutablePathRef solidPath =  CGPathCreateMutable();
    solidLine.lineWidth = self.cirleLineWidth ;
    solidLine.strokeColor = [UIColor colorWithRed:100/255.0f green:100/255.0f blue:100/255.0f alpha:0.4].CGColor;
    solidLine.fillColor = [UIColor clearColor].CGColor;
    CGPathAddEllipseInRect(solidPath, nil, CGRectMake(beginx,  beginy, width, width));
    solidLine.path = solidPath;
    CGPathRelease(solidPath);
    [self.contenView.layer addSublayer:solidLine];
    
}

/*
 划线
 */
- (void)drawLinewithPrama:(CGFloat)beginx andy:(CGFloat)beginy andOpacity:(CGFloat)opacity andCloseX:(CGFloat)closex andCloseY:(CGFloat)closey{
    
    CAShapeLayer *solidShapeLayer = [CAShapeLayer layer];
    
    CGMutablePathRef solidShapePath =  CGPathCreateMutable();
    [solidShapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    [solidShapeLayer setStrokeColor:[UIColor colorWithRed:100/255.0f green:100/255.0f blue:100/255.0f alpha:opacity].CGColor];
    solidShapeLayer.lineWidth = self.lineLineWidth ;
    CGPathMoveToPoint(solidShapePath, NULL, beginx, beginy);
    CGPathAddLineToPoint(solidShapePath, NULL, closex,closey);
    
    [solidShapeLayer setPath:solidShapePath];
    CGPathRelease(solidShapePath);
    [self.contenView.layer addSublayer:solidShapeLayer];
}

#pragma mark  ----tool fun----
- (void)createData
{
    [self.pointsArry removeAllObjects];
    for (int i = 0;  i<self.pointNumber; i++ )
    {
        XLPointMode *point = [[XLPointMode alloc] init];
        point.adsorptionBallMode = AdsorptionBallModeMake([self randomMin:0 Max:self.viewWidth], [self randomMin:0 Max:self.viewHeight], [self randomMin:10 Max:-10]/40, [self randomMin:10 Max:-10]/40, [self randomMin:self.pointSize.min Max:self.pointSize.max]);
        [self.pointsArry addObject:point];
    }
}

/**
 随机返回某个区间范围内的值
 
 @param minNumber 最小
 @param maxNumber 最大
 @return 随机值
 */
- (CGFloat)randomMin:(CGFloat)minNumber Max:(CGFloat)maxNumber
{
    NSUInteger precision = 100;
    CGFloat subtraction = maxNumber - minNumber;
    //取绝对值
    subtraction = ABS(subtraction);
    subtraction *= precision;
    //在差值间随机
    CGFloat randomNumber = arc4random() % ((int)subtraction+1);
    //随机的结果除以精度的位数
    randomNumber /= precision;
    //将随机的值加到较小的值上
    CGFloat result = MIN(minNumber, maxNumber) + randomNumber;
    return result;
}
// 销毁
- (void)destructionData
{
    [self.contenView removeFromSuperview];
    self.contenView = nil;
    [self addSubview:self.contenView];
    
}
- (void)destructionDisplayLink
{
    [self.displayLink invalidate];
    self.displayLink = nil;
}
- (void)dealloc
{
    [self.contenView removeFromSuperview];
    self.contenView = nil;
    [self destructionDisplayLink];
}
@end
