//
//  UserViewModel.h
//  AXUserInfo
//
//  Created by anxindeli on 2017/9/4.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserItemModel.h"
#import <UIKit/UIKit.h>

typedef void (^Success)();
typedef void (^Failure)();

@interface UserViewModel : NSObject
@property (nonatomic, strong) NSMutableArray *listArr;
@property (nonatomic, copy) Success success;
@property (nonatomic, copy) Failure failure;

/*
 请求用户数据
 */
- (void)getUserInfoData;
#pragma mark - 获取和TableView绑定的数据
/*
 返回某个section下row 的个数
 */
- (NSInteger)getRowCount:(NSInteger)section;
/*
 返回section的个数
 */
- (NSInteger)getSectionCount;
/*
 返回indexPath对应的 模型类
 */
- (UserItemModel *)getRowModelWithIndexPath:(NSIndexPath *)indexPath;

@end
