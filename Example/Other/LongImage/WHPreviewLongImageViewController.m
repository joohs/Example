//
//  WHPreviewLongImageViewController.m
//  Example
//
//  Created by Jon on 2018/6/25.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHPreviewLongImageViewController.h"

@interface WHPreviewLongImageViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation WHPreviewLongImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KScreen_Width, KScreen_Height)];
    [self.view addSubview:self.scrollView];
    
    self.imageView = [[UIImageView alloc] init];
    if (self.image) {
        [self.imageView setImage:self.image];
        [self.imageView sizeToFit];
    }
    [self.scrollView addSubview:self.imageView];
    self.scrollView.contentSize = CGSizeMake(KScreen_Width, self.imageView.height);
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
