//
//  WHMediator+ImageFlow.h
//  Example
//
//  Created by Jon on 2018/6/4.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHMediator.h"

@interface WHMediator (ImageFlow)

- (UIViewController *)WHComponentImageFlow_fetchViewController:(NSDictionary *)params;
- (UIViewController *)WHComponentImageFlow_fetchDetailViewController:(NSDictionary *)params;

@end
