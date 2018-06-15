//
//  UIImage+JCTool.m
//  JC_Category
//
//  Created by user on 2018/6/15.
//  Copyright © 2018 user. All rights reserved.
//

#import "UIImage+JCTool.h"

@implementation UIImage (JCTool)

+ (UIImage *)JC_ImageFromUIColor:(UIColor *)color
                            Rect:(CGRect)rect {

    if (!color) {
        color = [UIColor clearColor];
    }
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;

}

+ (UIImage *)JC_ImageFromUIView:(UIView *)view {

    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, [[UIScreen mainScreen] scale]);
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:NO];
    UIImage *screenImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenImage;
}

+ (UIImage *)JC_ImageBy:(UIImage *)img
               ClipRect:(CGRect)rect {

    rect.origin.x *= [UIScreen mainScreen].scale; 
    rect.origin.y *= [UIScreen mainScreen].scale;
    rect.size.width *= [UIScreen mainScreen].scale;
    rect.size.height *= [UIScreen mainScreen].scale;
    if (rect.size.width <= 0 || rect.size.height <= 0) return nil;
    CGImageRef imageRef = CGImageCreateWithImageInRect(img.CGImage, rect);
    UIImage *image = [UIImage imageWithCGImage:imageRef scale:[UIScreen mainScreen].scale orientation:img.imageOrientation];
    CGImageRelease(imageRef);

    return image;
}


- (UIImage *)JC_StretchImageY:(NSInteger)y_Value
                            X:(NSInteger)x_Value {

    return [self stretchableImageWithLeftCapWidth:y_Value
                                     topCapHeight:x_Value];
}

@end
