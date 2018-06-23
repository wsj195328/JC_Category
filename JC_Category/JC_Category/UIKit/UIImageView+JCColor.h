//
//  UIImageView+JCColor.h
//  JC_Category
//
//  Created by user on 2018/6/6.
//  Copyright © 2018 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (JCColor)

// MARK:从图片中取到某个点的颜色对象 (Get color at the point from UIImageView)
- (UIColor *)JC_GetColorAtPixel:(CGPoint)point;

// MARK:从颜色中获取RGB的数组 (Get RGB value array from UIColor)
+ (NSInteger *)JC_RGBWFromUIColor:(UIColor *)color;

// MARK:贝塞尔曲线切圆角 (clip RadiuCorner)
- (instancetype)JC_ClipCornerRadius:(CGFloat)value;

@end
