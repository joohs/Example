//
//  WHBaseModel.m
//  Example
//
//  Created by Jon on 2018/6/20.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHBaseModel.h"

@implementation WHBaseModel

- (id <NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object {
    return self == object;
}

@end
