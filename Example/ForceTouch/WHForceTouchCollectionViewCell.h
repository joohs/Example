//
//  WHForceTouchCollectionViewCell.h
//  Example
//
//  Created by Jon on 2018/5/29.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WHForceTouch.h"

@protocol WHForceTouchCollectionViewCellDelegate <NSObject>

- (void)delegateAddNumber;

@end

@interface WHForceTouchCollectionViewCell : UICollectionViewCell
/**
 *  delegate的修饰符需要使用weak，主要是为了避免循环引用
 *  比如说一个界面中的某个控件实现了delegate，这个时候delegate持有了这个界面，
 *  当需要释放这个界面的时候，就需要释放这个控件，这时候又需要先释放代理，代理又需要释放这个界面
 */
@property (nonatomic, weak) id<WHForceTouchCollectionViewCellDelegate> delegate;
- (void)updateWithModel:(WHForceTouch *)model;

@end
