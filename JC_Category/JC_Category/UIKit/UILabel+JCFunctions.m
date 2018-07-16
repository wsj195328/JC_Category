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
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = color;
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

//设置富文本
+ (instancetype)JC_SetAttribute:(NSDictionary <NSAttributedStringKey,id> *)dict
                          Label:(UILabel *)lbl
                          Range:(NSRange)range; {
    //创建富文本
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:lbl.text];
    //设置样式
    [attri addAttributes:dict range:range];
    //重新赋值
    lbl.attributedText = attri;
    return lbl;
}

/** 在视图中添加可变标签  add tags */
+ (void)JC_AddDynamicTagIntoView:(UIView *)view
                        lblArray:(NSArray <UILabel *>*)arr
                         horizon:(CGFloat)horPadding
                        vertical:(CGFloat)verPadding {
    
    if (arr == nil || arr.count == 0) {
        return;
    }
    //视图大小
    CGSize viewSize = view.frame.size;
    //label的Y
    UILabel *first = arr.firstObject;
    __block CGSize lblSize = [first.text sizeWithAttributes:@{NSFontAttributeName:first.font}];
    __block CGFloat Y = viewSize.height - lblSize.height - horPadding;
    
    [arr enumerateObjectsUsingBlock:^(UILabel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        UILabel *lbl = [[UILabel alloc] init];
        lbl = obj;

        static CGFloat X,allW = 0;
        CGFloat H,W = 0;
        {
            W = lblSize.width + horPadding*2;
            H = lblSize.height + verPadding*2;
        }
        
        X = (idx+1)*15 + allW;
        allW += W;

        lbl.frame = CGRectMake(X, Y, W, H);
        [view addSubview:lbl];
    }];
}


@end
