//
//  WHStockViewModel.m
//  Example
//
//  Created by Jon on 2018/7/17.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHStockViewModel.h"

@implementation WHStockViewModel

- (void)requestDataWithCode:(NSString *)code {
    NSString *urlString = [NSString stringWithFormat:@"http://ifzq.gtimg.cn/appstock/app/minute/query?code=%@&fmt=json", (code == nil?@"000036":code)];
    [[AFHTTPSessionManager manager] GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
