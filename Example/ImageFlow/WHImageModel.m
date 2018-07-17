//
//  WHImageModel.m
//  Example
//
//  Created by Jon on 2018/6/4.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHImageModel.h"

@implementation WHImageModel

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    self.url = [NSURL URLWithString:[dic objectForKey:@"url"]];
    self.publishedAt = [dic objectForKey:@"publishedAt"];
    self.publishedAt = [self getFormatDateString:self.publishedAt];
    return YES;
}

- (NSString *)getFormatDateString:(NSString *)dateString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [formatter stringForObjectValue:self.publishedAt];
}

- (id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object {
    return self == object;
}

@end
