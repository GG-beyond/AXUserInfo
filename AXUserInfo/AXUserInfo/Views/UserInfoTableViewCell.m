//
//  UserInfoTableViewCell.m
//  AnXin
//
//  Created by anxindeli on 15/9/21.
//  Copyright (c) 2015年 anxindeli. All rights reserved.
//

#import "UserInfoTableViewCell.h"

@implementation UserInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UIView *selectView = [[UIView alloc]initWithFrame:CGRectZero];
//    selectView.backgroundColor = RGBCOLOR(224, 230, 234);
    selectView.backgroundColor = [UIColor colorWithRed:224/255.0 green:230/255.0 blue:234/255.0 alpha:1];
    self.selectedBackgroundView = selectView;
    self.selectionStyle = UITableViewCellSelectionStyleGray;
    
}
- (void)setUserInfoCellContentWithProjectModel:(id)model  FirstRow:(BOOL)isFirstRow LastRow:(BOOL)isLastRow{
    
    if (isFirstRow) {
        self.topLine.hidden = NO;
    }else
    {
        self.topLine.hidden = YES;
    }
    if (isLastRow) {
        self.bottomLeft.constant = 0;
    }else
    {
        self.bottomLeft.constant = 20;
    }
    UserItemModel *userItemModel = model;
    self.itemSubTitle.text = @"";
    self.itemTitle.text = userItemModel.title;
    self.itemImageView.image = [UIImage imageNamed:userItemModel.imageName];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
