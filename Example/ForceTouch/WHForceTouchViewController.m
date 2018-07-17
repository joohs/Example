//
//  WHForceTouchViewController.m
//  Example
//
//  Created by Jon on 2018/5/14.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHForceTouchViewController.h"
#import "WHForceTouchSectionController.h"
#import "WHForceTouchDetailViewController.h"
#import "WHForceTouch.h"

@interface WHForceTouchViewController ()<UIViewControllerPreviewingDelegate, IGListAdapterDataSource, IGListAdapterDelegate, WHForceTouchDetailViewControllerDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) NSMutableArray *dataMarray;

@end

@implementation WHForceTouchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataMarray = [NSMutableArray new];
    IGListCollectionViewLayout *layout = [[IGListCollectionViewLayout alloc] initWithStickyHeaders:YES topContentInset:0 stretchToEdge:YES];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    self.adapter.collectionView = self.collectionView;
    self.adapter.delegate = self;
    self.adapter.dataSource = self;
    [self registerForPreviewingWithDelegate:self sourceView:self.view];
    // Do any additional setup after loading the view.
    [self addModel];
    [self.adapter performUpdatesAnimated:YES completion:^(BOOL finished) {
        
    }];
}

- (void)viewDidLayoutSubviews {
    self.collectionView.frame = CGRectMake(0, kNavigationBarHeight, kScreen_Width, kScreen_Height_All-kNavigationBarHeight);
    
}

- (void)addModel {
    for (int i = 0; i < 20; i++) {
        WHForceTouch *model = [[WHForceTouch alloc] init];
        model.index = i;
        model.text = [NSString stringWithFormat:@"index:%d", i];
        [self.dataMarray addObject:model];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    CGPoint point = [self.collectionView convertPoint:location fromView:self.view];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:point];
    if (indexPath) {
        WHForceTouch *model = [self.dataMarray objectAtIndex:indexPath.section];
        UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
        previewingContext.sourceRect = [self.view convertRect:cell.frame fromView:self.collectionView];
        WHForceTouchDetailViewController *vc = (WHForceTouchDetailViewController *)[[WHMediator sharedInstance] WHComponentForceTouch_fetchDetailViewController:@{@"model":model}];
        vc.delegate = self;
        if (vc) {
            return vc;
        }
    }
    return nil;
}

- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    if (viewControllerToCommit) {
        [self showViewController:viewControllerToCommit sender:self];
    }
}

- (void)delegatePreviewAction:(WHForceTouch *)model {

    [self.adapter reloadDataWithCompletion:^(BOOL finished) {
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nullable UIView *)emptyViewForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return nil;
}

- (nonnull IGListSectionController *)listAdapter:(nonnull IGListAdapter *)listAdapter sectionControllerForObject:(nonnull id)object {
    return [[WHForceTouchSectionController alloc] init];
}

- (nonnull NSArray<id<IGListDiffable>> *)objectsForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return self.dataMarray;
}

- (void)listAdapter:(nonnull IGListAdapter *)listAdapter didEndDisplayingObject:(nonnull id)object atIndex:(NSInteger)index {
    
}

- (void)listAdapter:(nonnull IGListAdapter *)listAdapter willDisplayObject:(nonnull id)object atIndex:(NSInteger)index {
    
}


@end
