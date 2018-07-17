//
//  WHForceTouch.h
//  Example
//
//  Created by Jon on 2018/5/29.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * NSString使用copy，而不是strong
 *  主要是为了防止NSString被修改
 *      假如只是针对NSString是无所谓的，但是如果一个NSString指向了一个NSMutableString的内存空间的话，
 *      如果使用了strong来修饰的话，在别处修改NSMutableString，那么NSString也会被修改，
 *      而使用copy进行深拷贝，会生成一份新的内存空间，原值不会被修改
 */
@interface WHForceTouch : NSObject<IGListDiffable>

@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) NSInteger index;

@end
