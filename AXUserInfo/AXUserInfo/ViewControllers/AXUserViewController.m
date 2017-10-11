//
//  AXUserViewController.m
//  AXUserInfo
//
//  Created by anxindeli on 2017/9/4.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import "AXUserViewController.h"
#import "UserViewModel.h"
#import "UserItemModel.h"
#import "UserTableViewCell.h"

@interface AXUserViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *userTableView;
@property (nonatomic, strong) UserViewModel *userViewModel;
@end

@implementation AXUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.userTableView];
}
- (UITableView *)userTableView{
    
    if (!_userTableView) {
        _userTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) style:UITableViewStyleGrouped];
        _userTableView.backgroundColor = [UIColor colorWithRed:239/255.0 green:243/255.0 blue:246/255.0 alpha:1];
        _userTableView.delegate   = self;
        _userTableView.dataSource = self;
        _userTableView.showsVerticalScrollIndicator = NO;
        _userTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _userTableView.tableHeaderView = self.headerView;
        if (@available(iOS 11.0, *)) {
            _userTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
        }

    }
    return _userTableView;
}

- (UserViewModel *)userViewModel{
    
    if (!_userViewModel) {
        
        _userViewModel = [[UserViewModel alloc] init];
    }
    return _userViewModel;
    
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.userViewModel getRowCount:section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *indentifier = @"cell";
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        
        cell = [[UserTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    id model = [self.userViewModel getRowModelWithIndexPath:indexPath];
    BOOL isFirst = indexPath.row==0?YES:NO;
    BOOL isLast = indexPath.row==([self.userViewModel getRowCount:0] - 1)?YES:NO;
    [cell fillInDataWithModel:model first:isFirst last:isLast];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 50.0;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
