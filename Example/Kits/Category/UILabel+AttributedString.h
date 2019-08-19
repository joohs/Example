//
//  UILabel+AttributedString.h
//  Example
//
//  Created by Jon on 2019/8/17.
//  Copyright © 2019 Jon.wu. All rights reserved.
//


#import "WHUtils.h"

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (AttributedString)

- (void)setAttributedHtmlText:(NSString *)htmlText;

- (void)setAttributedText:(NSString *)text matchString:(NSString *)matchString matchFont:(UIFont *)matchFont matchColor:(UIColor *)matchColor;

- (void)setAttributedText:(NSString *)text rangeArray:(NSMutableArray *)rangeArray matchFont:(UIFont *)font matchColor:(UIColor *)matchColor;

- (void)setAttributedText:(NSString *)text tagDiction:(NSDictionary *)tagDiction matchFont:(UIFont *)matchFont matchColor:(UIColor *)matchColor;

- (void)setAttributedText:(NSString *)text rangeArray:(NSMutableArray *)rangeArray matchFont:(UIFont *)font matchColor:(UIColor *)matchColor imageIndex:(NSInteger)imageIndex matchImage:(UIImage *)matchImage matchBounds:(CGRect)matchBounds;

@end

NS_ASSUME_NONNULL_END
