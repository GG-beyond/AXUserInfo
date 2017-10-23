//
//  CTMediator+Recharge.m
//  AXRecharge
//
//  Created by anxindeli on 2017/10/16.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import "CTMediator+Recharge.h"

@implementation CTMediator (Recharge)
- (UIViewController *)rechargeVc{
    
    return [self performTarget:@"Recharge" action:@"viewController" params:nil shouldCacheTarget:YES];
}
@end
