//
//  WHMediator+ForceTouch.m
//  Example
//
//  Created by Jon on 2018/5/14.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHMediator+ForceTouch.h"

@implementation WHMediator (ForceTouch)

- (UIViewController *)WHComponentForceTouch_fetchViewController:(NSDictionary *)params {
    UIViewController *vc = [self performTarget:@"ForceTouch" action:@"Default" params:params shouldCacheTarget:YES];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    } else {
        return nil;
    }
}

- (UIViewController *)WHComponentForceTouch_fetchDetailViewController:(NSDictionary *)params {
    UIViewController *vc = [self performTarget:@"ForceTouch" action:@"Detail" params:params shouldCacheTarget:YES];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    } else {
        return nil;
    }
}
@end
