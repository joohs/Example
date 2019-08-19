//
//  WHLongImageViewController.m
//  Example
//
//  Created by Jon on 2018/6/14.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHLongImageViewController.h"
#import "WHLongImageSectionController.h"
#import "WHLongImage.h"

@interface WHLongImageViewController ()<IGListAdapterDelegate, IGListAdapterDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation WHLongImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [NSMutableArray array];
    // Do any additional setup after loading the view.
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    self.adapter.delegate = self;
    self.adapter.dataSource = self;
    self.adapter.collectionView = self.collectionView;
    [self.dataArray addObject:[self getModelWithIndex:@"1"]];
    [self.adapter performUpdatesAnimated:YES completion:^(BOOL finished) {
        
    }];
    [self createRightBar];
}

- (WHLongImage *)getModelWithIndex:(NSString *)index {
    WHLongImage *model = [[WHLongImage alloc] init];
    model.index = index;
    return model;
}

- (void)createRightBar {
    UIBarButtonItem *showItem = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStyleDone target:self action:@selector(showPopView:)];
    self.navigationItem.rightBarButtonItem = showItem;
}

- (void)viewDidLayoutSubviews {
    self.collectionView.frame = CGRectMake(0, 0, KScreen_Width, KScreen_Height_All);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showPopView:(UIBarButtonItem *)item {
    PopoverView *view = [PopoverView popoverView];
    view.style = PopoverViewStyleDark;
    [view showToPoint:CGPointMake(KScreen_Width-20, KNavigationBarHeight) withActions:[self actionPopView]];
}

- (NSArray *)actionPopView {
    PopoverAction *reduceAction = [PopoverAction actionWithTitle:@"减少个数" handler:^(PopoverAction *action) {
        [self.dataArray removeLastObject];
        [self.adapter performUpdatesAnimated:YES completion:^(BOOL finished) {
            
        }];
    }];
    PopoverAction *addAction = [PopoverAction actionWithTitle:@"增加个数" handler:^(PopoverAction *action) {
        [self.dataArray addObject:[self getModelWithIndex:[NSString stringWithFormat:@"%lu", (unsigned long)self.dataArray.count+1]]];
        [self.adapter performUpdatesAnimated:YES completion:^(BOOL finished) {
            
        }];
    }];
    PopoverAction *previewAction = [PopoverAction actionWithTitle:@"预览" handler:^(PopoverAction *action) {
        UIViewController *vc = [[WHMediator sharedInstance] WHComponentOther_fetchPreViewLongImageViewController:@{@"dataMarray":self.dataArray}];
        [self.navigationController pushViewController:vc animated:YES];
    }];
    PopoverAction *webAction = [PopoverAction actionWithTitle:@"web截图" handler:^(PopoverAction *action) {
        UIViewController *vc = [[WHMediator sharedInstance] WHComponentOther_fetchWebViewViewController:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }];
    return @[reduceAction, addAction, previewAction, webAction];
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
    WHLongImageSectionController *sc = [[WHLongImageSectionController alloc] init];
    return sc;
}

- (nonnull NSArray<id<IGListDiffable>> *)objectsForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return self.dataArray;
}

@end
