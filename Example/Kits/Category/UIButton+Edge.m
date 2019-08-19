//
//  UIButton+Edge.m
//  Example
//
//  Created by Jon on 2019/7/30.
//  Copyright © 2019 Jon.wu. All rights reserved.
//

#import "UIButton+Edge.h"

@implementation UIButton (Edge)

// 需要注意 edgePosition的样式需要足够的宽高，才会展示想要的样式
- (void)edgePosition:(ButtonPosition)edgePosition gap:(CGFloat)gap {
    if (edgePosition == ButtonPositionWithLeftTitleRightImage) {
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.imageView.bounds.size.width-gap, 0, self.imageView.bounds.size.width)];
        [self setImageEdgeInsets:UIEdgeInsetsMake(0, self.titleLabel.bounds.size.width+gap, 0, -self.titleLabel.bounds.size.width)];
    } else if(edgePosition == ButtonPositionWithTopImageBottomTitle) {
        [self setTitleEdgeInsets:UIEdgeInsetsMake(self.imageView.bounds.size.height+gap ,-self.imageView.bounds.size.width, 0, 0)];
        [self setImageEdgeInsets:UIEdgeInsetsMake(0, 0, self.titleLabel.bounds.size.height+gap, -self.titleLabel.bounds.size.width)];
    } else if(edgePosition == ButtonPositionWithTopTitleBottomImage) {
        [self setTitleEdgeInsets:UIEdgeInsetsMake(-self.imageView.bounds.size.height-gap ,-self.imageView.bounds.size.width, 0, 0)];
        [self setImageEdgeInsets:UIEdgeInsetsMake(self.titleLabel.bounds.size.height+gap, 0, 0, -self.titleLabel.bounds.size.width)];
    } else {
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, gap, 0, 0)];
        [self setImageEdgeInsets:UIEdgeInsetsMake(0, -gap, 0, 0)];
    }
}

@end
