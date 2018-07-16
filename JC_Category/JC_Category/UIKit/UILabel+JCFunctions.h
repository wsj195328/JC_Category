//
//  UILabel+JCFunctions.h
//  JC_Category
//
//  Created by  w2033 on 2018/6/18.
//  Copyright © 2018 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (JCFunctions)

/** 快速创建  fast */
+ (instancetype)JC_Text:(NSString *)text
               textFont:(int)font
              textColor:(UIColor *)color
                  frame:(CGRect)frame;

/** 设置间距  column */
+ (instancetype)JC_Label:(UILabel *)lbl ColumnSpace:(CGFloat)columnSpace;

/** 设置行距  row */
+ (instancetype)JC_Label:(UILabel *)lbl SetRowSpace:(CGFloat)rowSpace;

/** 设置富文本  attri */
+ (instancetype)JC_SetAttribute:(NSDictionary <NSAttributedStringKey,id> *)dict
                          Label:(UILabel *)lbl
                          Range:(NSRange)range;

/** 在视图中添加可变标签  add tags */
+ (void)JC_AddDynamicTagIntoView:(UIView *)view
                        lblArray:(NSArray <UILabel *>*)arr
                         horizon:(CGFloat)horPadding
                        vertical:(CGFloat)verPadding;


@end
