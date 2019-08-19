//
//  Target_Other.m
//  Example
//
//  Created by Jon on 2018/6/6.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "Target_Other.h"
#import "WHStoreViewController.h"
#import "WHSpotLightViewController.h"
#import "WHLongImageViewController.h"
#import "WHPreviewLongImageViewController.h"
#import "WHWebViewController.h"
#import "WHStockViewController.h"
#import "WHButtonPositionViewController.h"
#import "WHAttributedStringViewController.h"

@implementation Target_Other

- (UIViewController *)Action_Store:(NSDictionary *)params {
    WHStoreViewController *vc = [[WHStoreViewController alloc] init];
    return vc;
}

- (UIViewController *)Action_SpotLight:(NSDictionary *)params {
    WHSpotLightViewController *vc = [[WHSpotLightViewController alloc] init];
    return vc;
}

- (UIViewController *)Action_LongImage:(NSDictionary *)params {
    WHLongImageViewController *vc = [[WHLongImageViewController alloc] init];
    return vc;
}

- (UIViewController *)Action_PreViewLongImage:(NSDictionary *)params {
    WHPreviewLongImageViewController *vc = [[WHPreviewLongImageViewController alloc] init];
    vc.dataMarray = [params objectForKey:@"dataMarray"];
    vc.image = [params objectForKey:@"image"];
    return vc;
}

- (UIViewController *)Action_WebView:(NSDictionary *)params {
    WHWebViewController *vc = [[WHWebViewController alloc] init];
    return vc;
}

- (UIViewController *)Action_Stock:(NSDictionary *)params {
    WHStockViewController *vc = [[WHStockViewController alloc] init];
    if ([params objectForKey:@"code"]) {
        vc.code = params[@"code"];
    }
    return vc;
}

- (UIViewController *)Action_Button:(NSDictionary *)params {
    WHButtonPositionViewController *vc = [[WHButtonPositionViewController alloc] init];
    return vc;
}

- (UIViewController *)Action_Attribute:(NSDictionary *)params {
    WHAttributedStringViewController *vc = [[WHAttributedStringViewController alloc] init];
    return vc;
}

@end
