//
//  WHImageViewModel.h
//  Example
//
//  Created by Jon on 2018/5/31.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WHImageModel.h"

typedef void(^loadBlock)(NSMutableArray *dataArray);

@interface WHImageViewModel : NSObject

- (void)loadDataWithRefresh:(BOOL)refresh block:(loadBlock)block;

@end
