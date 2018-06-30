//
//  UIImageView+JCColor.m
//  JC_Category
//
//  Created by user on 2018/6/6.
//  Copyright © 2018 user. All rights reserved.
//

#import "UIImageView+JCColor.h"
//#import "JCIgnoredTool.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wreturn-stack-address"

@implementation UIImageView (JCColor)

- (UIColor *)JC_GetColorAtPixel:(CGPoint)point {

    // 定义image的Frame方便后面调用
    const CGRect imageFrame = CGRectMake(0.0f, 0.0f,
                                         self.frame.size.width, self.frame.size.height);

    // Cancel if point is outside image coordinates
    // 如果给定的点超出了image的坐标范围, 就返回nil
    if (!CGRectContainsPoint(imageFrame, point)) {
        return nil;
    }

    // Create RGB color space
    // 创建RGB颜色空间
    const CGColorSpaceRef colorSpaceRGB  = CGColorSpaceCreateDeviceRGB();
    unsigned char pixelData[4] = { 0, 0, 0, 0 };
    CGContextRef context = CGBitmapContextCreate(pixelData,1,1,8,4,colorSpaceRGB,kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpaceRGB);
    CGContextSetBlendMode(context, kCGBlendModeCopy);

    // Draw the pixel we are interested in onto the bitmap context
    // 画像素的位图上下文
    CGContextTranslateCTM(context, -point.x, point.y- self.frame.size.height);
    CGContextDrawImage(context, imageFrame, self.image.CGImage);
    CGContextRelease(context);

    // Convert color values [0..255] to floats [0.0..1.0]
    // 将0~255的char类型数据装换成0~1的float类型数据
    const CGFloat red   = (CGFloat)pixelData[0] / 255.0f;
    const CGFloat green = (CGFloat)pixelData[1] / 255.0f;
    const CGFloat blue  = (CGFloat)pixelData[2] / 255.0f;

    //    NSLog(@"点色🍎- red:%f green:%f blue:%f",red,green,blue);

    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}

+ (NSInteger *)JC_RGBWFromUIColor:(UIColor *)color {

    NSInteger components[3] = {};
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char resultingPixel[4];
    CGContextRef context = CGBitmapContextCreate(&resultingPixel,
                                                 1,
                                                 1,
                                                 8,
                                                 4,
                                                 rgbColorSpace,
                                                 kCGImageAlphaNoneSkipLast);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    CGContextRelease(context);
    CGColorSpaceRelease(rgbColorSpace);

    for (int component = 0; component < 3; component++) {
        components[component] = resultingPixel[component];
    }
    return components;
}

#pragma clang diagnostic pop

@end
