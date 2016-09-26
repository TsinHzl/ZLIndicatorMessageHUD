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
static CGFloat const ZLTimeDelay = 1.5f;
static CGFloat const ZLFontSize = 15;
static CGFloat const ZLShowingLabelHeight = 35;

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
    showingView.zl_height = ZLShowingLabelHeight;
    showingView.backgroundColor = [UIColor blackColor];
    showingView.alpha = 0;
    showingView.textAlignment = NSTextAlignmentCenter;
    showingView.textColor = [UIColor whiteColor];
    showingView.font = [UIFont systemFontOfSize:ZLFontSize];
    
    [showingView setRoundViewWithCornerRaidus:ZLShowingLabelHeight/2];
    
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
    showingLabel_.text = @"Loading...";
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
    [UIView animateWithDuration:ZLTimeDelay animations:^{
        showingLabel_.alpha = 0.74;
    } completion:^(BOOL finished) {
        [self hide];
    }];
}

+ (void)setShowingLabelWidth {
    CGSize maxSzie = CGSizeMake(MAXFLOAT, showingLabel_.zl_height);
    showingLabel_.zl_width = [showingLabel_.text sizeWithMaxSize:maxSzie font:ZLFontSize].width + 30;
    showingLabel_.center = window_.rootViewController.view.center;
}
@end
