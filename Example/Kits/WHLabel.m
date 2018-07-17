//
//  WHLabel.m
//  Example
//
//  Created by Jon on 2018/6/19.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHLabel.h"

@implementation WHLabel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.numberOfLines = 0;
        self.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.numberOfLines = 0;
        self.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

@end
