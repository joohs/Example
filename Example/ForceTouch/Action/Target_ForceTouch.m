//
//  Target_ForceTouch.m
//  Example
//
//  Created by Jon on 2018/5/14.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "Target_ForceTouch.h"
#import "WHForceTouchViewController.h"
#import "WHForceTouchDetailViewController.h"
#import "WHForceTouch.h"

@implementation Target_ForceTouch

- (UIViewController *)Action_Default:(NSDictionary *)params {
    WHForceTouchViewController *vc = [[WHForceTouchViewController alloc] init];
    return vc;
}

- (UIViewController *)Action_Detail:(NSDictionary *)params {
    WHForceTouchDetailViewController *vc = [[WHForceTouchDetailViewController alloc] init];
    if ([params objectForKey:@"model"]) {
        vc.model = (WHForceTouch *)[params objectForKey:@"model"];
    }
    return vc;
}

@end
