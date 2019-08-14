//
//  ViewController.h
//  Example
//
//  Created by Jon on 2018/5/9.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, Times) {
    TimesWithOne,
    TimesWithTwo
};

@interface ViewController : UIViewController

@property (nonatomic, assign) Times times;

@end

