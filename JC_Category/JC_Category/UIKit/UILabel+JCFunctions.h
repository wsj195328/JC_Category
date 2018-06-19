//
//  UILabel+JCFunctions.h
//  JC_Category
//
//  Created by  w2033 on 2018/6/18.
//  Copyright © 2018 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (JCFunctions)

// 快速创建
+ (instancetype)JC_Text:(NSString *)text
               textFont:(int)font
              textColor:(UIColor *)color
                  frame:(CGRect)frame;

//设置间距
+ (instancetype)JC_Label:(UILabel *)lbl ColumnSpace:(CGFloat)columnSpace;

//设置行距
+ (instancetype)JC_Label:(UILabel *)lbl SetRowSpace:(CGFloat)rowSpace;


@end
