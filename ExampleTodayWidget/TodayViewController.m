//
//  TodayViewController.m
//  ExampleTodayWidget
//
//  Created by Jon on 2018/6/14.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>


@interface TodayViewController () <NCWidgetProviding>

@property (nonatomic, strong) UILabel *headerLabel;
@property (nonatomic, strong) UILabel *bottomLabel;
@property (nonatomic, strong) UIButton *backButton;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark - 和主应用程序共享数据
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.wuxiangxiong.todaywidget"];
    NSString *groupString = [userDefaults objectForKey:@"girlImage"];
    
    self.headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, self.view.frame.size.width-30, 0)];
    self.headerLabel.numberOfLines = 0;
    self.headerLabel.text = [NSString stringWithFormat:@"%@ bottomLabel出来的超慢,解决方法是在主线程执行", groupString];
    [self.view addSubview:self.headerLabel];
    [self.headerLabel sizeToFit];
    
    self.backButton = [[UIButton alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(self.headerLabel.frame)+10, 120, 40)];
    [self.backButton setTitle:@"返回应用程序" forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backButton];
    
    self.bottomLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.bottomLabel.numberOfLines = 0;
    [self.view addSubview:self.bottomLabel];
    // Do any additional setup after loading the view from its nib.
    if (@available(iOS 10.0, *)) {
        self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
    } else {
        // Fallback on earlier versions
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadRequest];
}

- (void)back:(UIButton *)btn {
    [self.extensionContext openURL:[NSURL URLWithString:@"Example://params"] completionHandler:nil];
}

- (void)loadRequest {
    NSString *api = @"https://www.apiopen.top/satinCommentApi?id=27610708&page=1";
    NSURLSession *session = [NSURLSession sharedSession];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:api] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.f];
    request.HTTPMethod = @"GET";
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"request error");
        }else {
            NSError *error = nil;
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            if (error) {
                NSLog(@"解析失败");
                return ;
            }
            NSArray *arr = dic[@"data"][@"hot"][@"list"];
            NSInteger count = [dic[@"data"][@"hot"][@"info"][@"count"] integerValue]-1;
            NSDictionary *singleDic = [arr objectAtIndex:arc4random()%count];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.bottomLabel.frame = CGRectMake(15, CGRectGetMaxY(self.backButton.frame)+20, self.view.frame.size.width-30, 0);
                self.bottomLabel.text = singleDic[@"content"];
                [self.bottomLabel sizeToFit];
            });
        }
    }];
    [task resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData
    completionHandler(NCUpdateResultNewData);
}

- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize  API_AVAILABLE(ios(10.0)){
    if (@available(iOS 10.0, *)) {
        if (activeDisplayMode == NCWidgetDisplayModeExpanded) {
            self.preferredContentSize = CGSizeMake(0, CGRectGetMaxY(self.bottomLabel.frame)+20);
        }else {
            self.preferredContentSize = CGSizeMake(0, 60);
            
        }
    } else {
        // Fallback on earlier versions
        self.preferredContentSize = maxSize;
    }
}

#pragma mark - 调整内边距
- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

@end
