//
//  NSObject+WCQTopmostViewController.m
//  rtm
//
//  Created by 王小腊 on 2017/11/15.
//  Copyright © 2017年 王小腊. All rights reserved.
//

#import "NSObject+WCQTopmostViewController.h"

@implementation NSObject (WCQTopmostViewController)

- (UIViewController *)wcq_topmostViewController {
    
    UIViewController *resultVC;
    resultVC = [self wcq_topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self wcq_topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}
- (UIViewController *)wcq_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self wcq_topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self wcq_topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
}
@end
