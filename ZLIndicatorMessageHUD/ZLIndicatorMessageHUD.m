//
//  ZLIndicatorMessageHUD.m
//  ZLIndicatorMessageHUD
//
//  Created by hezhonglin on 16/9/26.
//  Copyright © 2016年 111. All rights reserved.
//

#import "ZLIndicatorMessageHUD.h"
#import "UIView+ZLExtension.h"
#import "NSString+ZLSize.h"

static UIWindow *window_;
static UILabel *showingLabel_;

#define ZLIScreenBouds [UIScreen mainScreen].bounds
#define ZLIScreenWidth [UIScreen mainScreen].bounds.size.width
#define ZLIScreenHeight [UIScreen mainScreen].bounds.size.height

static CGFloat const ZLITimeInterval = 0.75f;
static CGFloat const ZLITimeDelay = 1.5f;
static CGFloat const ZLIFontSize = 15.0f;
static CGFloat const ZLIShowingLabelHeight = 45.0f;
static CGFloat const ZLShowingViewAlpha = 0.75f;


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
    
    [showingView zl_setRoundViewWithCornerRaidus:ZLIShowingLabelHeight/2];
    
    UIViewController *rootVC = [[UIViewController alloc] init];
    window_.rootViewController = rootVC;
    [rootVC.view addSubview:showingView];
    
    showingLabel_ = showingView;
    
    [UIView animateWithDuration:ZLITimeInterval animations:^{
        showingView.alpha = ZLShowingViewAlpha;
    } completion:^(BOOL finished) {
        
    }];
    
}

+ (void)zl_showLoadingMessage {
    [self showWindow];
    showingLabel_.text = @"正在加载，请稍等...";
    [self setShowingLabelWidth];
}

+ (void)zl_hide {
    [UIView animateWithDuration:ZLITimeInterval animations:^{
        showingLabel_.alpha = 0;
    } completion:^(BOOL finished) {
        window_.hidden = YES;
        window_ = nil;
        showingLabel_ = nil;
    }];
}

+ (void)zl_showWithMessage:(NSString *)message {
    [self zl_showWithMessage:message timeDelay:0];
}

+ (void)setShowingLabelWidth {
    CGSize maxSzie = CGSizeMake(MAXFLOAT, showingLabel_.zl_height);
    CGFloat width = [showingLabel_.text zl_sizeWithMaxSize:maxSzie font:ZLIFontSize].width + 30;
    if (width >= ZLIScreenWidth) {
        NSLog(@"显示信息太长，请精简一下！");
        showingLabel_.text = @"显示信息太长，请精简一下！";
        width = [showingLabel_.text zl_sizeWithMaxSize:maxSzie font:ZLIFontSize].width + 30;
    }
    showingLabel_.zl_width = width;
    showingLabel_.center = window_.rootViewController.view.center;
}

+ (void)zl_showWithMessage:(NSString *)message timeDelay:(CGFloat)timeDelay {
    [self showWindow];
    
    showingLabel_.text = message;
    [self setShowingLabelWidth];
    [UIView animateWithDuration:ZLITimeInterval animations:^{
        showingLabel_.alpha = ZLShowingViewAlpha;
    } completion:^(BOOL finished) {
        [self performSelector:@selector(zl_hide) withObject:nil afterDelay:timeDelay > 0 ? timeDelay : ZLITimeDelay];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((timeDelay > 0 ? timeDelay : ZLITimeDelay) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self zl_hide];
//        });
        
    }];
}

@end
