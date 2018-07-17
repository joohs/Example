//
//  WHImageCollectionViewCell.h
//  Example
//
//  Created by Jon on 2018/6/4.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WHImageCollectionViewCellDelegate <NSObject>

- (void)delegateReSetSize:(CGSize)size;

@end

@interface WHImageCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) id<WHImageCollectionViewCellDelegate>delegate;
- (void)updateWithImageUrl:(NSURL *)url date:(NSString *)date;

@end
