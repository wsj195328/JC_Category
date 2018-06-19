//
//  UIImage+JCTool.h
//  JC_Category
//
//  Created by user on 2018/6/15.
//  Copyright © 2018 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JCTool)

//颜色转换 <color transform>
+ (UIImage *)JC_ImageFromUIColor:(UIColor *)color
                            Rect:(CGRect)rect;
+ (UIImage *)JC_ImageFromUIView:(UIView *)view;


//图片处理 <image handel>
+ (UIImage *)JC_ImageBy:(UIImage *)img
               ClipRect:(CGRect)rect;   //图片裁剪

- (UIImage *)JC_StretchImageY:(NSInteger)y_Value
                            X:(NSInteger)x_Value;


@end
