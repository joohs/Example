//
//  WHForceTouchCollectionViewCell.m
//  Example
//
//  Created by Jon on 2018/5/29.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHForceTouchCollectionViewCell.h"

@interface WHForceTouchCollectionViewCell ()

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIButton *addButton;

@end

@implementation WHForceTouchCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:self.textLabel];
        self.addButton = [[UIButton alloc] init];
        [self.contentView addSubview:self.addButton];
        [self.addButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.addButton.layer.borderColor = [UIColor grayColor].CGColor;
        self.addButton.layer.borderWidth = 1.f;
        [self.addButton addTarget:self action:@selector(addNumber:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)updateWithModel:(WHForceTouch *)model {
    self.textLabel.text = model.text;
    [self.textLabel sizeToFit];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(15));
        make.top.equalTo(@(15));
        make.right.equalTo(@(-15));
    }];
    [self.addButton setTitle:@"添加" forState:UIControlStateNormal];
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-15));
        make.width.equalTo(@(80));
        make.height.equalTo(@(30));
        make.top.equalTo(@(5));
    }];
}

- (void)addNumber:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(delegateAddNumber)]) {
        [self.delegate delegateAddNumber];
    }
}

@end
