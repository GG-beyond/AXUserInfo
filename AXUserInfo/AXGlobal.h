//
//  AXGlobal.h
//  AXUserInfo
//
//  Created by anxindeli on 2017/9/15.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#ifndef AXGlobal_h
#define AXGlobal_h

//当前设备的屏幕宽度
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

//当前设备的屏幕高度
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]
#define FORMAT(format, ...) [NSString stringWithFormat:(format), ##__VA_ARGS__]

#endif /* AXGlobal_h */
