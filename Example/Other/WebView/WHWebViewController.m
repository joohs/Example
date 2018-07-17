//
//  WHWebViewController.m
//  Example
//
//  Created by Jon on 2018/6/25.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHWebViewController.h"

@interface WHWebViewController ()<UIWebViewDelegate, UITextFieldDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UIActivityIndicatorView *indicatorview;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, strong) NSString *inputUrl;
@property (nonatomic, strong) UIImage *image;

@end

@implementation WHWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreen_Width, kScreen_Height_All-kNavigationBarHeight)];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    [self loadWebViewWithPasteboard];
    
    [self rightBarItem];
    
    self.indicatorview = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:self.indicatorview];
}

- (void)loadWebViewWithPasteboard {
    UIPasteboard *board = [UIPasteboard generalPasteboard];
    if (board.string.length > 0 && ([board.string containsString:@"www"] || [board.string containsString:@"com"] || [board.string containsString:@"cn"])) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:board.string]]];
    }
}

- (void)rightBarItem {
    UIBarButtonItem *inputItem = [[UIBarButtonItem alloc] initWithTitle:@"输入网址" style:UIBarButtonItemStyleDone target:self action:@selector(inputUrl:)];
    UIBarButtonItem *createImageItem = [[UIBarButtonItem alloc] initWithTitle:@"生成图片" style:UIBarButtonItemStyleDone target:self action:@selector(createImage:)];
    self.navigationItem.rightBarButtonItems = @[inputItem, createImageItem];
}

- (void)inputUrl:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请输入网址" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        if (self.inputUrl.length) {
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.inputUrl]]];
        }
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.delegate = self;
    }];
    [alertController addAction:action];
    [self.navigationController presentViewController:alertController animated:YES completion:^{
        
    }];
}

- (void)createImage:(id)sender {
    CGFloat defaultHeight = self.webView.height;
    self.webView.height = self.height;
    self.image = [self createImageWithView:self.webView];
    self.webView.height = defaultHeight;
    UIViewController *vc = [[WHMediator sharedInstance] WHComponentOther_fetchPreViewLongImageViewController:@{@"image":self.image}];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - delegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.inputUrl = textField.text;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.indicatorview startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.indicatorview stopAnimating];
    self.height = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight"] doubleValue];
    
}

- (UIImage *)createImageWithView:(UIView *)view {
    //创建一个bitmap的context
    //并将他设置为当前正在使用的context
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [UIScreen mainScreen].scale);
    CGContextRef ref = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:ref];
    //从当前context中创建一个改变大小后的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
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
