//
//  UIButton+Edge.m
//  Example
//
//  Created by Jon on 2019/7/30.
//  Copyright © 2019 Jon.wu. All rights reserved.
//

#import "UIButton+Edge.h"

@implementation UIButton (Edge)

- (void)edgePosition:(ButtonPosition)edgePosition gap:(CGFloat)gap {
    if (edgePosition == ButtonPositionWithLeftTitleRightImage) {
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.imageView.bounds.size.width-gap/2, 0, self.imageView.bounds.size.width)];
        [self setImageEdgeInsets:UIEdgeInsetsMake(0, self.titleLabel.bounds.size.width+gap/2, 0, -self.titleLabel.bounds.size.width)];
    }else if(edgePosition == ButtonPositionWithTopImageBottomTitle){
        [self setTitleEdgeInsets:UIEdgeInsetsMake(self.imageView.bounds.size.height+gap/2 ,-self.imageView.bounds.size.width, 0, 0)];
        [self setImageEdgeInsets:UIEdgeInsetsMake(0, self.titleLabel.bounds.size.width/2, self.titleLabel.bounds.size.height+gap/2, -self.titleLabel.bounds.size.width/2)];
    }else if(edgePosition == ButtonPositionWithTopTitleBottomImage){
        [self setTitleEdgeInsets:UIEdgeInsetsMake(-self.imageView.bounds.size.height-gap/2 ,-self.imageView.bounds.size.width, 0, 0)];
        [self setImageEdgeInsets:UIEdgeInsetsMake(self.titleLabel.bounds.size.height+gap/2, 0, 0, -self.titleLabel.bounds.size.width)];
    }else{
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, gap/2, 0, 0)];
        [self setImageEdgeInsets:UIEdgeInsetsMake(0, -gap/2, 0, 0)];
    }
}

@end
