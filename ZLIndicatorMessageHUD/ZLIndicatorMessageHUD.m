//
//  ZLIndicatorMessageHUD.m
//  ZLIndicatorMessageHUD
//
//  Created by hezhonglin on 16/9/26.
//  Copyright © 2016年 111. All rights reserved.
//

#import "ZLIndicatorMessageHUD.h"
#import "UIView+ZLExtension.h"
#import "NSString+Size.h"

static UIWindow *window_;
static UILabel *showingLabel_;

#define ZLIScreenBouds [UIScreen mainScreen].bounds
#define ZLIScreenWidth [UIScreen mainScreen].bounds.size.width
#define ZLIScreenHeight [UIScreen mainScreen].bounds.size.height

static CGFloat const ZLITimeInterval = 0.75f;
static CGFloat const ZLITimeDelay = 1.0f;
static CGFloat const ZLIFontSize = 15;
static CGFloat const ZLIShowingLabelHeight = 45.0f;

@interface ZLIndicatorMessageHUD()

@end

@implementation ZLIndicatorMessageHUD


+ (void)showWindow {
    window_.hidden = YES;
    window_ = [[UIWindow alloc] initWithFrame:ZLIScreenBouds];
    window_.windowLevel = UIWindowLevelNormal;
    window_.backgroundColor = [UIColor clearColor];
    window_.hidden = NO;
    
    UILabel *showingView = [[UILabel alloc] init];
    showingView.zl_height = ZLIShowingLabelHeight;
    showingView.backgroundColor = [UIColor blackColor];
    showingView.alpha = 0;
    showingView.textAlignment = NSTextAlignmentCenter;
    showingView.textColor = [UIColor whiteColor];
    showingView.font = [UIFont systemFontOfSize:ZLIFontSize];
    
    [showingView setRoundViewWithCornerRaidus:ZLIShowingLabelHeight/2];
    
    UIViewController *rootVC = [[UIViewController alloc] init];
    window_.rootViewController = rootVC;
    [rootVC.view addSubview:showingView];
    
    showingLabel_ = showingView;
    
    [UIView animateWithDuration:ZLITimeInterval animations:^{
        showingView.alpha = 0.75;
    } completion:^(BOOL finished) {
        
    }];
    
}

+ (void)showLoadingMessage {
    [self showWindow];
    showingLabel_.text = @"正在加载，请稍等...";
    [self setShowingLabelWidth];
}

+ (void)hide {
    [UIView animateWithDuration:ZLITimeInterval animations:^{
        showingLabel_.alpha = 0;
    } completion:^(BOOL finished) {
        window_.hidden = YES;
        window_ = nil;
        showingLabel_ = nil;
    }];
}

+ (void)showWithMessage:(NSString *)message {
    [self showWindow];
    showingLabel_.text = message;
    [self setShowingLabelWidth];
    [UIView animateWithDuration:ZLITimeDelay animations:^{
        showingLabel_.alpha = 0.74;
    } completion:^(BOOL finished) {
        [self hide];
    }];
}

+ (void)setShowingLabelWidth {
    CGSize maxSzie = CGSizeMake(MAXFLOAT, showingLabel_.zl_height);
    CGFloat width = [showingLabel_.text sizeWithMaxSize:maxSzie font:ZLIFontSize].width + 30;
    if (width >= ZLIScreenWidth) {
        NSLog(@"显示信息太长，请精简一下！");
        showingLabel_.text = @"显示信息太长，请精简一下！";
        width = [showingLabel_.text sizeWithMaxSize:maxSzie font:ZLIFontSize].width + 30;
    }
    showingLabel_.zl_width = width;
    showingLabel_.center = window_.rootViewController.view.center;
}


@end
