//
//  WHForceTouchSectionController.m
//  Example
//
//  Created by Jon on 2018/5/29.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHForceTouchSectionController.h"
#import "WHForceTouchCollectionViewCell.h"
#import "WHForceTouchCollectionReusableView.h"
#import "WHForceTouch.h"

@interface WHForceTouchSectionController ()<IGListSupplementaryViewSource, WHForceTouchCollectionViewCellDelegate>

@property (nonatomic, strong) WHForceTouch *model;

@end

@implementation WHForceTouchSectionController
/**
 * instancetype和id作为init的返回值异同点。
 *  同：都可以作为方法的返回类型
 *  异：
 *      1.instancetype可以返回和方法所在类相同类型的对象，id只能返回位置类型的对象
 *      2.instancetype只能作为返回值，不能像id那样作为参数
 *  instancetype的作用就是，使那些非关联返回类型的方法返回所在类的类型
 */
- (instancetype)init {
    self = [super init];
    if (self) {
        self.supplementaryViewSource = self;
    }
    return self;
}

- (void)didUpdateToObject:(id)object {
    self.model = (WHForceTouch *)object;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake([self.collectionContext containerSize].width, 44);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    WHForceTouchCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[WHForceTouchCollectionViewCell class] forSectionController:self atIndex:index];
    cell.delegate = self;
    [cell updateWithModel:self.model];
    return cell;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    UIViewController *vc = [[WHMediator sharedInstance] WHComponentForceTouch_fetchDetailViewController:@{@"model":self.model}];
    if (vc) {
        [self.viewController.navigationController pushViewController:vc animated:YES];
    }
}

- (void)delegateAddNumber {
    self.model.index += 1;
    self.model.text = [NSString stringWithFormat:@"index:%ld", self.model.index];
    [self.collectionContext performBatchAnimated:YES updates:^(id<IGListBatchContext>  _Nonnull batchContext) {
        [batchContext reloadSectionController:self];
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - supplement

- (NSArray<NSString *> *)supportedElementKinds {

    return @[UICollectionElementKindSectionFooter, UICollectionElementKindSectionHeader];
}

- (CGSize)sizeForSupplementaryViewOfKind:(NSString *)elementKind atIndex:(NSInteger)index {
    CGFloat height = 20;
    if ([elementKind isEqualToString:UICollectionElementKindSectionFooter]) {
        height = 10;
    }
    return CGSizeMake([self.collectionContext containerSize].width, height);
}

- (__kindof UICollectionReusableView *)viewForSupplementaryElementOfKind:(NSString *)elementKind atIndex:(NSInteger)index {
    WHForceTouchCollectionReusableView *view = [self.collectionContext dequeueReusableSupplementaryViewOfKind:elementKind forSectionController:self class:[WHForceTouchCollectionReusableView class] atIndex:index];
    if ([elementKind isEqualToString:UICollectionElementKindSectionFooter]) {
        view.backgroundColor = [UIColor blueColor];
    }else {
        view.backgroundColor = [UIColor greenColor];
    }
    return view;
}

@end
