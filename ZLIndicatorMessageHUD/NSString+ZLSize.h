//
//  NSString+Size.h
//  ZLApp
//
//  Created by MacTsin on 16/4/9.
//  Copyright © 2016年 MacTsin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (ZLSize)

- (CGSize)zl_sizeWithMaxSize:(CGSize)maxSize font:(CGFloat )font;

+ (NSString *)zl_cachePath;


@end
