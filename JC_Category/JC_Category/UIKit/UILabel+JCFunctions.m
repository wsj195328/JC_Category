//
//  UILabel+JCFunctions.m
//  JC_Category
//
//  Created by  w2033 on 2018/6/18.
//  Copyright © 2018 user. All rights reserved.
//

#import "UILabel+JCFunctions.h"
#import <CoreText/CoreText.h>

@implementation UILabel (JCFunctions)

+ (instancetype)JC_Text:(NSString *)text textFont:(int)font textColor:(UIColor *)color frame:(CGRect)frame {
    
    UILabel *label = [UILabel new];
    label.text = text;
    label.font = [UIFont systemFontOfSize:font];
    label.textColor = color;
    label.textAlignment=YES;
    label.frame=frame;
    return label;
}

+ (instancetype)JC_Label:(UILabel *)lbl ColumnSpace:(CGFloat)columnSpace {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:lbl.attributedText];
    //调整间距
    [attributedString addAttribute:(__bridge NSString *)kCTKernAttributeName value:@(columnSpace) range:NSMakeRange(0, [attributedString length])];
    lbl.attributedText = attributedString;
    return lbl;
}

+ (instancetype)JC_Label:(UILabel *)lbl SetRowSpace:(CGFloat)rowSpace {
    
    lbl.numberOfLines = 0;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:lbl.attributedText];
    //调整行距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = rowSpace;
    paragraphStyle.baseWritingDirection = NSWritingDirectionLeftToRight;
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [lbl.text length])];
    lbl.attributedText = attributedString;
    return lbl;
}

@end
