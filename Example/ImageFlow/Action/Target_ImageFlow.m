//
//  Target_ImageFlow.m
//  Example
//
//  Created by Jon on 2018/6/4.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "Target_ImageFlow.h"


@implementation Target_ImageFlow

- (UIViewController *)Action_Default:(NSDictionary *)params {
    WHImageViewController *vc = [[WHImageViewController alloc] init];
    return vc;
}

- (UIViewController *)Action_Detail:(NSDictionary *)params {
    WHImageDetailViewController *vc = [[WHImageDetailViewController alloc] init];
    if ([params objectForKey:@"imageUrl"]) {
        vc.imageUrl = params[@"imageUrl"];
    }
    return vc;
}

@end
