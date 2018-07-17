//
//  WHMediator+ImageFlow.m
//  Example
//
//  Created by Jon on 2018/6/4.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHMediator+ImageFlow.h"

@implementation WHMediator (ImageFlow)

- (UIViewController *)WHComponentImageFlow_fetchViewController:(NSDictionary *)params {
    UIViewController *vc = [self performTarget:@"ImageFlow" action:@"Default" params:params shouldCacheTarget:YES];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }
    return nil;
}

- (UIViewController *)WHComponentImageFlow_fetchDetailViewController:(NSDictionary *)params {
    UIViewController *vc = [self performTarget:@"ImageFlow" action:@"Detail" params:params shouldCacheTarget:YES];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }
    return nil;
}
@end
