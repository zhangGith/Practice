//
//  PracticeCell.m
//  ProgressPrac
//
//  Created by Block on 2017/12/7.
//  Copyright © 2017年 Block. All rights reserved.
//

#import "PracticeCell.h"

@implementation PracticeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.editingAccessoryView = [UIView new];
        
        self.selectionStyle = UITableViewCellSelectionStyleBlue;
        self.editingAccessoryType = UITableViewCellAccessoryNone;
        
        self.separatorInset = UIEdgeInsetsZero;
        
        self.shouldIndentWhileEditing = YES;
        
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableView *)tableView {
    self = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (nil == self) {
       self = [[PracticeCell alloc] initWithStyle:style reuseIdentifier:reuseIdentifier];
    }
    return self;
}

+ (instancetype)shareCell {
    static dispatch_once_t onceToken;
    static PracticeCell *cell = nil;
    dispatch_once(&onceToken, ^{
        cell = [[PracticeCell alloc] init];
    });
    return cell;
}

+ (instancetype)setupWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableView *)tableView {
    return [[self alloc] initWithStyle:style reuseIdentifier:reuseIdentifier tableView:tableView];
}

- (void)setName:(NSString *)name {
    _name = name;
    self.textLabel.text = name;
    self.detailTextLabel.text = @"234";
}

@end
