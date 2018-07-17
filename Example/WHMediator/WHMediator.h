//
//  WHMediator.h
//  Example
//
//  Created by Jon on 2018/5/14.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WHMediator : NSObject

+ (instancetype)sharedInstance;
//针对url的调用
- (id)performActionWithUrl:(NSURL *)url completion:(void (^)(NSDictionary *))completion;
- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params shouldCacheTarget:(BOOL)shouldCacheTarget;

@end
