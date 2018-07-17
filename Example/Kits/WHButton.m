//
//  WHButton.m
//  Example
//
//  Created by Jon on 2018/6/19.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHButton.h"

@implementation WHButton

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

@end
