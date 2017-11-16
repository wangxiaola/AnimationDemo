//
//  UIScrollView+WCQForwarding.m
//  rtm
//
//  Created by 王小腊 on 2017/11/15.
//  Copyright © 2017年 王小腊. All rights reserved.
//

#import "UIScrollView+WCQForwarding.h"
#import "NSObject+WCQTopmostViewController.h"

@implementation UIScrollView (WCQForwarding)
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector { // 1
    
    NSMethodSignature *signature = nil;
    
    if (aSelector == @selector(setContentInsetAdjustmentBehavior:)) {
        
        signature = [UIViewController instanceMethodSignatureForSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)];
    }else {
        
        signature = [super methodSignatureForSelector:aSelector];
    }
    
    return signature;
}
- (void)forwardInvocation:(NSInvocation *)anInvocation { // 2
    
    BOOL automaticallyAdjustsScrollViewInsets  = NO;
    UIViewController *topmostViewController = [self wcq_topmostViewController];
    
    NSInvocation *viewControllerInvocation = [NSInvocation invocationWithMethodSignature:anInvocation.methodSignature]; // 3
    [viewControllerInvocation setTarget:topmostViewController];
    [viewControllerInvocation setSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)];
    [viewControllerInvocation setArgument:&automaticallyAdjustsScrollViewInsets atIndex:2]; // 4
    [viewControllerInvocation invokeWithTarget:topmostViewController]; // 5
}
@end
