//
//  WHForceTouch.m
//  Example
//
//  Created by Jon on 2018/5/29.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHForceTouch.h"

@implementation WHForceTouch

- (id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object {
    return self == object;
}

@end
