//
//  WHUtils.m
//  Example
//
//  Created by Jon on 2019/8/17.
//  Copyright © 2019 Jon.wu. All rights reserved.
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

#pragma 找出文本中所有命中的字符串range数组
- (NSMutableArray *)rangeOfSubString:(NSString *)subString matchString:(NSString *)matchString {
    NSMutableArray *rangeArray = [NSMutableArray array];
    for (int i = 0; i < subString.length - matchString.length - 1; i++) {
        NSString *rangeString = [subString substringWithRange:NSMakeRange(i, matchString.length)];
        if ([rangeString isEqualToString:matchString]) {
            NSRange range = NSMakeRange(i, matchString.length);
            [rangeArray addObject:[NSValue valueWithRange:range]];
        }
    }
    return rangeArray;
}

@end
