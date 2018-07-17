//
//  WHStoreViewController.m
//  Example
//
//  Created by Jon on 2018/6/6.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHStoreViewController.h"
#import <StoreKit/StoreKit.h>
#import "WHStoreViewModel.h"

@interface WHStoreViewController ()<SKStoreProductViewControllerDelegate>

@property (nonatomic, strong) UIButton *storeBtn;
@property (nonatomic, strong) UIButton *scoreReviewBtn;
@property (nonatomic, strong) UIButton *appStoreBtn;
@property (nonatomic, strong) WHStoreViewModel *viewModel;

@end

@implementation WHStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.storeBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    self.storeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.storeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.storeBtn setTitle:@"前往商城评分" forState:UIControlStateNormal];
    [self.view addSubview:self.storeBtn];
    [self.storeBtn addTarget:self action:@selector(toAppStore) forControlEvents:UIControlEventTouchUpInside];
    self.storeBtn.layer.borderColor = [UIColor greenColor].CGColor;
    self.storeBtn.layer.borderWidth = 1.f;
    [self.storeBtn sizeToFit];
    
    self.appStoreBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    self.appStoreBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.appStoreBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.appStoreBtn setTitle:@"在app内弹出商店评分界面" forState:UIControlStateNormal];
    [self.view addSubview:self.appStoreBtn];
    [self.appStoreBtn addTarget:self action:@selector(inAppShowAppStore) forControlEvents:UIControlEventTouchUpInside];
    self.appStoreBtn.layer.borderColor = [UIColor greenColor].CGColor;
    self.appStoreBtn.layer.borderWidth = 1.f;
    [self.appStoreBtn sizeToFit];
    
    self.scoreReviewBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    self.scoreReviewBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.scoreReviewBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.scoreReviewBtn setTitle:@"应用内评分" forState:UIControlStateNormal];
    [self.view addSubview:self.scoreReviewBtn];
    [self.scoreReviewBtn addTarget:self action:@selector(toAppStoreReview) forControlEvents:UIControlEventTouchUpInside];
    self.scoreReviewBtn.layer.borderColor = [UIColor greenColor].CGColor;
    self.scoreReviewBtn.layer.borderWidth = 1.f;;
    [self.scoreReviewBtn sizeToFit];
    [self.storeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(15));
        make.top.equalTo(@(100));
        make.width.equalTo(@(self.storeBtn.width));
        make.height.equalTo(@(self.storeBtn.height));
    }];
    [self.appStoreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.storeBtn.mas_left).offset(0);
        make.top.equalTo(self.storeBtn).offset(80);
        make.width.equalTo(@(self.appStoreBtn.width));
        make.height.equalTo(@(self.appStoreBtn.height));
    }];
    [self.scoreReviewBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.storeBtn).offset(0);
        make.top.equalTo(self.appStoreBtn).offset(80);
        make.width.equalTo(@(self.scoreReviewBtn.width));
        make.height.equalTo(@(self.scoreReviewBtn.height));
    }];
    
    self.viewModel = [[WHStoreViewModel alloc] initWithViewContorller:self];
}

- (void)toAppStore {
    [self.viewModel toAppStore];
}

- (void)inAppShowAppStore {
    [self.viewModel inAppShowAppStore];
}

- (void)toAppStoreReview {
    [self.viewModel toAppStoreReview];
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

@end
