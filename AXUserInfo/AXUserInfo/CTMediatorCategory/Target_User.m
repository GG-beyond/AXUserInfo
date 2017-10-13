//
//  Target_User.m
//  AX
//
//  Created by anxindeli on 2017/10/13.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import "Target_User.h"
#import <AXUserViewController.h>

@implementation Target_User
- (UIViewController *)Action_viewController:(NSDictionary *)params{
    
    AXUserViewController *vc = [[AXUserViewController alloc] init];
    return vc;
}
@end
