//
//  UIDevice+JCCustom.m
//  JC_Category
//
//  Created by user on 2018/6/8.
//  Copyright © 2018 user. All rights reserved.
//

#import "UIDevice+JCCustom.h"
#import "JCIgnoredTool.h"

@implementation UIDevice (JCCustom)

+ (float)JC_CurrentSystemVersion {

    return [self currentDevice].systemVersion.floatValue;
}

+ (void)JC_JumpSystemItemString:(NSString *)path
                         handle:(void (^)(BOOL))statusBlock {

    NSString * urlString = [NSString stringWithFormat:@"App-Prefs:root=%@",path];

    NSString * settingPath = UIApplicationOpenSettingsURLString;

    if (@available(iOS 10.0, *)) {


        NSDictionary *optionDict = @{UIApplicationOpenURLOptionUniversalLinksOnly:@NO};
        if (@available(iOS 11.0, *)) {

            // >= iOS 11.0
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:settingPath]
                                               options:optionDict
                                     completionHandler:statusBlock];
        }
        else {

            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlString]]) {

                // iOS 10.0 < verion < iOS 11.0
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]
                                                   options:optionDict
                                         completionHandler:statusBlock];
            }
        }
    } else {


        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlString]]) {
            // < iOS 10
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
        }
    }
}

@end
