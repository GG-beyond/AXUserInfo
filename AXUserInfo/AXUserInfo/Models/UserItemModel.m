//
//  UserItemModel.m
//  AXUserInfo
//
//  Created by anxindeli on 2017/9/4.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import "UserItemModel.h"

@implementation UserItemModel
- (instancetype)initWithDict:(NSDictionary *)data{
    
    if (self = [super init]) {
        
        _title = data[@"title"];
        _imageName = data[@"image"];
    }
    return self;
}
@end
