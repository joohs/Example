//
//  WHAttributedDetailViewController.m
//  Example
//
//  Created by Jon on 2019/8/17.
//  Copyright © 2019 Jon.wu. All rights reserved.
//

#import "WHAttributedDetailViewController.h"

@interface WHAttributedDetailViewController ()

@property (nonatomic, strong) WHLabel *normalLabel;
@property (nonatomic, strong) WHLabel *pictureLabel;
@property (nonatomic, strong) WHLabel *positionLabel;
@property (nonatomic, strong) WHLabel *tagLabel;
@property (nonatomic, strong) WHLabel *htmlLabel;

@end

@implementation WHAttributedDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createNormalLabel];
    [self createPositionLabel];
    [self createImageLabel];
    [self createHTMLLabel];
    [self createTagLabel];
}

- (void)createNormalLabel {
    self.normalLabel = [[WHLabel alloc] initWithFrame:CGRectMake(15, KNavigationBarHeight + 20, kScreenWidth - 30, 10)];
    [self.view addSubview:self.normalLabel];
    [self.normalLabel setAttributedText:@"通过关键字来确定整个文本中包含的关键字范围来展示富文本" matchString:@"关键字" matchFont:[UIFont systemFontOfSize:20] matchColor:[UIColor redColor]];
    [self.normalLabel sizeToFit];
}

- (void)createPositionLabel {
    NSMutableArray *rangeArray = [NSMutableArray array];
    NSRange range = NSMakeRange(2, 2);
    [rangeArray addObject:[NSValue valueWithRange:range]];
    self.positionLabel = [[WHLabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(self.normalLabel.frame) + 20, kScreenWidth - 30, 10)];
    [self.view addSubview:self.positionLabel];
    [self.positionLabel setAttributedText:@"通过位置来确定这个文本中的范围从而确定在字符串中的富文本" rangeArray:rangeArray matchFont:[UIFont systemFontOfSize:20] matchColor:[UIColor redColor]];
    [self.positionLabel sizeToFit];
}

- (void)createImageLabel {
    NSMutableArray *rangeArray = [NSMutableArray array];
    NSRange range = NSMakeRange(2, 2);
    NSRange range1 = NSMakeRange(20, 3);
    [rangeArray addObject:[NSValue valueWithRange:range]];
    [rangeArray addObject:[NSValue valueWithRange:range1]];
    self.positionLabel = [[WHLabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(self.positionLabel.frame) + 20, kScreenWidth - 30, 10)];
    [self.view addSubview:self.positionLabel];
    [self.positionLabel setAttributedText:@"通过位置来确定这个文本中的范围从而确定在字符串中的富文本,同时文本中添加图片" rangeArray:rangeArray matchFont:[UIFont systemFontOfSize:20] matchColor:[UIColor redColor] imageIndex:4 matchImage:[UIImage imageNamed:@"downLoadQRCode"] matchBounds:CGRectMake(0, 0, 60, 60)];
    [self.positionLabel sizeToFit];
}

- (void)createHTMLLabel {
    NSString * htmlString = @" <html><body>Some html string \n<font size=\"13\" color=\"red\">This is some text!</font></body>";
    self.htmlLabel = [[WHLabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(self.positionLabel.frame) + 20, kScreenWidth - 30, 10)];
    [self.view addSubview:self.htmlLabel];
    [self.htmlLabel setAttributedHtmlText:htmlString];
    [self.htmlLabel sizeToFit];
}

- (void)createTagLabel {
    self.tagLabel = [[WHLabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(self.htmlLabel.frame) + 20, kScreenWidth - 20, 10)];
    [self.view addSubview:self.tagLabel];
    [self.tagLabel setAttributedText:@"这个是<body>tag</body><body>标签</body>的<body>富文本</body>" tagDiction:@{@"begin": @"<body>", @"end": @"</body>"} matchFont:[UIFont systemFontOfSize:20] matchColor:[UIColor redColor]];
    [self.tagLabel sizeToFit];
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
