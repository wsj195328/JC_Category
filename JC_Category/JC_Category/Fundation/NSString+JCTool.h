//
//  NSString+JCTool.h
//  JC_Category
//
//  Created by user on 2018/6/15.
//  Copyright © 2018 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JCTool)

//时间转字符串 <date to NSString>
+ (NSString *)JC_StringFormatTime:(NSInteger)time;

//编码方式 <code>
+ (NSString *)JC_UnicodeWithData:(NSData *)data;

+ (NSString *)JC_GBKWithData:(NSData *)data;

@end
