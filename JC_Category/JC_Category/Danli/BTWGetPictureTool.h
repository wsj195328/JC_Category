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

//首次，判断权限
+ (void)JC_VerifyPhotoLibary:(void(^)(PHAuthorizationStatus state))PhotoBlock;
+ (void)JC_VerifyCamera:(void(^)(AVAuthorizationStatus state))CameraBlock;

//然后，预加载, 这不是真正获取方法 <最好在load方法中预加载>
+ (void)JC_forwardTakePhoto:(void(^)(UIImagePickerController *))pickBlock ;
+ (void)JC_forwardSelectPhoto:(void(^)(UIImagePickerController *))pickBlock;

//最后，获取控制器，这里获取才是正确的
+ (void)JC_TakePhoto:(void(^)(UIImagePickerController *))pickBlock;
+ (void)JC_SelectPicture:(void(^)(UIImagePickerController *))selectBlock;

+ (instancetype)shareTool;

//监听这个东西，就有新照片
@property (nonatomic, strong) UIImage *AEImage;

@end
