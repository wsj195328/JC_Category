//
//  UIView+JCCustom.h
//  JC_Category
//
//  Created by user on 2018/6/6.
//  Copyright © 2018 user. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width

@interface UIView (JCCustom)

// MARK:设置阴影 (set shadow)
- (void)JC_MakeShadowWithOffset:(CGSize)offset
                         radius:(CGFloat)radius
                          color:(UIColor *)color
                        opacity:(CGFloat)opacity;  // opacity (0 ~ 1)

//MARK: 阴影圆角 (shadow and corner)
- (instancetype)JC_AddShadowOffset:(CGSize)offset
                      shadowRadius:(CGFloat)shadowRadius
                             color:(UIColor *)color
                           opacity:(CGFloat)opacity  // opacity (0 ~ 1)
                      cornerRadius:(CGFloat)cornerRadius;

// MARK:贝塞尔曲线切圆角 (clip RadiuCorner)
- (instancetype)JC_ClipCornerRadius:(CGFloat)value;


//显示信息 <show>
+ (void)JC_ShowMessage:(NSString *)message;


// MARK:只读属性 (readOnly)
@property (nonatomic,assign,readwrite) CGFloat left;
@property (nonatomic,assign,readwrite) CGFloat top;
@property (nonatomic,assign,readwrite) CGFloat right;
@property (nonatomic,assign,readwrite) CGFloat bottom;
@property (nonatomic,assign,readwrite) CGFloat width;
@property (nonatomic,assign,readwrite) CGFloat height;
@property (nonatomic,assign,readwrite) CGFloat centerX;
@property (nonatomic,assign,readwrite) CGFloat centerY;
@property (nonatomic,assign,readwrite) CGPoint origin;
@property (nonatomic,assign,readwrite) CGSize  size;

// MARK:IB视图 <IBInspectable>

@property (assign,nonatomic) IBInspectable NSInteger cornerRadius;
@property (assign,nonatomic) IBInspectable BOOL  masksToBounds;
@property (assign,nonatomic) IBInspectable NSInteger borderWidth;
@property (strong,nonatomic) IBInspectable NSString  *borderHexRgb;
@property (strong,nonatomic) IBInspectable UIColor   *borderColor;

//第一响应者 <first>
- (UIView *)JC_FirstResponder;

//当前viewcontroler
- (UIViewController *)JC_CurrentViewController;

+ (UIImage *)JC_shotImage:(UIView *)view; //截图



@end
