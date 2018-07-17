//
//  WHWeiboSectionController.m
//  Example
//
//  Created by Jon on 2018/5/16.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHWeiboSectionController.h"

@interface WHWeiboSectionController ()<IGListSupplementaryViewSource>

@property (nonatomic, strong) NSString *string;

@end

@implementation WHWeiboSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.supplementaryViewSource = self;
    }
    return self;
}

- (void)didUpdateToObject:(id)object {
    self.string = object;
}

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat height = [self.collectionContext containerSize].height * 1.1;
    if (![self.string isEqualToString:@"3"]) {
        height = 100;
    }
    return CGSizeMake([self.collectionContext containerSize].width, height);
}

- (CGSize)sizeForSupplementaryViewOfKind:(NSString *)elementKind atIndex:(NSInteger)index {
    return CGSizeMake([self.collectionContext containerSize].width, 40);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    UICollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[UICollectionViewCell class] forSectionController:self atIndex:index];
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}

- (nonnull NSArray<NSString *> *)supportedElementKinds {
    return @[UICollectionElementKindSectionHeader];
}

- (nonnull __kindof UICollectionReusableView *)viewForSupplementaryElementOfKind:(nonnull NSString *)elementKind atIndex:(NSInteger)index {
    UICollectionReusableView *view = [self.collectionContext dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader forSectionController:self class:[UICollectionReusableView class] atIndex:index];
    view.backgroundColor = [UIColor blueColor];
    return view;
}

@end
