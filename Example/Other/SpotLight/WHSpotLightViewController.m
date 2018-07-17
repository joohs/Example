//
//  WHSpotLightViewController.m
//  Example
//
//  Created by Jon on 2018/6/13.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHSpotLightViewController.h"
#import <CoreSpotlight/CoreSpotlight.h>

@interface WHSpotLightViewController ()

@end

@implementation WHSpotLightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMutableArray *items = [NSMutableArray new];
    NSArray *arr = @[
                     @{@"title":@"3DTouch", @"identifier": @"3DTouch", @"des": @"des", @"keywords": @[@"1", @"2", @"3"]},
                     @{@"title":@"SpotLight", @"identifier": @"SpotLight", @"des": @"des", @"keywords": @[@"1", @"2", @"3"]},
                     @{@"title":@"图片流", @"identifier": @"图片流", @"des": @"des", @"keywords": @[@"1", @"2", @"3"]},
                     @{@"title":@"App Store评分", @"identifier": @"App Store评分", @"des": @"des", @"keywords": @[@"1", @"2", @"3"]},
                     @{@"title":@"identifier5", @"identifier": @"identifier5", @"des": @"des", @"keywords": @[@"1", @"2", @"3"]},];
    for (NSDictionary *dic in arr) {
        CSSearchableItemAttributeSet *attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:@"type"];
        attributeSet.title = dic[@"title"];
        attributeSet.keywords = dic[@"keywords"];
        attributeSet.contentDescription = dic[@"des"];
        attributeSet.thumbnailData = UIImageJPEGRepresentation([UIImage imageNamed:@"refresh"], 1.f);
        CSSearchableItem *item = [[CSSearchableItem alloc] initWithUniqueIdentifier:dic[@"identifier"] domainIdentifier:@"domain" attributeSet:attributeSet];
        [items addObject:item];
    }
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:items completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"error");
        }
    }];
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
