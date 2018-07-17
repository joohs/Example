//
//  WHMediator+ForceTouch.h
//  Example
//
//  Created by Jon on 2018/5/14.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHMediator.h"

@interface WHMediator (ForceTouch)

- (UIViewController *)WHComponentForceTouch_fetchViewController:(NSDictionary *)params;

- (UIViewController *)WHComponentForceTouch_fetchDetailViewController:(NSDictionary *)params;

@end
