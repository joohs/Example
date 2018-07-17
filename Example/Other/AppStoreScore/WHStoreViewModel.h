//
//  WHStoreViewModel.h
//  Example
//
//  Created by Jon on 2018/6/6.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WHStoreViewModel : NSObject

- (instancetype)initWithViewContorller:(UIViewController *)viewControlle;
- (void)toAppStore ;
- (void)toAppStoreReview;
- (void)inAppShowAppStore;

@end
