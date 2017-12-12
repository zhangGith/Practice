
//
//  TableController.m
//  ProgressPrac
//
//  Created by Block on 2017/12/7.
//  Copyright © 2017年 Block. All rights reserved.
//

#import "TableController.h"
#import "PracticeCell.h"
#import "CollectionViewController.h"
@interface TableController ()

{
    NSMutableArray *_dataArr;
}

@end

@implementation TableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    _dataArr = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        NSString *str = [NSString stringWithFormat:@"%d", i];
        [_dataArr addObject:str];
    }
//    self.tableView.editing = YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PracticeCell *cell = [PracticeCell setupWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellID" tableView:tableView];
    
    cell.name = _dataArr[indexPath.row];
    __weak typeof(&*cell) weakCell = cell;
    cell.block = ^(){
        __strong typeof(&*weakCell) strongCell = weakCell;
        NSLog(@"%@", strongCell.textLabel.text);
    };
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PracticeCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.block();
    CollectionViewController *collectionVC = [[CollectionViewController alloc] init];
    [self.navigationController pushViewController:collectionVC animated:YES];
    
//    [_dataArr insertObject:@"new cell" atIndex:indexPath.row + 1];
//    [tableView beginUpdates];
//
//    [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationTop];
//    [tableView endUpdates];
}

//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//}
//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [_dataArr removeObjectAtIndex:indexPath.row];
//        [tableView beginUpdates];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
//        [tableView endUpdates];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        [_dataArr insertObject:@"new cell" atIndex:indexPath.row];
//        [tableView beginUpdates];
//
//        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
//        [tableView endUpdates];
//
//    }
//}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 添加一个删除按钮
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"点击了删除");
        [_dataArr removeObjectAtIndex:indexPath.row];
        // 动态删除UITableView 的UITableViewCell的操作
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [tableView endUpdates];
    }];
    
    // 添加一个置顶按钮
    UITableViewRowAction *topRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"置顶" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"点击了置顶");
        [_dataArr exchangeObjectAtIndex:indexPath.row withObjectAtIndex:0];
        NSIndexPath *firstIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.section];
        [tableView moveRowAtIndexPath:indexPath toIndexPath:firstIndexPath];
    }];
    topRowAction.backgroundColor = [UIColor blueColor];
    
    // 添加一个更多按钮
    UITableViewRowAction *moreRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"更多" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"点击了更多");
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    }];
    moreRowAction.backgroundEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    
    
    return @[deleteRowAction, topRowAction, moreRowAction];
}

//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return  UITableViewCellEditingStyleDelete;
//}
//
- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    return YES;
}

//- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return @"delete";
//}

@end
