//
//  WHImageViewController.m
//  Example
//
//  Created by Jon on 2018/5/31.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHImageViewController.h"
#import "WHImageSectionController.h"
#import "WHImageViewModel.h"

@interface WHImageViewController ()<IGListAdapterDelegate, IGListAdapterDataSource, UIViewControllerPreviewingDelegate>

@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) WHImageViewModel *viewModel;
/**
 *  这里的属性就不允许使用strong，否则另一个数组会对当前数组进行值的变更
 */
@property (nonatomic, copy) NSMutableArray *dataMarray;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) NSInteger page;

@end

@implementation WHImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerForPreviewingWithDelegate:self sourceView:self.view];
    self.dataMarray = [NSMutableArray new];
    // Do any additional setup after loading the view.
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.adapter = [[IGListAdapter alloc] initWithUpdater:[[IGListAdapterUpdater alloc] init] viewController:self];
    self.adapter.collectionView = self.collectionView;
    self.adapter.delegate = self;
    self.adapter.dataSource = self;
    self.viewModel = [[WHImageViewModel alloc] init];
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @weakify(self)
        [self.viewModel loadDataWithRefresh:YES block:^(NSMutableArray *dataArray) {
            @strongify(self)
            [self.collectionView.mj_header endRefreshing];
            self.dataMarray = dataArray;
            [self.adapter performUpdatesAnimated:YES completion:^(BOOL finished) {
                
            }];
        }];
    }];
    self.collectionView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        @weakify(self)
        [self.viewModel loadDataWithRefresh:NO block:^(NSMutableArray *dataArray) {
            @strongify(self)
            [self.collectionView.mj_footer endRefreshing];
            if ([dataArray count] == [self.dataMarray count]) {
                [self.collectionView.mj_footer endRefreshingWithNoMoreData];
            }
            self.dataMarray = dataArray;
            [self.adapter performUpdatesAnimated:YES completion:^(BOOL finished) {
                NSLog(@"1");
            }];
        }];
    }];
    [self.collectionView.mj_header beginRefreshing];
}

- (void)viewDidLayoutSubviews {
    self.collectionView.frame = CGRectMake(0, kNavigationBarHeight, kScreen_Width, kScreen_Height_All-kNavigationBarHeight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)listAdapter:(nonnull IGListAdapter *)listAdapter didEndDisplayingObject:(nonnull id)object atIndex:(NSInteger)index {
    
}

- (void)listAdapter:(nonnull IGListAdapter *)listAdapter willDisplayObject:(nonnull id)object atIndex:(NSInteger)index {
    
}

- (nullable UIView *)emptyViewForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return nil;
}

- (nonnull IGListSectionController *)listAdapter:(nonnull IGListAdapter *)listAdapter sectionControllerForObject:(nonnull id)object {
    WHImageSectionController *sc = [[WHImageSectionController alloc] init];
    return sc;
}

- (nonnull NSArray<id<IGListDiffable>> *)objectsForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return self.dataMarray;
}

#pragma mark - preView
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    CGPoint point = [self.collectionView convertPoint:location fromView:self.view];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:point];
    if (indexPath) {
        WHImageModel *model = [self.dataMarray objectAtIndex:indexPath.section];
        UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
        UIViewController *vc = [[WHMediator sharedInstance] WHComponentImageFlow_fetchDetailViewController:@{@"imageUrl":model.url}];
        previewingContext.sourceRect = [self.view convertRect:cell.frame fromView:self.collectionView];
        return vc;
    }
    return nil;
}

- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    [self showViewController:viewControllerToCommit sender:self];
}

@end
