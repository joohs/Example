//
//  AppDelegate.m
//  Example
//
//  Created by Jon on 2018/5/9.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
#pragma mark - 3DTouch
    if (IsSupportForceTouch) {
        [self shortcutItems];
    }
    // Override point for customization after application launch.
    return YES;
}

- (void)shortcutItems {
    UIApplicationShortcutIcon *firstIcon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"refresh"];//自定义
    UIApplicationShortcutIcon *secondIcon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLove];//系统提供一部分icon
    UIApplicationShortcutItem *firstItem = [[UIApplicationShortcutItem alloc] initWithType:@"identifier" localizedTitle:@"firstItem" localizedSubtitle:@"firstItem subtitle" icon:firstIcon userInfo:@{@"dic":@"userInfo"}];
    UIApplicationShortcutItem *secondItem = [[UIApplicationShortcutItem alloc] initWithType:@"identifierSecond" localizedTitle:@"secondItem" localizedSubtitle:@"secondItem subtitle" icon:secondIcon userInfo:@{}];
    [[UIApplication sharedApplication] setShortcutItems:@[firstItem, secondItem]];
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    NSString *type = shortcutItem.type;//唯一标识符
    NSDictionary *dic = shortcutItem.userInfo;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:type message:dic?dic[@"dic"]:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:cancelAction];
    [[[UIApplication sharedApplication].delegate.window rootViewController] presentViewController:alert animated:YES completion:nil];
}

#pragma mark - SpotLight
- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler {
    if ([userActivity.activityType isEqualToString:@"com.apple.corespotlightitem"]) {
        NSString *identifier = [userActivity.userInfo objectForKey:@"kCSSearchableItemActivityIdentifier"];
        if ([identifier isEqualToString:@"3DTouch"]) {
            UIViewController *vc = [[WHMediator sharedInstance] WHComponentForceTouch_fetchViewController:nil];
            if (vc) {
                [[WHUtils currentVisibleViewController].navigationController pushViewController:vc animated:YES];
            }
        }
    }
    return NO;
}

#pragma mark - todayWidget
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    if ([[url absoluteString] compare:@"Example"]) {
        UIViewController *vc = [[WHMediator sharedInstance] WHComponentForceTouch_fetchViewController:nil];
        if (vc) {
            [[WHUtils currentVisibleViewController].navigationController pushViewController:vc animated:YES];
        }
        return YES;
    }
    return NO;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
