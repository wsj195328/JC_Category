//
//  NSString+JCTool.m
//  JC_Category
//
//  Created by user on 2018/6/15.
//  Copyright © 2018 user. All rights reserved.
//

#import "NSString+JCTool.h"

@implementation NSString (JCTool)

+ (NSString *)JC_StringFormatTime:(NSInteger)time {

    return [NSString stringWithFormat:@"%02zd:%02zd",time/60,time%60];
}

+ (NSString *)JC_UnicodeWithData:(NSData *)data {

    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    return [[NSString alloc] initWithData:data encoding:gbkEncoding];
}

+ (NSString *)JC_GBKWithData:(NSData *)data {

    return [[NSString alloc] initWithData:data encoding:NSUTF16LittleEndianStringEncoding];
}

@end
