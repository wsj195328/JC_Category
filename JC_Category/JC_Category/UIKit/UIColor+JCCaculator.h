//
//  UIColor+JCCaculator.h
//  JC_Category
//
//  Created by user on 2018/6/6.
//  Copyright © 2018 user. All rights reserved.
//

#import <UIKit/UIKit.h>

#define COLORHEX(str) [UIColor JC_ColorFromHexCode:str]

@interface UIColor (JCCaculator)

// MARK:十六进制转 UIColor (HEX to UIColor)
+ (UIColor *)JC_ColorFromHexCode:(NSString *)hexString;

@end
