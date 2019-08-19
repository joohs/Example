//
//  ViewController.m
//  Example
//
//  Created by Jon on 2018/5/9.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "ViewController.h"

/*
 3DTouch使用info.plist的好处在于第一次安装应用的时候可以直接显示，而用代码写的必须进入app之后才可以显示出来.
 两者不冲突，先添加plist中的再添加代码中的items。
 
 UIApplicationShortcutItems：数组中的元素就是我们的那些快捷选项标签。
 UIApplicationShortcutItemTitle：标签标题（必填）
 UIApplicationShortcutItemType：标签的唯一标识 （必填）
 UIApplicationShortcutItemIconType：使用系统图标的类型，如搜索、定位、home等（可选）
 UIApplicationShortcutItemIcon File：使用项目中的图片作为标签图标 （可选）
 UIApplicationShortcutItemSubtitle：标签副标题 （可选）
 UIApplicationShortcutItemUserInfo：字典信息，如传值使用 （可选）
 链接：https://www.jianshu.com/p/c61b5fd964ba
 **/

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UIViewControllerPreviewingDelegate>

@property (nonatomic, strong) UITableView *listTableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self example];
    self.title = @"模块";
    // Do any additional setup after loading the view, typically from a nib.
    self.dataArray = @[@"3DTouch", @"SpotLight", @"图片流", @"App Store评分", @"长图生成", @"获取指定股票实时动态", @"Button图片位置", @"iOS富文本"];
    [self registerForPreviewingWithDelegate:self sourceView:self.view];
    // Do any additional setup after loading the view.
    self.listTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreen_Width, KScreen_Height_All-KNavigationBarHeight) style:UITableViewStyleGrouped];
    [self.view addSubview:self.listTableView];
    self.listTableView.delegate = self;
    self.listTableView.dataSource = self;
    [self.listTableView reloadData];
#pragma mark - 传给todayWidget的参数
    NSUserDefaults *userDefault = [[NSUserDefaults alloc] initWithSuiteName:TodayWidgetUserDefaults];
    [userDefault setObject:TodayWidgetUserDefaults forKey:@"girlImage"];
    
    
    
    NSRange range = [@"我就是我" rangeOfString:@"我"];
    NSLog(@"%d %d", range.length, range.location);
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc = nil;
    switch (indexPath.row) {
        case 0:
        {
            vc = [[WHMediator sharedInstance] WHComponentForceTouch_fetchViewController:nil];
        }
            break;
        case 1:
        {
            vc = [[WHMediator sharedInstance] WHComponentOther_fetchSpotLightViewController:nil];
        }
            break;
        case 2:
        {
            vc = [[WHMediator sharedInstance] WHComponentImageFlow_fetchViewController:nil];
        }
            break;
        case 3:
        {
            vc = [[WHMediator sharedInstance] WHComponentOther_fetchStoreViewController:nil];
        }
            break;
        case 4:
        {
            vc = [[WHMediator sharedInstance] WHComponentOther_fetchLongImageViewController:nil];
        }
            break;
        case 5:
        {
            vc = [[WHMediator sharedInstance] WHComponentOther_fetchStockViewController:nil];
        }
            break;
        case 6:
        {
            vc = [[WHMediator sharedInstance] WHComponentOther_fetchButtonPositionViewController:nil];
        }
            break;
        case 7:
        {
            vc = [[WHMediator sharedInstance] WHComponentOther_fetchAttributeViewController:nil];
        }
            break;
        default:
            break;
    }
    if (vc) {
        vc.title = self.dataArray[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - ForceTouch
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    
}

- (nullable UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    
    return nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)example {

}













@end
