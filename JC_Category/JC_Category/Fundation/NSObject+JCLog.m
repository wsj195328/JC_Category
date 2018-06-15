//
//  NSObject+JCLog.m
//  JC_Category
//
//  Created by user on 2018/6/15.
//  Copyright © 2018 user. All rights reserved.
//

#import "NSObject+JCLog.h"

@implementation NSObject (JCLog)

+ (void)JC_CustomFunctionName:(const char*)funcStr
                   LineNumber:(int)line
                     AndInput:(NSString *)message, ... {

    va_list argList;
    va_start(argList, message);
    NSString *messageStr = [[NSString alloc] initWithFormat:message arguments:argList];
    va_end(argList);

#ifdef DEBUG

    NSString *functionName = [NSString stringWithCString:funcStr encoding:NSUTF8StringEncoding];
    NSDictionary *dict = @{@"functionName":functionName,
                           @"line":@(line),
                           @"message":messageStr};
    NSLog(@"debug -- %@",dict);

#else

    NSLog(@"%@",messageStr);

#endif


}

@end
