//
//  WHUtils.h
//  Example
//
//  Created by Jon on 2019/8/17.
//  Copyright © 2019 Jon.wu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WHUtils : NSObject

+ (UIViewController *)currentVisibleViewController;

- (NSMutableArray *)rangeOfSubString:(NSString *)subString matchString:(NSString *)matchString;

@end

NS_ASSUME_NONNULL_END
