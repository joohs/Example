//
//  WHStoreViewModel.m
//  Example
//
//  Created by Jon on 2018/6/6.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHStoreViewModel.h"
#import <StoreKit/StoreKit.h>

@interface WHStoreViewModel ()<SKStoreProductViewControllerDelegate>

@property (nonatomic, strong) UIActivityIndicatorView *activityView;
@property (nonatomic, weak) UIViewController *viewController;

@end

@implementation WHStoreViewModel

- (instancetype)initWithViewContorller:(UIViewController *)viewController {
    self = [super init];
    if (self) {
        self.viewController = viewController;
        self.activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self.viewController.view addSubview:self.activityView];
        self.activityView.center = self.viewController.view.center;
    }
    return self;
}

- (void)toAppStore {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/id1359572843?action=write-review"] options:@{} completionHandler:nil];//?action=write-review 这一块可以不拼接，拼接之后直接跳转到评论界面
}

- (void)inAppShowAppStore {
    [self.activityView startAnimating];
    SKStoreProductViewController *storeVC = [[SKStoreProductViewController alloc] init];
    storeVC.delegate = self;
    [storeVC loadProductWithParameters:@{SKStoreProductParameterITunesItemIdentifier:@"1359572843"} completionBlock:^(BOOL result, NSError * _Nullable error) {
        [self.activityView stopAnimating];
        if (error) {
            NSLog(@"error");
        }else {
            [self.viewController presentViewController:storeVC animated:YES completion:^{
                
            }];
        }
    }];
}

- (BOOL)checkReViewScoreValid {
    //模拟服务器来计算时间
    NSTimeInterval nowTimeInterval = [[NSDate date] timeIntervalSince1970];
    nowTimeInterval -= 4*30*24*3600;//间隔4个月
    NSTimeInterval userDefaultTimeInterval = [[[NSUserDefaults standardUserDefaults] objectForKey:@"reviewScore"] doubleValue];
    if (userDefaultTimeInterval <= nowTimeInterval || userDefaultTimeInterval == 0) {
        return YES;
    }else {
        return NO;
    }
}

- (void)toAppStoreReview {
    if (@available(iOS 10.3, *)) {
        if ([self checkReViewScoreValid]) {
            [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]] forKey:@"reviewScore"];
            if ([SKStoreReviewController respondsToSelector:@selector(requestReview)]) {
                [SKStoreReviewController requestReview];
            }
        }else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"无法弹出" message:@"苹果限制了每个App每年最多弹出三次评分，所以需要在服务器端记录时间来限制，如果想用户多评分，可以在这种方式不可用期间，选用“toAppStore”方法来评分，这种方式是不限制次数的" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alert addAction:sureAction];
            [self.viewController presentViewController:alert animated:YES completion:nil];
        }
    } else {
        [self toAppStore];
    }
}

- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
}

@end
