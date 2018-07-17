//
//  WHImageViewModel.m
//  Example
//
//  Created by Jon on 2018/5/31.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHImageViewModel.h"

@interface WHImageViewModel ()

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation WHImageViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.dataArray = [NSMutableArray new];
    }
    return self;
}

- (void)loadDataWithRefresh:(BOOL)refresh block:(loadBlock)block {
    self.page ++;
    if (refresh) {
        self.page = 1;
        [self.dataArray removeAllObjects];
    }
    [[AFHTTPSessionManager manager] GET:[NSString stringWithFormat:@"https://www.apiopen.top/meituApi?page=%ld", (long)self.page] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject objectForKey:@"data"]) {
            NSArray *item = responseObject[@"data"];
            for (NSDictionary *dic in item) {
                WHImageModel *model = [WHImageModel modelWithDictionary:dic];
                [self.dataArray addObject:model];
            }
        }
        if (block) {
            block(self.dataArray);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
