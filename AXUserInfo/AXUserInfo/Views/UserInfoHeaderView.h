//
//  UserInfoHeaderView.h
//  AnXin
//
//  Created by anxindeli on 15/9/18.
//  Copyright (c) 2015年 anxindeli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoHeaderView : UIView

- (void)fillInUserInfo:(NSDictionary *)dict;
@property (nonatomic, copy) void (^clickMenuBlock)(NSInteger tag);
@property (nonatomic ,assign) BOOL isSelect;
@end
