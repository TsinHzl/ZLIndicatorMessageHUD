//
//  ZLIndicatorMessageHUD.h
//  ZLIndicatorMessageHUD
//
//  Created by hezhonglin on 16/9/26.
//  Copyright © 2016年 111. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLIndicatorMessageHUD : NSObject

+ (void)showLoadingMessage;
+ (void)hide;
+ (void)showWithMessage:(NSString *)message;

@end
