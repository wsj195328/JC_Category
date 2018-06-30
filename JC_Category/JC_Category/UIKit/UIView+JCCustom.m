//
//  UIView+JCCustom.m
//  JC_Category
//
//  Created by user on 2018/6/6.
//  Copyright © 2018 user. All rights reserved.
//

#import "UIView+JCCustom.h"
#import <objc/runtime.h>

@interface UIView  ()

@property (nonatomic, strong) UIView *roundLayer;

@end

@implementation UIView (JCCustom)

- (void)JC_MakeShadowWithOffset:(CGSize)offset
                         radius:(CGFloat)radius
                          color:(UIColor *)color
                        opacity:(CGFloat)opacity {

    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = opacity;
    self.clipsToBounds = NO;
}

- (instancetype)JC_AddShadowOffset:(CGSize)offset shadowRadius:(CGFloat)shadowRadius color:(UIColor *)color opacity:(CGFloat)opacity cornerRadius:(CGFloat)cornerRadius {
    
    
    
    if (self.superview == nil) {
        return self;
    }
    //masksToBounds 会切掉影响，所以搞一个layer放在底层
    //MARK: 自身圆角
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:cornerRadius];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    self.layer.mask = layer;
    
    //MARK: 阴影layer
    CAShapeLayer *shadowLayer = [CAShapeLayer layer];
    //路径
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGRect bound = CGRectInset(self.frame, 1, 1); //缩进1,避免重叠

    CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bound), CGRectGetMidY(bound));
    CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bound), CGRectGetMinY(bound), CGRectGetMidX(bound), CGRectGetMinY(bound), cornerRadius);
    CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bound), CGRectGetMinY(bound), CGRectGetMaxX(bound), CGRectGetMidY(bound), cornerRadius);
    CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bound), CGRectGetMaxY(bound), CGRectGetMidX(bound), CGRectGetMaxY(bound), cornerRadius);
    CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bound), CGRectGetMaxY(bound), CGRectGetMinX(bound), CGRectGetMidY(bound), cornerRadius);
    CGPathAddLineToPoint(pathRef, nil, CGRectGetMinX(bound), CGRectGetMidY(bound));

    shadowLayer.path = pathRef;
    CFRelease(pathRef);
    
    //阴影
    shadowLayer.shadowColor = color.CGColor;
    shadowLayer.shadowOffset = offset;
    shadowLayer.shadowRadius = shadowRadius;
    shadowLayer.shadowOpacity = opacity;
    shadowLayer.shouldRasterize = YES;
    shadowLayer.rasterizationScale = [UIScreen mainScreen].scale;
    self.clipsToBounds = NO;
    CALayer *lay = objc_getAssociatedObject(self, @"roundLayer");
    //避免重复添加图层
    if (lay == nil) {
        
        [self.superview.layer insertSublayer:shadowLayer below:self.layer];
        objc_setAssociatedObject(self, @"roundLayer", shadowLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return self;
}


- (instancetype)JC_ClipCornerRadius:(CGFloat)value {
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                    cornerRadius:value];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    self.layer.mask = layer;
    return self;
}



+ (void)JC_ShowMessage:(NSString *)message {

    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView *showview =  [[UIView alloc]init];
    showview.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.7];
    showview.frame = CGRectMake(1, 1, 1, 1);
    showview.alpha = 1.0f;
    showview.layer.cornerRadius = 5.0f;
    showview.layer.masksToBounds = YES;
    [window addSubview:showview];

    UILabel *label = [[UILabel alloc]init];
    CGSize LabelSize = [message boundingRectWithSize:CGSizeMake(290, 900) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil].size;

    label.frame = CGRectMake(10, 5, LabelSize.width, LabelSize.height);
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:15];
    [showview addSubview:label];
    showview.frame = CGRectMake((SCREEN_WIDTH - LabelSize.width - 20)/2, SCREEN_HEIGHT*0.765, LabelSize.width+20, LabelSize.height+10);
    [UIView animateWithDuration:2 animations:^{

        showview.alpha = 0;
    } completion:^(BOOL finished) {

        [showview removeFromSuperview];
    }];
}


#pragma mark - 坐标计算相关(position relative) ⤵️
#pragma mark -

- (CGFloat)left {
    return CGRectGetMinX(self.frame);
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return CGRectGetMinY(self.frame);
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return CGRectGetMaxX(self.frame);
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return CGRectGetMaxY(self.frame);
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return CGRectGetMidX(self.frame);
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return CGRectGetMidY(self.frame);
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)width {
    return CGRectGetWidth(self.bounds);
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return CGRectGetHeight(self.bounds);
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

#pragma mark - IB相关
#pragma mark -

- (void)setCornerRadius:(NSInteger)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}

- (NSInteger)cornerRadius
{
    return self.layer.cornerRadius;
}

- (void)setBorderWidth:(NSInteger)borderWidth
{
    self.layer.borderWidth = borderWidth;
}

- (NSInteger)borderWidth
{
    return self.layer.borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderHexRgb:(NSString *)borderHexRgb
{
    NSScanner *scanner = [NSScanner scannerWithString:borderHexRgb];
    unsigned hexNum;
    //这里是将16进制转化为10进制
    if (![scanner scanHexInt:&hexNum])
    return;
    self.layer.borderColor = [self colorWithRGBHex:hexNum].CGColor;
}

- (NSString *)borderHexRgb {
    
    return @"FFFFFF";
}


- (void)setMasksToBounds:(BOOL)bounds
{
    self.layer.masksToBounds = bounds;
}

- (BOOL)masksToBounds {
    
    return  self.layer.masksToBounds;
}

- (UIColor *)colorWithRGBHex:(UInt32)hex
{
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}


- (UIView *)JC_FirstResponder {
    
    if (([self isKindOfClass:[UITextField class]] || [self isKindOfClass:[UITextView class]])
        && (self.isFirstResponder)) {
        return self;
    }
    
    for (UIView *v in self.subviews){
        UIView *fv = [v JC_FirstResponder];
        if (fv)
        {
            return fv;
        }
    }
    return nil;
}

- (UIViewController *)JC_CurrentViewController {
    
    UIResponder *responder = self.nextResponder;
    do
    {
        if ([responder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)responder;
        }
        responder = responder.nextResponder;
    }
    while (responder);
    
    return nil;
}

+ (UIImage *)JC_shotImage:(UIView *)view {
    
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 0);
    
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return result;
}

@end
