//
//  UIView+JCCustom.h
//  JC_Category
//
//  Created by user on 2018/6/6.
//  Copyright © 2018 user. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width

@interface UIView (JCCustom)

// MARK:设置阴影 (set shadow)
- (void)JC_MakeShadowWithOffset:(CGSize)offset
                         radius:(CGFloat)radius
                          color:(UIColor *)color
                        opacity:(CGFloat)opacity;  // opacity (0 ~ 1)

// MARK:只读属性 (readOnly)
@property (nonatomic,assign,readonly) CGFloat left;
@property (nonatomic,assign,readonly) CGFloat top;
@property (nonatomic,assign,readonly) CGFloat right;
@property (nonatomic,assign,readonly) CGFloat bottom;
@property (nonatomic,assign,readonly) CGFloat width;
@property (nonatomic,assign,readonly) CGFloat height;
@property (nonatomic,assign,readonly) CGFloat centerX;
@property (nonatomic,assign,readonly) CGFloat centerY;
@property (nonatomic,assign,readonly) CGPoint origin;
@property (nonatomic,assign,readonly) CGSize  size;

@end
