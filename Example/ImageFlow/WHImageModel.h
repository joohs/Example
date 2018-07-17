//
//  WHImageModel.h
//  Example
//
//  Created by Jon on 2018/6/4.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WHImageModel : NSObject<IGListDiffable>

@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *publishedAt;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSURL *url;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;

@end
