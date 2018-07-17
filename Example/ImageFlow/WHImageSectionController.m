//
//  WHImageSectionController.m
//  Example
//
//  Created by Jon on 2018/6/4.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHImageSectionController.h"
#import "WHImageCollectionViewCell.h"
#import "WHImageModel.h"

@interface WHImageSectionController ()<WHImageCollectionViewCellDelegate>

@property (nonatomic, strong) WHImageModel *model;

@end

@implementation WHImageSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)didUpdateToObject:(id)object {
    self.model = (WHImageModel *)object;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.model.width, self.model.height);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    WHImageCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[WHImageCollectionViewCell class] forSectionController:self atIndex:index];
    cell.delegate = self;
    [cell updateWithImageUrl:self.model.url date:self.model.publishedAt];
    return cell;
}

- (void)delegateReSetSize:(CGSize)size {
    if (self.model.height != 0) {
        return;
    }
    self.model.height = size.height;
    self.model.width = size.width;
    [self.collectionContext performBatchAnimated:YES updates:^(id<IGListBatchContext>  _Nonnull batchContext) {
        [batchContext reloadSectionController:self];
    } completion:^(BOOL finished) {
        
    }];
}

@end
