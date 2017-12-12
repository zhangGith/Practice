//
//  ScrollController.m
//  ProgressPrac
//
//  Created by Block on 2017/12/11.
//  Copyright © 2017年 Block. All rights reserved.
//

#import "ScrollController.h"

@interface ScrollController ()<UIScrollViewDelegate>

{
    UIScrollView *_scrollView;
}

@end

@implementation ScrollController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupScrollView];
}

- (void)setupScrollView {
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 2, self.view.frame.size.height);
    [self.view addSubview:_scrollView];
    _scrollView.bounces = NO;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    imageView.backgroundColor =[UIColor lightGrayColor];
    [_scrollView addSubview:imageView];
    _scrollView.contentInset = UIEdgeInsetsMake(10, 20, 30, 40);
    _scrollView.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
    imageView.userInteractionEnabled = YES;
    [imageView addGestureRecognizer:tap];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, 64)];
    [_scrollView addSubview:searchBar];
}

- (void)click:(UIGestureRecognizer *)ges {
    NSLog(@"%s", __func__);
}

#pragma mark -- scrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"%s", __func__);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%@", NSStringFromCGPoint(scrollView.contentOffset));
    if (scrollView.contentOffset.x >= self.view.frame.size.width) {
        self.navigationController.navigationBarHidden = YES;
    } else {
        self.navigationController.navigationBarHidden = NO;
    }
}

@end
