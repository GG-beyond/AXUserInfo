//
//  UserTableViewCell.h
//  AXUserInfo
//
//  Created by anxindeli on 2017/10/10.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *itemImageView;
@property (nonatomic, strong) UILabel *itemLabel;
@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UIView *bottomLine;
- (void)fillInDataWithModel:(id)itemModel first:(BOOL)isFirst last:(BOOL)isLast;

@end
