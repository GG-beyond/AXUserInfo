//
//  UserInfoHeaderView.m
//  AnXin
//
//  Created by anxindeli on 15/9/18.
//  Copyright (c) 2015年 anxindeli. All rights reserved.
//

#import "UserInfoHeaderView.h"
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
    UILabel *todayEarning = [[UILabel alloc]initWithFrame:CGRectMake(20, 79, SCREEN_WIDTH - 40, 72)];
    todayEarning.font = [UIFont systemFontOfSize: 24];
    todayEarning.adjustsFontSizeToFitWidth = YES;
    todayEarning.textAlignment = NSTextAlignmentCenter;
    todayEarning.textColor = [UIColor whiteColor];
    self.todayEarning = todayEarning;
    todayEarning.text = @"0.00";
    [self addSubview:todayEarning];
    
    UILabel *todayTitle = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(todayEarning.frame)+10, SCREEN_WIDTH-40, 18)];
    todayTitle.font = [UIFont systemFontOfSize:15];
    todayTitle.textAlignment = NSTextAlignmentCenter;
    todayTitle.textColor = [UIColor whiteColor];
    todayTitle.text = @"今日收益";
    [self addSubview:todayTitle];
    
    //可用余额
    UILabel *availableMoney = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(todayTitle.frame)+30, SCREEN_WIDTH/2.0, 20)];
    availableMoney.font = [UIFont systemFontOfSize: 24];
    availableMoney.textAlignment = NSTextAlignmentCenter;
    availableMoney.textColor = [UIColor whiteColor];
    availableMoney.adjustsFontSizeToFitWidth = YES;
    availableMoney.text = @"0.00";
    self.availableMoney = availableMoney;
    [self addSubview:availableMoney];
    
    UILabel *availableMoneyTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(availableMoney.frame)+5, SCREEN_WIDTH/2.0, 20)];
    availableMoneyTitle.font = [UIFont systemFontOfSize:15];
    availableMoneyTitle.textAlignment = NSTextAlignmentCenter;
    availableMoneyTitle.textColor = [UIColor whiteColor];
    availableMoneyTitle.text = @"可用余额（元）";
    [self addSubview:availableMoneyTitle];
    //中间的竖线
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
