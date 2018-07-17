//
//  Target_ImageFlow.h
//  Example
//
//  Created by Jon on 2018/6/4.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHMediator.h"
#import "WHImageViewController.h"
#import "WHImageDetailViewController.h"

@interface Target_ImageFlow : WHMediator

- (UIViewController *)Action_Default:(NSDictionary *)params;
- (UIViewController *)Action_Detail:(NSDictionary *)params;

@end
