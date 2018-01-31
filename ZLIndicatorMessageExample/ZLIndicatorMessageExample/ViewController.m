//
//  ViewController.m
//  ZLIndicatorMessageExample
//
//  Created by hezhonglin on 16/9/26.
//  Copyright © 2016年 111. All rights reserved.
//  贺中林

#import "ViewController.h"
#import "ZLIndicatorMessageHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor cyanColor];
    [self test1];
    
}

- (void)test1 {
    self.view.backgroundColor = [UIColor cyanColor];
    [ZLIndicatorMessageHUD zl_showLoadingMessage];
    [self performSelector:@selector(hide) withObject:self afterDelay:2];
}
- (void)test2 {
    [ZLIndicatorMessageHUD zl_showWithMessage:@"测试信息测试信息" timeDelay:0.5];
}

- (void)test3 {
    [ZLIndicatorMessageHUD zl_showWithMessage:@"测试信息测试信息测试信息测试信息测试信息测试信息测试信息测试信息测试信息测试信息测试信息测试信息"];
}
- (void)hide {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [ZLIndicatorMessageHUD zl_hide];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self test2];
}
@end
