//
//  WHImageDetailViewController.m
//  Example
//
//  Created by Jon on 2018/6/5.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHImageDetailViewController.h"

@interface WHImageDetailViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation WHImageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, KNavigationBarHeight, KScreen_Width, KScreen_Height-KNavigationBarHeight)];
    [self.view addSubview:self.imageView];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.imageView sd_setImageWithURL:self.imageUrl completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
    // Do any additional setup after loading the view.
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
