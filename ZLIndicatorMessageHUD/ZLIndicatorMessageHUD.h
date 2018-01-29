//
//  ZLIndicatorMessageHUD.h
//  ZLIndicatorMessageHUD
//
//  Created by hezhonglin on 16/9/26.
//  Copyright © 2016年 111. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLIndicatorMessageHUD : NSObject

+ (void)zl_showLoadingMessage;
+ (void)zl_showWithMessage:(NSString *)message;

+ (void)zl_showWithMessage:(NSString *)message timeDelay:(CGFloat)timeDelay;
+ (void)zl_hide;

@end
