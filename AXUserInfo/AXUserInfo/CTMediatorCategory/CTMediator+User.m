//
//  CTMediator+User.m
//  AX
//
//  Created by anxindeli on 2017/10/13.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import "CTMediator+User.h"

@implementation CTMediator (User)
- (UIViewController *)userVc{
    
    return  [self performTarget:@"User" action:@"viewController" params:nil shouldCacheTarget:YES];
}
@end
