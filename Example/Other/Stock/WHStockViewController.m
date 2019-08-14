//
//  WHStockViewController.m
//  Example
//
//  Created by Jon on 2018/7/17.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHStockViewController.h"
#import "WHStockViewModel.h"

@interface WHStockViewController ()

@property (nonatomic, strong) WHStockViewModel *viewModel;

@end

@implementation WHStockViewController

- (void)viewDidLoad {
    self.viewModel = [[WHStockViewModel alloc] init];
    [self.viewModel requestDataWithCode:self.code];
}

@end
