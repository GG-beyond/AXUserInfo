//
//  UserInfoHeaderView.m
//  AnXin
//
//  Created by anxindeli on 15/9/18.
//  Copyright (c) 2015年 anxindeli. All rights reserved.
//

#import "UserInfoHeaderView.h"
#import <Masonry.h>
@interface UserInfoHeaderView ()
@property (nonatomic ,strong) CAGradientLayer *gradientLayer;
@property (nonatomic ,strong) NSArray *enumTitleArray;
@property (nonatomic ,strong) NSArray *enumImageArray;

@property (nonatomic ,strong) UILabel *todayEarning;
@property (nonatomic ,strong) UILabel *availableMoney;
@property (nonatomic ,strong) UILabel *earnedMoney;
@end
@implementation UserInfoHeaderView
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 280)];
        [self addSubview:bgView];
        
        self.gradientLayer=[CAGradientLayer layer];
        self.gradientLayer.frame=bgView.frame;
        self.gradientLayer.startPoint=CGPointMake(0.0, 0.0);
        self.gradientLayer.endPoint  =CGPointMake(0.0, 1.0);
        NSMutableArray *colors = [NSMutableArray array];
        [colors addObject:(__bridge id)[RGBCOLOR(65, 146, 227) CGColor]];
        [colors addObject:(__bridge id)[RGBCOLOR(51, 128, 204) CGColor]];
        [self.gradientLayer setColors:[NSArray arrayWithArray:colors]];
        //颜色分割点，渐变色起始或者结束点
        //        self.gradientLayer.locations=@[@(0.25),@(0.5),@(0.75)];
        [bgView.layer addSublayer:self.gradientLayer];

        [self creatSubViews];
    }
    return self;
}
//创建子视图
- (void)creatSubViews{
    
    //今日收益
    UILabel *todayEarning = [[UILabel alloc]initWithFrame:CGRectZero];
    todayEarning.font = [UIFont systemFontOfSize: 24];
    todayEarning.adjustsFontSizeToFitWidth = YES;
    todayEarning.textAlignment = NSTextAlignmentCenter;
    todayEarning.textColor = [UIColor whiteColor];
    self.todayEarning = todayEarning;
    todayEarning.text = @"0.00";
    [self addSubview:todayEarning];
    [todayEarning makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(79);
        make.left.equalTo(20);
        make.width.equalTo(SCREEN_WIDTH - 40);
        make.height.equalTo(72);
    }];
    
    UILabel *todayTitle = [[UILabel alloc]initWithFrame:CGRectZero];
    todayTitle.font = [UIFont systemFontOfSize:15];
    todayTitle.textAlignment = NSTextAlignmentCenter;
    todayTitle.textColor = [UIColor whiteColor];
    todayTitle.text = @"今日收益";
    [self addSubview:todayTitle];
    [todayTitle makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(todayEarning.bottom).offset(10);
        make.height.equalTo(18);
        make.width.equalTo(200);
        make.centerX.equalTo(self.centerX);
    }];
    
    //可用余额
    UILabel *availableMoney = [[UILabel alloc]initWithFrame:CGRectZero];
    availableMoney.font = [UIFont systemFontOfSize: 24];
    availableMoney.textAlignment = NSTextAlignmentCenter;
    availableMoney.textColor = [UIColor whiteColor];
    availableMoney.adjustsFontSizeToFitWidth = YES;
    availableMoney.text = @"0.00";
    self.availableMoney = availableMoney;
    [self addSubview:availableMoney];
    [availableMoney makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(todayTitle.bottom).offset(30);
        make.height.equalTo(20);
        make.left.equalTo(0);
        make.width.equalTo(SCREEN_WIDTH/2);
    }];
    
    UILabel *availableMoneyTitle = [[UILabel alloc]initWithFrame:CGRectZero];
    availableMoneyTitle.font = [UIFont systemFontOfSize:15];
    availableMoneyTitle.textAlignment = NSTextAlignmentCenter;
    availableMoneyTitle.textColor = [UIColor whiteColor];
    availableMoneyTitle.text = @"可用余额（元）";
    [self addSubview:availableMoneyTitle];
    [availableMoneyTitle makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(availableMoney.bottom).offset(5);
        make.height.equalTo(20);
        make.left.equalTo(0);
        make.width.equalTo(SCREEN_WIDTH/2);
    }];
    //中间的竖线
    UIView *centerView = [[UIView alloc]initWithFrame:CGRectZero];
    centerView.backgroundColor = RGBCOLOR(65, 146, 227);
    [self addSubview:centerView];
    [centerView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(todayTitle.bottom).offset(35);
        make.left.equalTo(self.centerX);
        make.height.equalTo(35);
        make.width.equalTo(1);
    }];
    //右边的已到账收益
    UILabel *earnedMoney = [[UILabel alloc]initWithFrame:CGRectZero];
    earnedMoney.font = [UIFont systemFontOfSize:24];
    earnedMoney.textAlignment = NSTextAlignmentCenter;
    earnedMoney.textColor = [UIColor whiteColor];
    earnedMoney.adjustsFontSizeToFitWidth = YES;
    self.earnedMoney = earnedMoney;
    earnedMoney.text = @"0.00";
    [self addSubview:earnedMoney];
    [earnedMoney makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(todayTitle.bottom).offset(30);
        make.height.equalTo(20);
        make.left.equalTo(self.centerX);
        make.right.equalTo(0);
    }];
    
    UILabel *earnedMoneyTitle = [[UILabel alloc]initWithFrame:CGRectZero];
    earnedMoneyTitle.font = [UIFont systemFontOfSize:15];
    earnedMoneyTitle.textAlignment = NSTextAlignmentCenter;
    earnedMoneyTitle.textColor = [UIColor whiteColor];
    earnedMoneyTitle.text = @"已到账收益（元）";
    [self addSubview:earnedMoneyTitle];
    [earnedMoneyTitle makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(availableMoney.bottom).offset(5);
        make.height.equalTo(20);
        make.left.equalTo(centerView.right).offset(0);
        make.right.equalTo(0);
    }];

    
    self.enumImageArray = @[@"user_charge.png",@"user_withdraw.png",@"user_ property.png",@"user_coupons.png"];
    self.enumTitleArray = @[@"充值",@"提现",@"资产",@"优惠券"];
    for (int i = 0; i < self.enumTitleArray.count ; i++) {
        UIView *enumView = [[UIView alloc]initWithFrame:CGRectZero];
        enumView.backgroundColor = [UIColor whiteColor];
        [self addSubview:enumView];
        [enumView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(280);
            make.left.equalTo(i*SCREEN_WIDTH/4);
            make.width.equalTo(SCREEN_WIDTH/4);
            make.height.equalTo(95);
        }];
        
        UIButton *enumSender = [UIButton buttonWithType:UIButtonTypeCustom];
        [enumView addSubview:enumSender];
        enumSender.tag = i;
        [enumSender addTarget:self action:@selector(doSelectEnum:) forControlEvents:UIControlEventTouchUpInside];
                
        UIImageView *enumImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        enumImageView.image = [UIImage imageNamed:self.enumImageArray[i]];
        [enumView addSubview:enumImageView];
        [enumImageView makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(30);
            make.height.equalTo(30);
            make.top.equalTo(20);
            make.centerX.equalTo(enumView.centerX);
        }];
        
        
        enumSender.titleLabel.font = [UIFont systemFontOfSize:15];
        [enumSender setTitleEdgeInsets:UIEdgeInsetsMake(40, 0, 0, 0)];
        [enumSender setTitle:self.enumTitleArray [i] forState:UIControlStateNormal];
        [enumSender setTitleColor:RGBCOLOR(38, 42, 59) forState:UIControlStateNormal];
        [enumSender makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(enumView);
        }];
        
        UIView *rightLine = [[UIView alloc] initWithFrame:CGRectZero];
        rightLine.backgroundColor = RGBCOLOR(207, 220, 230);
        [enumView addSubview:rightLine];
        if (i == 3) {
            rightLine.hidden = YES;
        }
        [rightLine makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(1);
            make.height.equalTo(95);
            make.right.equalTo(enumView.right).offset(0);
            make.top.equalTo(0);
        }];
        
        UIView *bottomLine = [[UIView alloc]initWithFrame:CGRectZero];
        bottomLine.backgroundColor = RGBCOLOR(207, 220, 230);
        [enumView addSubview:bottomLine];
        [bottomLine makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(SCREEN_WIDTH/4);
            make.height.equalTo(1);
            make.bottom.equalTo(enumView.bottom);
            make.left.equalTo(0);
        }];
    }
}
//button实现的方法
- (void)doSelectEnum:(UIButton *)sender{
    if (self.clickMenuBlock) {
        self.clickMenuBlock(sender.tag);
    }
}
//填充信息
- (void)fillInUserInfo:(NSDictionary *)dict{
    if (dict) {
        self.todayEarning.text   = FORMAT(@"%@",dict[@"todayEarn"]);
        self.availableMoney.text = FORMAT(@"%@",dict[@"availableAmount"]);
        self.earnedMoney.text    = FORMAT(@"%@",dict[@"totalIncome"]);
    }else{
        self.todayEarning.text   = @"0.00";
        self.availableMoney.text = @"0.00";
        self.earnedMoney.text    = @"0.00";

    }
    
}
@end
