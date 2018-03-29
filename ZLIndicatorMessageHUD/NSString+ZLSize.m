//
//  NSString+Size.m
//  ZLApp
//
//  Created by MacTsin on 16/4/9.
//  Copyright © 2016年 MacTsin. All rights reserved.
//

#import "NSString+ZLSize.h"

@implementation NSString (ZLSize)

- (CGSize)zl_sizeWithMaxSize:(CGSize)maxSize font:(CGFloat )font
{
    NSMutableDictionary *attrsDic = [NSMutableDictionary dictionary];
    attrsDic[NSFontAttributeName] = [UIFont systemFontOfSize:font];
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrsDic context:nil].size;
}

+ (NSString *)zl_cachePath
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    path = [path stringByAppendingPathComponent:@"ca.plist"];
    return path;
}
@end
