//
//  UILabel+AttributedString.m
//  Example
//
//  Created by Jon on 2019/8/17.
//  Copyright © 2019 Jon.wu. All rights reserved.
//

#import "UILabel+AttributedString.h"

@implementation UILabel (AttributedString)

/**
 * 字符串确定富文本
 */
- (void)setAttributedText:(NSString *)text matchString:(NSString *)matchString matchFont:(UIFont *)matchFont matchColor:(UIColor *)matchColor {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSFontAttributeName] = matchFont;
    dic[NSForegroundColorAttributeName] = matchColor;
    NSMutableArray *rangeArray = [self rangeOfSubString:text matchString:matchString];
    for (NSValue *value in rangeArray) {
        NSRange range = value.rangeValue;
        [attributedString addAttributes:dic range:range];
    }
    self.attributedText = attributedString;
}

/**
 * 标签确定富文本,默认标签 <em></em>
 * tagDic = @{@"begin": @"<tag>", @"end": @"</tag>"};
 */
- (void)setAttributedText:(NSString *)text tagDiction:(NSDictionary *)tagDiction matchFont:(UIFont *)matchFont matchColor:(UIColor *)matchColor {
    NSString *begin = @"<em>";
    NSString *end = @"</em>";
    if (tagDiction != nil && tagDiction.count != 0) {
        begin = tagDiction[@"begin"];
        end = tagDiction[@"end"];
    }
    // 获取到标签位置
    NSMutableArray *beginRangeArray = [self rangeOfSubString:text matchString:begin];
    NSMutableArray *endRangeArray = [self rangeOfSubString:text matchString:end];
    if (beginRangeArray.count != endRangeArray.count) {
        beginRangeArray = [NSMutableArray arrayWithArray:@[]];
        endRangeArray = [NSMutableArray arrayWithArray:@[]];
    }
    // 确定富文本位置
    NSMutableArray *rangeArray = [NSMutableArray array];
    for (int i = 0; i < beginRangeArray.count; i ++) {
        NSValue *beginValue = [beginRangeArray objectAtIndex:i];
        NSValue *endValue = [endRangeArray objectAtIndex:i];
        NSInteger beginLocal = beginValue.rangeValue.location;
        NSInteger beginLength = beginValue.rangeValue.length;
        NSInteger endLocal = endValue.rangeValue.location;
        NSInteger endLength = endValue.rangeValue.length;
        NSRange range = NSMakeRange(beginLocal - i * (beginLength + endLength), endLocal - beginLocal - beginLength);
        [rangeArray addObject:[NSValue valueWithRange:range]];
    }
    
    NSString *newText = text;
    newText = [newText stringByReplacingOccurrencesOfString:begin withString:@""];
    newText = [newText stringByReplacingOccurrencesOfString:end withString:@""];
    [self setAttributedText:newText rangeArray:rangeArray matchFont:matchFont matchColor:matchColor];
}

/**
 * 位置确定富文本
 */
- (void)setAttributedText:(NSString *)text rangeArray:(NSMutableArray *)rangeArray matchFont:(UIFont *)matchFont matchColor:(UIColor *)matchColor {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSFontAttributeName] = matchFont;
    dic[NSForegroundColorAttributeName] = matchColor;
    for (NSValue *value in rangeArray) {
        NSRange range = value.rangeValue;
        [attributedString addAttributes:dic range:range];
    }
    self.attributedText = attributedString;
}

/**
 * HTML展示富文本
 */
- (void)setAttributedHtmlText:(NSString *)htmlText {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithData:[htmlText dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    self.attributedText = attributedString;
}

/**
 * 位置确定富文本,图片
 */
- (void)setAttributedText:(NSString *)text rangeArray:(NSMutableArray *)rangeArray matchFont:(UIFont *)matchFont matchColor:(UIColor *)matchColor imageIndex:(NSInteger)imageIndex matchImage:(UIImage *)matchImage matchBounds:(CGRect)matchBounds {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSFontAttributeName] = matchFont;
    dic[NSForegroundColorAttributeName] = matchColor;
    for (NSValue *value in rangeArray) {
        NSRange range = value.rangeValue;
        [attributedString addAttributes:dic range:range];
    }
    //图片
    NSTextAttachment *attchImage = [[NSTextAttachment alloc] init];
    attchImage.image = matchImage;
    attchImage.bounds = matchBounds;
    NSAttributedString *attributedImage = [NSAttributedString attributedStringWithAttachment:attchImage];
    [attributedString insertAttributedString:attributedImage atIndex:imageIndex];
    self.attributedText = attributedString;
}

#pragma 找出文本中所有命中的字符串range数组
- (NSMutableArray *)rangeOfSubString:(NSString *)subString matchString:(NSString *)matchString {
    NSMutableArray *rangeArray = [NSMutableArray array];
    NSRange range = [subString rangeOfString:matchString];
    if (range.location != NSNotFound && range.length != 0) {
        for (int i = 0; i < subString.length - matchString.length + 1; i++) {
            NSString *rangeString = [subString substringWithRange:NSMakeRange(i, matchString.length)];
            if ([rangeString isEqualToString:matchString]) {
                NSRange range = NSMakeRange(i, matchString.length);
                [rangeArray addObject:[NSValue valueWithRange:range]];
            }
        }
    }
    return rangeArray;
}


@end
