//
//  WHImageCollectionViewCell.m
//  Example
//
//  Created by Jon on 2018/6/4.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHImageCollectionViewCell.h"

@interface WHImageCollectionViewCell ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *dateLabel;

@end

@implementation WHImageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.frame = frame;
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.imageView];
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.dateLabel.font = [UIFont systemFontOfSize:10];
        self.dateLabel.textColor = [UIColor grayColor];
        [self.imageView addSubview:self.dateLabel];
    }
    return self;
}

- (void)updateWithImageUrl:(NSURL *)url date:(NSString *)date {
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(0));
        make.top.equalTo(@(0));
        make.width.equalTo(@(self.frame.size.width));
        make.height.equalTo(@(self.frame.size.height));
    }];
    [self.imageView sd_setImageWithURL:url completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (image) {
            if (image.size.width > kScreen_Width) {
                [self.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.width.equalTo(@(kScreen_Width));
                    make.height.equalTo(@(kScreen_Width*image.size.height/image.size.width));
                }];
                if ([self.delegate respondsToSelector:@selector(delegateReSetSize:)]) {
                    [self.delegate delegateReSetSize:CGSizeMake(kScreen_Width, kScreen_Width*image.size.height/image.size.width)];
                }
            }else {
                [self.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.width.equalTo(@(image.size.width));
                    make.height.equalTo(@(image.size.height));
                }];
                if ([self.delegate respondsToSelector:@selector(delegateReSetSize:)]) {
                    [self.delegate delegateReSetSize:image.size];
                }
            }
        }
    }];
    self.dateLabel.text = (date == nil)?@"":date;
    [self.dateLabel sizeToFit];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(15));
        make.bottom.equalTo(@(-10));
        make.width.equalTo(@(self.dateLabel.width));
        make.height.equalTo(@(self.dateLabel.height));
    }];
}

@end
