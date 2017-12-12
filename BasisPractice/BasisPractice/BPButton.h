//
//  BPButton.h
//  BasisPractice
//
//  Created by Block on 2017/12/12.
//  Copyright © 2017年 Block. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BPButtonBlock)(void);
@interface BPButton : UIButton

@property (nonatomic, copy) BPButtonBlock block;

@end
