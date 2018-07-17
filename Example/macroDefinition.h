//
//  macroDefinition.h
//  Example
//
//  Created by Jon on 2018/5/29.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#ifndef macroDefinition_h
#define macroDefinition_h

#define isSupportForceTouch  ([UIApplication sharedApplication].delegate.window.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
#define kScreen_Width [UIScreen mainScreen].bounds.size.width
#define kScreen_Height [UIScreen mainScreen].bounds.size.height
#define kScreen_Height_All ([UIScreen mainScreen].bounds.size.height + (isiPhoneX?34:0))
#define isiPhoneX (kScreen_Width == 375 && kScreen_Height == 812)
#define kStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height
#define kNavigationBarHeight (44+kStatusBarHeight)
#define todayWidgetUserDefaults @"group.com.wuxiangxiong.todaywidget"

#endif /* macroDefinition_h */
