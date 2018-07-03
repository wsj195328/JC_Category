//
//  BTWGetPictureTool.h
//  BuyTheWay
//
//  Created by  w2033 on 2018/7/3.
//  Copyright © 2018 w2033. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import <AVFoundation/AVFoundation.h>

@interface BTWGetPictureTool : NSObject 

//判断权限
+ (void)JC_VerifyPhotoLibary:(void(^)(PHAuthorizationStatus state))PhotoBlock;
+ (void)JC_VerifyCamera:(void(^)(AVAuthorizationStatus state))CameraBlock;

//获取控制器
+ (void)JC_TakePhoto:(void(^)(UIImagePickerController *))pickBlock;
+ (void)JC_SelectPicture:(void(^)(UIImagePickerController *))selectBlock;

+ (instancetype)shareTool;

//监听这个东西，就有新照片
@property (nonatomic, strong) UIImage *AEImage;

@end
