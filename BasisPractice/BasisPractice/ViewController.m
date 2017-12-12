//
//  ViewController.m
//  BasisPractice
//
//  Created by Block on 2017/12/12.
//  Copyright © 2017年 Block. All rights reserved.
//

#import "ViewController.h"
#import "BPButton.h"

@interface ViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self setupButton];
//    [self setupDatePicker];
//    [self setupPageControl];
    
//    [self setupImagePickerController];
}

- (void)setupImagePickerController {
    //判断设备是否有摄像头
    BOOL isCanCamera = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    // 前面的摄像头是否可用
    BOOL isFrontAvailable = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
    //后面的摄像头是否可用
    BOOL isRearAvailable = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];

    // 相册是否可用
    BOOL isPhotoLibraryAva = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
//    // 是否可以在相册中选择视频
//    BOOL isCanUserPickMediaFromLia = [self cameraSupportMedia:@"123" sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
    if (isCanCamera) {
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        [controller setSourceType:UIImagePickerControllerSourceTypeCamera];
        [controller setMediaTypes:@[@"public.image", @"public.video"]];
        
        [controller setVideoQuality:UIImagePickerControllerQualityTypeHigh];
        [controller setVideoMaximumDuration:30.];
        controller.allowsEditing = YES;
        controller.delegate = self;
        
        [self.navigationController presentViewController:controller animated:YES completion:nil];
    }
}

// 判断是否支持某种多媒体类型：拍照，视频
- (BOOL)cameraSupportMedia:(NSString *)paraMediaType sourceType:(UIImagePickerControllerSourceType)sourceType {
    __block BOOL result  = NO;
    if (paraMediaType.length == 0) {
        return NO;
    }
    NSArray *availableTypes = [UIImagePickerController availableMediaTypesForSourceType:sourceType];
    [availableTypes enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paraMediaType]) {
            result = YES;
        }
    }];
    return result;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    NSLog(@"%s", __func__);
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    NSLog(@"%@", mediaType);
    [picker dismissViewControllerAnimated:YES completion:nil];
}


/*
- (void)setupButton {
    BPButton *btn = [BPButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 100, self.view.bounds.size.width - 40, 30);
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:@"icon_002_cover"] forState:UIControlStateNormal];
    btn.block = ^() {
        NSLog(@"123");
    };
    [self.view addSubview:btn];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3. * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        btn.block();
    });
}

- (void)setupDatePicker {
    UIDatePicker *picker = [[UIDatePicker alloc] init];
    picker.frame = CGRectMake(20, 150, self.view.bounds.size.width - 40, 60);
//    picker.datePickerMode = UIDatePickerModeDate;
    [picker setDate:[NSDate dateWithTimeIntervalSinceNow:10000.] animated:YES];
    [self.view addSubview:picker];
}

- (void)setupPageControl {
    UIPageControl *page = [[UIPageControl alloc] initWithFrame:CGRectMake(20, 220, self.view.bounds.size.width - 40, 30)];
    [self.view addSubview:page];
    page.numberOfPages = 5;
    page.currentPageIndicatorTintColor = [UIColor blackColor];
    page.pageIndicatorTintColor = [UIColor lightGrayColor];
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithFrame:CGRectMake(20, 260, self.view.bounds.size.width - 40, 30)];
    [self.view addSubview:segment];
    [segment insertSegmentWithTitle:@"123" atIndex:0 animated:YES];
    [segment insertSegmentWithTitle:@"asd" atIndex:1 animated:YES];
    
    segment.tintColor = [UIColor blackColor];
    
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(20, 220, self.view.bounds.size.width - 40, 30)];
    [self.view addSubview:slider];
    slider.minimumTrackTintColor = [UIColor redColor];
    slider.maximumTrackTintColor = [UIColor greenColor];
    
    UISwitch *swt = [[UISwitch alloc] initWithFrame:CGRectMake(20, 300, self.view.bounds.size.width - 40, 30)];
    [self.view addSubview:swt];
    swt.onTintColor = [UIColor redColor];
    swt.tintColor = [UIColor greenColor];
    swt.thumbTintColor = [UIColor yellowColor];
    
}
*/

@end
