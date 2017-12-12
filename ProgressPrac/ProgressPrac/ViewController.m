//
//  ViewController.m
//  ProgressPrac
//
//  Created by Block on 2017/12/7.
//  Copyright © 2017年 Block. All rights reserved.
//

#import "ViewController.h"
#import "TableController.h"

@interface ViewController ()<UITabBarDelegate>
{
    UIProgressView *progressView;
    NSTimer *timer;
    CGFloat proValue;
    UIActivityIndicatorView *actView;
    UITabBar *tabbar;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //进度条
    progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width - 20, 50)];
    progressView.progressViewStyle = UIProgressViewStyleDefault;
    progressView.progressTintColor = [UIColor redColor];
    progressView.trackTintColor = [UIColor yellowColor];
    [self.view addSubview:progressView];
    
    //菊花
    actView = [[UIActivityIndicatorView alloc] init];
    [self.view addSubview:actView];
    [actView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    actView.center = CGPointMake(300, 300);
    
    //tabbar
    UITabBarItem *tabBarItem01 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:1];
    UITabBarItem *tabBarItem02 = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemHistory tag:2];
    UITabBarItem *tabBarItem03 = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemContacts tag:3];
    UITabBarItem *tabBarItem04 = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemMore tag:4];
    tabbar = [[UITabBar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width, 44)];
    tabbar.items = @[tabBarItem01, tabBarItem02, tabBarItem03, tabBarItem04];
    tabbar.delegate = self;
    //选中后颜色
    tabbar.tintColor = [UIColor redColor];
    //tabbar主色调
    tabbar.barTintColor = [UIColor yellowColor];
    //未被选中颜色
    tabbar.unselectedItemTintColor = [UIColor blueColor];
//    [self.view addSubview:tabbar];
    
    
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationController.toolbar.barStyle = UIBarStyleDefault;
    self.navigationController.toolbarHidden = NO;
    self.title = @"123";
    self.navigationController.toolbar.barTintColor = [UIColor yellowColor];
    self.navigationController.toolbar.tintColor = [UIColor blackColor];
    
    UIBarButtonItem *wordBtn = [[UIBarButtonItem alloc] initWithTitle:@"文章" style:UIBarButtonItemStylePlain target:self action:@selector(click:)];
    UIBarButtonItem *imageBtn = [[UIBarButtonItem alloc] initWithImage:nil style:UIBarButtonItemStylePlain target:self action:@selector(click:)];
    UIBarButtonItem *syBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(click:)];
    self.toolbarItems = @[wordBtn, imageBtn, syBtn];
    
    [self setupNavigationBar];
//    self.preferredStatusBarStyle
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)setupNavigationBar {
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    self.navigationController.navigationBar.tintColor = [UIColor greenColor];
    self.navigationController.navigationBar.clipsToBounds = YES;
    
    // 设置导航栏返回按钮
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc]
                                          initWithTitle:@"返回"
                                          style:UIBarButtonItemStylePlain
                                          target:self
                                          action:nil];
    self.navigationItem.backBarButtonItem = backBarButtonItem;
    // 设置导航栏其他按钮
    UIBarButtonItem *closeBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(click:)];
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(click:)];
    UIBarButtonItem *but = [[UIBarButtonItem alloc] initWithCustomView:[UIButton buttonWithType:UIButtonTypeContactAdd]];
    self.navigationItem.rightBarButtonItems = @[closeBarButtonItem, btn, but];
    // 设置左侧自定义按钮是否与返回按钮共同存在
    self.navigationItem.leftItemsSupplementBackButton = YES;
}

- (void)click:(UIBarButtonItem *)sender {
    
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSLog(@"%ld", item.tag);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    proValue = 0;
    timer = [NSTimer scheduledTimerWithTimeInterval:1. target:self selector:@selector(progressChange:) userInfo:nil repeats:YES];
    
    
    
    if (!actView.isAnimating) {
        [actView startAnimating];
    } else {
        [actView stopAnimating];
    }
    
    __weak typeof(&*self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3. * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong typeof(&*weakSelf) strongSelf = weakSelf;
        [strongSelf.navigationController pushViewController:[[TableController alloc] init] animated:YES];
    });
    
}

- (void)progressChange:(id)sender {
    if (proValue >= 9) {
        [timer invalidate];
    } else {
        [progressView setProgress:(++proValue) / 9 animated:YES];
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
