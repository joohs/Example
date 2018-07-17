//
//  Target_Other.h
//  Example
//
//  Created by Jon on 2018/6/6.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHMediator.h"

@interface Target_Other : WHMediator

- (UIViewController *)Action_Store:(NSDictionary *)params;
- (UIViewController *)Action_SpotLight:(NSDictionary *)params;
- (UIViewController *)Action_PreViewLongImage:(NSDictionary *)params;
- (UIViewController *)Action_WebView:(NSDictionary *)params;
- (UIViewController *)Action_Stock:(NSDictionary *)params;

@end
