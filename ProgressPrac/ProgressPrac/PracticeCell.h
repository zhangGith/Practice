//
//  PracticeCell.h
//  ProgressPrac
//
//  Created by Block on 2017/12/7.
//  Copyright © 2017年 Block. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^PracticeCellBLock)(void);
@interface PracticeCell : UITableViewCell

@property (nonatomic, copy) PracticeCellBLock block;

@property (nonatomic, copy) NSString *name;
+ (instancetype)setupWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableView *)tableView;
@end
