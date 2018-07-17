//
//  WHLongImageSectionController.m
//  Example
//
//  Created by Jon on 2018/6/19.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHLongImageSectionController.h"
#import "WHLongImageCollectionViewCell.h"
#import "WHLongImage.h"

@interface WHLongImageSectionController ()

@property (nonatomic, strong) WHLongImage *model;

@end

@implementation WHLongImageSectionController 

- (instancetype)init {
    self = [super init];
    if (self) {
        self.supplementaryViewSource = self;
    }
    return self;
}

- (void)didUpdateToObject:(id)object {
    self.model = (WHLongImage *)object;
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    WHLongImageCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[WHLongImageCollectionViewCell class] forSectionController:self atIndex:index];
    [cell updateModel:self.model];
    return cell;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return  CGSizeMake([self.collectionContext containerSize].width, 150);
}

- (CGSize)sizeForSupplementaryViewOfKind:(nonnull NSString *)elementKind atIndex:(NSInteger)index {
    return CGSizeMake([self.collectionContext containerSize].width, 5);
}

- (nonnull NSArray<NSString *> *)supportedElementKinds {
    return @[UICollectionElementKindSectionFooter];
}

- (nonnull __kindof UICollectionReusableView *)viewForSupplementaryElementOfKind:(nonnull NSString *)elementKind atIndex:(NSInteger)index {
    UICollectionReusableView *view = [self.collectionContext dequeueReusableSupplementaryViewOfKind:elementKind forSectionController:self class:[UICollectionReusableView class] atIndex:index];
    view.backgroundColor = [UIColor grayColor];
    return view;
}

@end
