//
//  NSDictionary+JCLog.m
//  JC_Category
//
//  Created by user on 2018/6/15.
//  Copyright © 2018 user. All rights reserved.
//

#import "NSDictionary+JCLog.h"

@implementation NSDictionary (JCLog)

- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
    NSMutableString *mStr = [NSMutableString string];
    NSMutableString *tab = [NSMutableString stringWithString:@""];
    for (int i = 0; i < level; i++) {
        [tab appendString:@"\t"];
    }
    [mStr appendString:@"{\n"];
    NSArray *allKey = self.allKeys;
    for (int i = 0; i < allKey.count; i++) {
        id value = self[allKey[i]];
        NSString *lastSymbol = (allKey.count == i + 1) ? @"":@";";
        if ([value respondsToSelector:@selector(descriptionWithLocale:indent:)]) {
            [mStr appendFormat:@"\t%@%@ = %@%@\n",tab,allKey[i],[value descriptionWithLocale:locale indent:level + 1],lastSymbol];
        } else {
            [mStr appendFormat:@"\t%@%@ = %@%@\n",tab,allKey[i],value,lastSymbol];
        }
    }
    [mStr appendFormat:@"%@}",tab];
    return mStr;
}

@end
