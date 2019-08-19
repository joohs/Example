//
//  UIButton+Edge.h
//  Example
//
//  Created by Jon on 2019/7/30.
//  Copyright © 2019 Jon.wu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ButtonPosition) {
    ButtonPositionWithLeftImageRightTitle = 0,//default
    ButtonPositionWithLeftTitleRightImage = 1,
    ButtonPositionWithTopImageBottomTitle = 2,
    ButtonPositionWithTopTitleBottomImage = 3,
};

@interface UIButton (Edge)

- (void)edgePosition:(ButtonPosition)edgePosition gap:(CGFloat)gap;

@end

NS_ASSUME_NONNULL_END
