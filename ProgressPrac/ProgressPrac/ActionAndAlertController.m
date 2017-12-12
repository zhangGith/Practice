//
//  ActionAndAlertController.m
//  ProgressPrac
//
//  Created by Block on 2017/12/11.
//  Copyright © 2017年 Block. All rights reserved.
//

#import "ActionAndAlertController.h"
#import "ScrollController.h"
@interface ActionAndAlertController ()<UIAlertViewDelegate, UIActionSheetDelegate>

@end

@implementation ActionAndAlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AlertAndSheet";
    [self setupBarItem];
    
}

- (void)setupBarItem {
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"123" style:UIBarButtonItemStylePlain target:self action:@selector(click:)];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"1a" style:UIBarButtonItemStylePlain target:self action:nil];

    self.navigationItem.backBarButtonItem = leftItem;
    self.navigationItem.rightBarButtonItem = rightItem;
    ;
}

- (void)click:(UIBarButtonItem *)sender {
    NSLog(@"%s", __func__);
    [self.navigationController pushViewController:[[ScrollController alloc] init] animated:YES];
}

- (void)setupAlertView {
    UIAlertController *alert  = [UIAlertController alertControllerWithTitle:@"123" message:@"adasdf" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *OkAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"OK");
    }];
    [alert addAction:cancelAction];
    [alert addAction:OkAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"wwww" message:@"aldkaldf" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
//    [alertView show];
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"2221" delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:@"destructive" otherButtonTitles:@"ok", nil];
    [actionSheet showInView:self.view];
    
}

#pragma mark -- alertDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSLog(@"%@", [alertView buttonTitleAtIndex:buttonIndex]);
    }else {
        NSLog(@"123");
    }
}

#pragma mark -- actionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"%@", [actionSheet buttonTitleAtIndex:buttonIndex]);
}

- (void)actionSheetCancel:(UIActionSheet *)actionSheet {
    NSLog(@"%s", __func__);
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
