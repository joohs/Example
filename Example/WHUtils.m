//
//  WHUtils.m
//  Example
//
//  Created by Jon on 2018/6/14.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHUtils.h"

@implementation WHUtils

+ (UIViewController *)currentVisibleViewController {
    return [self getVisibleViewController:[UIApplication sharedApplication].delegate.window.rootViewController];
}

+ (UIViewController *)getVisibleViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self getVisibleViewController:[((UINavigationController *) vc) visibleViewController]];
    }else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self getVisibleViewController:[((UITabBarController *)vc) selectedViewController]];
    }else {
        if (vc.presentedViewController) {
            return [self getVisibleViewController:vc.presentedViewController];
        }else {
            return vc;
        }
    }
}

@end
