//
//  WHMediator+Other.h
//  Example
//
//  Created by Jon on 2018/6/6.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHMediator.h"

@interface WHMediator (Other)

- (UIViewController *)WHComponentOther_fetchStoreViewController:(NSDictionary *)params;
- (UIViewController *)WHComponentOther_fetchSpotLightViewController:(NSDictionary *)params;
- (UIViewController *)WHComponentOther_fetchLongImageViewController:(NSDictionary *)params;
- (UIViewController *)WHComponentOther_fetchPreViewLongImageViewController:(NSDictionary *)params;
- (UIViewController *)WHComponentOther_fetchWebViewViewController:(NSDictionary *)params;
- (UIViewController *)WHComponentOther_fetchStockViewController:(NSDictionary *)params;
- (UIViewController *)WHComponentOther_fetchButtonPositionViewController:(NSDictionary *)params;
- (UIViewController *)WHComponentOther_fetchAttributeViewController:(NSDictionary *)params;

@end
