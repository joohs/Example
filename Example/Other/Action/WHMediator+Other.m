//
//  WHMediator+Other.m
//  Example
//
//  Created by Jon on 2018/6/6.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHMediator+Other.h"

@implementation WHMediator (Other)

- (UIViewController *)WHComponentOther_fetchStoreViewController:(NSDictionary *)params {
    UIViewController *vc = [self performTarget:@"Other" action:@"Store" params:params shouldCacheTarget:YES];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }
    return nil;
}

- (UIViewController *)WHComponentOther_fetchSpotLightViewController:(NSDictionary *)params {
    UIViewController *vc = [self performTarget:@"Other" action:@"SpotLight" params:params shouldCacheTarget:YES];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }
    return nil;
}

- (UIViewController *)WHComponentOther_fetchLongImageViewController:(NSDictionary *)params {
    UIViewController *vc = [self performTarget:@"Other" action:@"LongImage" params:params shouldCacheTarget:YES];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }
    return nil;
}

- (UIViewController *)WHComponentOther_fetchPreViewLongImageViewController:(NSDictionary *)params {
    UIViewController *vc = [self performTarget:@"Other" action:@"PreViewLongImage" params:params shouldCacheTarget:YES];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }
    return nil;
}

- (UIViewController *)WHComponentOther_fetchWebViewViewController:(NSDictionary *)params {
    UIViewController *vc = [self performTarget:@"Other" action:@"WebView" params:params shouldCacheTarget:self];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }
    return nil;
}

- (UIViewController *)WHComponentOther_fetchStockViewController:(NSDictionary *)params {
    UIViewController *vc = [self performTarget:@"Other" action:@"Stock" params:params shouldCacheTarget:self];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }
    return nil;
}

- (UIViewController *)WHComponentOther_fetchButtonPositionViewController:(NSDictionary *)params {
    UIViewController *vc = [self performTarget:@"Other" action:@"Button" params:params shouldCacheTarget:self];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }
    return nil;
}

- (UIViewController *)WHComponentOther_fetchAttributeViewController:(NSDictionary *)params {
    UIViewController *vc = [self performTarget:@"Other" action:@"Attribute" params:params shouldCacheTarget:self];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }
    return nil;
}

@end
