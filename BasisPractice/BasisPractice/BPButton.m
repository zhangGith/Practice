//
//  BPButton.m
//  BasisPractice
//
//  Created by Block on 2017/12/12.
//  Copyright © 2017年 Block. All rights reserved.
//

#import "BPButton.h"

@implementation BPButton

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    return CGRectMake(0, 0, contentRect.size.width / 2., contentRect.size.height);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(contentRect.size.width / 2, 0, contentRect.size.width / 2., contentRect.size.height);
}

- (void)setHighlighted:(BOOL)highlighted {
    
}

@end
