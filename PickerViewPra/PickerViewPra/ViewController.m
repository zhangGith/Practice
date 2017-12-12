//
//  ViewController.m
//  PickerViewPra
//
//  Created by Block on 2017/12/7.
//  Copyright © 2017年 Block. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSArray *arr;
}

@property (nonatomic, strong) UIPickerView *pickerView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(100, 200, self.view.frame.size.width - 200, 200)];
    
    //显示选中框
    self.pickerView.showsSelectionIndicator = YES;
    [self.view addSubview:self.pickerView];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    arr = @[@1, @2, @3, @4, @5];
}

#pragma mark -- UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return arr.count;
}

#pragma mark --UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[arr objectAtIndex:row] stringValue];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"----%@", arr[row]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
