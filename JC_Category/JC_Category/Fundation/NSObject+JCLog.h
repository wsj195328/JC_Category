//
//  NSObject+JCLog.h
//  JC_Category
//
//  Created by user on 2018/6/15.
//  Copyright © 2018 user. All rights reserved.
//

#import <Foundation/Foundation.h>

#define JCLog(format,...)  [NSObject JC_CustomFunctionName:__PRETTY_FUNCTION__ \
LineNumber:__LINE__  \
AndInput:(format), ##__VA_ARGS__]

@interface NSObject (JCLog)

+ (void)JC_CustomFunctionName:(const char*)funcStr
                   LineNumber:(int)line
                     AndInput:(NSString *)message, ...;

@end
