//
//  UIDevice+JCCustom.h
//  JC_Category
//
//  Created by user on 2018/6/8.
//  Copyright © 2018 user. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (JCCustom)

// MARK:当前系统版本 (system version)
+ (float)JC_CurrentSystemVersion;

// MARK:跳转系统设置项 (Jump system item)

//  ？？？  iOS 10 support    >iOS 11 don't support

/*
 WIFI        App-Prefs:root=WIFI
 Bluetooth   App-Prefs:root=Bluetooth
 蜂窝移动     App-Prefs:root=MOBILE_DATA_SETTINGS_ID
 热点         App-Prefs:root=INTERNET_TETHERING
 VPN         App-Prefs:root=VPN
 运营商       App-Prefs:root=Carrier
 通知         App-Prefs:root=NOTIFICATIONS_ID&path=bundleid
 定位服务     App-Prefs:root=Privacy&path=LOCATION
 通用        App-Prefs:root=General
 关于本机     App-Prefs:root=General&path=About
 键盘        App-Prefs:root=General&path=Keyboard
 辅助功能     App-Prefs:root=General&path=ACCESSIBILITY
 语言与地区    App-Prefs:root=General&path=INTERNATIONAL
 还原         App-Prefs:root=General&path=Reset
 墙纸         App-Prefs:root=Wallpaper
 Siri        App-Prefs:root=SIRI
 隐私         App-Prefs:root=Privacy
 Safari       App-Prefs:root=SAFARI
 音乐         App-Prefs:root=MUSIC
 照相与照相机   App-Prefs:root=Photos
 FaceTime     App-Prefs:root=FACETIME
 电池         App-Prefs:root=BATTERY_USAGE
 存储空间      App-Prefs:root=General&path=STORAGE_ICLOUD_USAGE/DEVICE_STORAGE
 显示与亮度     App-Prefs:root=DISPLAY
 声音设置      App-Prefs:root=Sounds
 App Store    App-Prefs:root=STORE
 iCloud       App-Prefs:root=CASTLE
 语 设置       App-Prefs:root=General&path=INTERNATIONAL
 */
+ (void)JC_JumpSystemItemString:(NSString *)path
                         handle:(void(^)(BOOL isSuccess))statusBlock;



@end

NS_ASSUME_NONNULL_END
