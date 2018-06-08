//
//  NSString+JCCustom.m
//  JC_Category
//
//  Created by user on 2018/6/7.
//  Copyright © 2018 user. All rights reserved.
//

#import "NSString+JCCustom.h"

@implementation NSString (JCCustom)


+ (BOOL)CheckCodesignWithAppStoreID:(nullable NSString *)str1
                       EnterpriseID:(nullable NSString *)str2 {

    //空值判断
    if (str1 == nil && str2 == nil) {

        return NO;
    }

    // 描述文件路径
    NSString *embeddedPath = [[NSBundle mainBundle] pathForResource:@"embedded" ofType:@"mobileprovision"];

    //记录BOOL
    BOOL isChecked = NO;

    if ([[NSFileManager defaultManager] fileExistsAtPath:embeddedPath]) {

        // 读取application-identifier
        NSString *embeddedProvisioning = [NSString stringWithContentsOfFile:embeddedPath encoding:NSASCIIStringEncoding error:nil];
        NSArray *embeddedProvisioningLines = [embeddedProvisioning componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];

        for (int i = 0; i < [embeddedProvisioningLines count]; i++) {
            if ([[embeddedProvisioningLines objectAtIndex:i] rangeOfString:@"application-identifier"].location != NSNotFound) {

                NSInteger fromPosition = [[embeddedProvisioningLines objectAtIndex:i+1] rangeOfString:@"<string>"].location+8;

                NSInteger toPosition = [[embeddedProvisioningLines objectAtIndex:i+1] rangeOfString:@"</string>"].location;

                NSRange range;
                range.location = fromPosition;
                range.length = toPosition - fromPosition;

                NSString *fullIdentifier = [[embeddedProvisioningLines objectAtIndex:i+1] substringWithRange:range];
                NSArray *identifierComponents = [fullIdentifier componentsSeparatedByString:@"."];
                NSString *appIdentifier = [identifierComponents firstObject];

                // 对比签名ID
                if ([appIdentifier isEqualToString:str1]) {

                    isChecked = YES;
                }
                else if ([appIdentifier isEqualToString:str2]) {

                    isChecked = YES;
                }
                else {
                    isChecked = NO;
                }
                break;
            }
        }
    }
    return isChecked;
    
}

@end
