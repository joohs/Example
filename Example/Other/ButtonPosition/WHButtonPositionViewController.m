//
//  WHButtonPositionViewController.m
//  Example
//
//  Created by Jon on 2019/8/15.
//  Copyright © 2019 Jon.wu. All rights reserved.
//

#import "WHButtonPositionViewController.h"
#import "UIButton+Edge.h"


@interface WHButtonPositionViewController ()

@end

@implementation WHButtonPositionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    [self buttonPosition];
}

- (void)buttonPosition {
    UIButton *leftTitleRightImageBtn = [self createButton];
    leftTitleRightImageBtn.frame = CGRectMake(0, KNavigationBarHeight, 140, 140);
    [self.view addSubview:leftTitleRightImageBtn];
    [leftTitleRightImageBtn edgePosition:ButtonPositionWithLeftTitleRightImage gap:10];
    
    UIButton *leftImageRightTitleBtn = [self createButton];
    leftImageRightTitleBtn.frame = CGRectMake(CGRectGetMaxX(leftTitleRightImageBtn.frame), KNavigationBarHeight, 140, 140);
    [self.view addSubview:leftImageRightTitleBtn];
    [leftImageRightTitleBtn edgePosition:ButtonPositionWithLeftImageRightTitle gap:10];
    
    UIButton *topImageBottomTitleBtn = [self createButton];
    topImageBottomTitleBtn.frame = CGRectMake(0, CGRectGetMaxY(leftTitleRightImageBtn.frame), 140, 140);
    [self.view addSubview:topImageBottomTitleBtn];
    [topImageBottomTitleBtn edgePosition:ButtonPositionWithTopImageBottomTitle gap:10];
    
    UIButton *topTitleBottomImageBtn = [self createButton];
    topTitleBottomImageBtn.frame = CGRectMake(CGRectGetMaxX(topImageBottomTitleBtn.frame), CGRectGetMaxY(leftImageRightTitleBtn.frame), 140, 140);
    [self.view addSubview:topTitleBottomImageBtn];
    [topTitleBottomImageBtn edgePosition:ButtonPositionWithTopTitleBottomImage gap:10];
}

- (UIButton *)createButton {
    UIButton *btn = [[UIButton alloc] init];
    btn.layer.borderWidth = 1.f;
    [btn setTitle:@"位置" forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"downLoadQRCode"] forState:UIControlStateNormal];
    return btn;
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
