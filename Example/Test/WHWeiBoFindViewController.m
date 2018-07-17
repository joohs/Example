//
//  WHWeiBoFindViewController.m
//  Example
//
//  Created by Jon on 2018/5/16.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHWeiBoFindViewController.h"
#import <IGListKit/IGListKit.h>
#import "WHWeiboSectionController.h"

@interface WHWeiBoFindViewController ()<IGListAdapterDelegate, IGListAdapterDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UIBarButtonItem *leftBar;
@property (nonatomic, strong) UIView *searchView;

@end

@implementation WHWeiBoFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [NSMutableArray array];
    [self.dataArray addObject:@"1"];
    [self.dataArray addObject:@"2"];
    [self.dataArray addObject:@"3"];

    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.adapter = [[IGListAdapter alloc] initWithUpdater:[[IGListAdapterUpdater alloc] init] viewController:self];
    self.adapter.delegate = self;
    self.adapter.dataSource = self;
    self.adapter.scrollViewDelegate = self;
    self.adapter.collectionView = self.collectionView;
    [self.adapter performUpdatesAnimated:YES completion:nil];
    [self createSearchView];
}

- (void)createSearchView {
    self.searchView = [[UIView alloc] initWithFrame:CGRectMake(44, 0, [UIScreen mainScreen].bounds.size.width-100, 44)];
    self.searchView.backgroundColor = [UIColor redColor];
    [self.navigationController.navigationBar addSubview:self.searchView];
}

- (void)createLeftBar {
    if (!self.leftBar) {
        self.leftBar = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(showAll)];
    }
    self.navigationItem.leftBarButtonItem = self.leftBar;
}

- (void)showAll {
    self.navigationItem.leftBarButtonItem = nil;
    self.title = @"";
    self.searchView.hidden = NO;
    [self.dataArray insertObject:@"2" atIndex:0];
    [self.adapter performUpdatesAnimated:YES completion:^(BOOL finished) {
        [self.dataArray insertObject:@"1" atIndex:0];
        [self.adapter performUpdatesAnimated:YES completion:^(BOOL finished) {
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y > (280-44-[UIApplication sharedApplication].statusBarFrame.size.height) && [self.dataArray count] > 1) {
        [self.dataArray removeObjectAtIndex:0];
        [self.dataArray removeObjectAtIndex:0];
        self.title = @"查看更多";
        [self createLeftBar];
        self.searchView.hidden = YES;
        [self.adapter performUpdatesAnimated:NO completion:^(BOOL finished) {
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionTop animated:NO];
        }];
    }
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
    WHWeiboSectionController *sc = [[WHWeiboSectionController alloc] init];
    return sc;
}

- (nonnull NSArray<id<IGListDiffable>> *)objectsForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return self.dataArray;
}

@end
