//
//  JCMacro.h
//  JC_Category
//
//  Created by  w2033 on 2018/6/18.
//  Copyright © 2018 user. All rights reserved.
//

#ifndef JCMacro_h
#define JCMacro_h

//TODO: ----  系统 -----
//是否为iPhone X
#define kIs_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
//APP版本号
#define KAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//系统版本号
#define kSystemVersion [[UIDevice currentDevice] systemVersion]


//TODO: ----  判断对象 -----
//字符串是否为空
#define kIsStringEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kIsArrayEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kIsDictEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define kIsObjectEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))


//TODO: ----  屏幕相关  -----
//屏幕宽度
#define kScreenWidth \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.width)
//屏幕高度
#define kScreenHeight \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.height)
//屏幕Size
#define kScreenSize \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale) : [UIScreen mainScreen].bounds.size)
//状态栏加导航栏高度
#define kTopHeight (kIs_iPhoneX ? 88 : 64)
//TabBar高度
#define kTabBarHeight (kIs_iPhoneX ? 83 : 49)


//TODO: ----  系统单例相关 -----
//Aplication
#define kApplication [UIApplication sharedApplication]
//keyWindow
#define kKeyWindow [UIApplication sharedApplication].keyWindow
//AppDelegate
#define kAppdelegate [UIApplication sharedApplication].delegate
//UserDefaults
#define kUserDefault [NSUserDefaults standardUserDefaults]
//NSNotificationCenter
#define kNotificationCenter [NSNotificationCenter defaultCenter]


//TODO: ----  app路径相关  -----
//获取沙盒Document路径
#define kDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒temp路径
#define kTempPath NSTemporaryDirectory()
//获取沙盒Cache路径
#define kCachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]


//TODO: ----  颜色值  -----
#define kRGB(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define kRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]
#define kRandomColor           KRGB_COLOR(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256))


//TODO: ----  其他代码常用  -----

//弱引用/强引用
#define kWeakSelf(type)   __weak typeof(type) weak##type = type
#define kStrongSelf(type) __strong typeof(type) strongOBj = type

//获取一段时间间隔
#define kStart CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define KEnd NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)

// 图片
#define kImageOfFile(NAME,EXT) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]]
#define kImageNamed(NAME) [UIImage imageNamed:NAME]

// 多行文本获取高度
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_7_0
#define kMultiLineTextSize(text, font, maxSize) [text length] > 0 ? [text \
boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) \
attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero;
#else
#define kMultiLineTextSize(text, font, maxSize) [text length] > 0 ? [text \
sizeWithFont:font constrainedToSize:maxSize] : CGSizeZero;
#endif

// 字体大小（常规/粗体）
#define kBoldFont(FONTSIZE)      [UIFont boldSystemFontOfSize:FONTSIZE]
#define kSystemFont(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define kFont(NAME,FONTSIZE)     [UIFont fontWithName:(NAME) size:(FONTSIZE)]

#endif /* JCMacro_h */
