//
//  ViewController.m
//  ZLIndicatorMessageExample
//
//  Created by hezhonglin on 16/9/26.
//  Copyright © 2016年 111. All rights reserved.
//

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
    [ZLIndicatorMessageHUD showLoadingMessage];
    [self performSelector:@selector(didReceiveMemoryWarning) withObject:self afterDelay:2];
}

- (void)test2 {
    [ZLIndicatorMessageHUD showWithMessage:@"测试信息测试信息测试信息测试信息"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [ZLIndicatorMessageHUD hide];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self test2];
}
@end
