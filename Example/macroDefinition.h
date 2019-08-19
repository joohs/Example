//
//  macroDefinition.h
//  Example
//
//  Created by Jon on 2018/5/29.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#ifndef macroDefinition_h
#define macroDefinition_h

#define IsSupportForceTouch  ([UIApplication sharedApplication].delegate.window.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
#define KScreen_Width [UIScreen mainScreen].bounds.size.width
#define KScreen_Height [UIScreen mainScreen].bounds.size.height
#define KScreen_Height_All ([UIScreen mainScreen].bounds.size.height + (IsiPhoneX?34:0))
#define IsiPhoneX (KScreen_Width == 375 && KScreen_Height == 812)
#define KStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height
#define KNavigationBarHeight (44+KStatusBarHeight)
#define TodayWidgetUserDefaults @"group.com.wuxiangxiong.todaywidget"

#endif /* macroDefinition_h */
