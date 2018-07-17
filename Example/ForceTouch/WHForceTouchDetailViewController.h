//
//  WHForceTouchDetailViewController.h
//  Example
//
//  Created by Jon on 2018/5/14.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WHForceTouch.h"

@protocol WHForceTouchDetailViewControllerDelegate <NSObject>

- (void)delegatePreviewAction:(WHForceTouch *)model;

@end

@interface WHForceTouchDetailViewController : WHBaseViewController

@property (nonatomic, strong) WHForceTouch *model;
@property (nonatomic, weak) id<WHForceTouchDetailViewControllerDelegate>delegate;

@end
