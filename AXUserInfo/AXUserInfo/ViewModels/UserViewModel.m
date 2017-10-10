//
//  UserViewModel.m
//  AXUserInfo
//
//  Created by anxindeli on 2017/9/4.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import "UserViewModel.h"
@interface UserViewModel(){
    
    BOOL isRefreshing;
}
@end
@implementation UserViewModel
- (instancetype)init{
    
    if (self = [super init]) {
        
//        [self getUserInfoData];
    }
    return self;
}
- (NSMutableArray *)listArr{
    
    if (!_listArr) {
        
        _listArr = [NSMutableArray array];
        NSArray *tempArr = @[@{@"title":@"我的投资",@"image":@"user_myinvest.png"},
                             @{@"title":@"回款计划",@"image":@"user_repayplan.png"},
                             @{@"title":@"交易明细",@"image":@"user_transfer.png"},
                             @{@"title":@"我的转让",@"image":@"user_myassignment.png"},
                             @{@"title":@"自动投标",@"image":@"user_autobid.png"},
                             @{@"title":@"风险测评",@"image":@"user_risktest.png"}
                             ];
        for (NSDictionary *data in tempArr) {
            
            UserItemModel *itemModel = [[UserItemModel alloc]initWithDict:data];
            [_listArr addObject:itemModel];
        }
    }
    return _listArr;
}
//获取项目列表信息
- (void)getUserInfoData{
    
    if (isRefreshing) {
        return;
    }
    isRefreshing = YES;
    
    __weak typeof(self)weakSelf = self;
    
}
- (void)dealWithProjectInfo:(NSDictionary *)data{
    //处理用户信息的
    
}
#pragma mark - 获取和TableView绑定的数据
- (NSInteger)getRowCount:(NSInteger)section{
    
    return self.listArr.count;
}
- (NSInteger)getSectionCount{

    return 1;
}
- (UserItemModel *)getRowModelWithIndexPath:(NSIndexPath *)indexPath{
    
    return self.listArr[indexPath.row];
}
@end
