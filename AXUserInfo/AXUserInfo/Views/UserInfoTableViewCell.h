//
//  UserInfoTableViewCell.h
//  AnXin
//
//  Created by anxindeli on 15/9/21.
//  Copyright (c) 2015年 anxindeli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserItemModel.h"

@interface UserInfoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;

@property (weak, nonatomic) IBOutlet UILabel *itemTitle;
@property (weak, nonatomic) IBOutlet UILabel *itemSubTitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLeft;
@property (weak, nonatomic) IBOutlet UIView *topLine;

- (void)setUserInfoCellContentWithProjectModel:(id)model  FirstRow:(BOOL)isFirstRow LastRow:(BOOL)isLastRow;

@end
