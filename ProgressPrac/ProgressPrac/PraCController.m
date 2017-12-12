//
//  PraCController.m
//  ProgressPrac
//
//  Created by Block on 2017/12/11.
//  Copyright © 2017年 Block. All rights reserved.
//

#import "PraCController.h"
#import "ActionAndAlertController.h"

@interface PraCController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end


@implementation PraCController
static NSString *const cellID = @"cellPD";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    layout.minimumLineSpacing = 20;
    layout.itemSize = CGSizeMake(30, 30);
    layout.minimumInteritemSpacing = 5;
    [self.view addSubview:self.collectionView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = [UIColor clearColor];
//    self.collectionView.adjustedContentInset = UIEdgeInsetsMake(5, 10, 20, 30);
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.toolbarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

#define mark -- UICollectionViewDataSource AND Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    [self.navigationController popViewControllerAnimated:YES];
    
    ActionAndAlertController *actionVC = [[ActionAndAlertController alloc] init];
    [self.navigationController pushViewController:actionVC animated:YES];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 10, 20, 30);
}


@end
