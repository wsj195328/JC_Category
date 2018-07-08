//
//  BTWGetPictureTool.m
//  BuyTheWay
//
//  Created by  w2033 on 2018/7/3.
//  Copyright © 2018 w2033. All rights reserved.
//

#import "BTWGetPictureTool.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "JCAlterViewController.h"

@interface BTWGetPictureTool ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) UIImagePickerController *cameraPicker;
@property (nonatomic, strong) UIImagePickerController *photoPicker;

@end

@implementation BTWGetPictureTool


#pragma mark - 🐶 单例

- (instancetype)init {
    @synchronized(self) {
        if (_tool == nil) {
            _tool = [[BTWGetPictureTool alloc] init];
        }
    }
    return _tool;
}

static BTWGetPictureTool *_tool;
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _tool = [super allocWithZone:zone];
    });
    return _tool;
}

+ (instancetype)shareTool {
    
    @synchronized(self) {
        if (_tool == nil) {
            _tool = [[BTWGetPictureTool alloc] init];
        }
    }
    return _tool;
}


//判断权限
+ (void)JC_VerifyPhotoLibary:(void(^)(PHAuthorizationStatus state))PhotoBlock {
    
    //请求权限
    PHAuthorizationStatus state = [PHPhotoLibrary authorizationStatus];
    switch (state) {
        case PHAuthorizationStatusNotDetermined:
        {
            
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                
                PhotoBlock==nil ?: PhotoBlock(status);
                if (status == PHAuthorizationStatusDenied) {
                    [JCAlterViewController JC_presentAlertViewWithTitle:@"请求获取相册失败" message:@"请在设置权限中开启相册权限" confirmTitle:@"确定" handler:nil];
                }
            }];
        }
            break;
        case PHAuthorizationStatusAuthorized:
        {
            PhotoBlock==nil ?: PhotoBlock(PHAuthorizationStatusAuthorized);
        }
            break;
        case PHAuthorizationStatusDenied:
        {
            PhotoBlock==nil ?: PhotoBlock(PHAuthorizationStatusDenied);
            [JCAlterViewController JC_presentAlertViewWithTitle:@"请求获取相册失败" message:@"请在设置权限中开启相册权限" confirmTitle:@"确定" handler:nil];
        }
            break;
        case PHAuthorizationStatusRestricted:
        {
            PhotoBlock==nil ?: PhotoBlock(PHAuthorizationStatusDenied);
            [JCAlterViewController JC_presentAlertViewWithTitle:@"请求获取相册失败" message:@"请在设置权限中开启相册权限" confirmTitle:@"确定" handler:nil];
        }
            break;
            
        default:
            break;
    }
    
}
+ (void)JC_VerifyCamera:(void(^)(AVAuthorizationStatus state))CameraBlock {
    
    //只返回两种状态
    AVAuthorizationStatus state = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    switch (state) {
        case AVAuthorizationStatusNotDetermined:
        {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                
                CameraBlock==nil ?: CameraBlock(AVAuthorizationStatusAuthorized);
                if (granted == NO) {
                    
                    [JCAlterViewController JC_presentAlertViewWithTitle:@"请求获取相机失败" message:@"请在设置权限中开启相机权限" confirmTitle:@"确定" handler:nil];
                }
            }];
        }
            break;
        case AVAuthorizationStatusAuthorized:
        {
            CameraBlock==nil ?: CameraBlock(AVAuthorizationStatusAuthorized);
        }
            break;
        case AVAuthorizationStatusDenied:
        {
            CameraBlock==nil ?: CameraBlock(AVAuthorizationStatusDenied);
            [JCAlterViewController JC_presentAlertViewWithTitle:@"请求获取相机失败" message:@"请在设置权限中开启相机权限" confirmTitle:@"确定" handler:nil];
        }
            break;
        case AVAuthorizationStatusRestricted:
        {
            CameraBlock==nil ?: CameraBlock(AVAuthorizationStatusDenied);
            [JCAlterViewController JC_presentAlertViewWithTitle:@"请求获取相机失败" message:@"请在设置权限中开启相机权限" confirmTitle:@"确定" handler:nil];
        }
            break;
        default:
            break;
    }
    
    
}

//获取控制器
+ (void)JC_TakePhoto:(void(^)(UIImagePickerController *))pickBlock {

    AVAuthorizationStatus state = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (state == AVAuthorizationStatusAuthorized) {
        
        if ([BTWGetPictureTool shareTool].cameraPicker == nil) {
            
            UIImagePickerController *pickVC = [[UIImagePickerController alloc] init];
            pickVC.sourceType = UIImagePickerControllerSourceTypeCamera;
            pickVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            pickVC.mediaTypes = @[(NSString *)kUTTypeImage];
            pickVC.allowsEditing = YES;
            pickVC.delegate = [BTWGetPictureTool shareTool];
            [BTWGetPictureTool shareTool].cameraPicker = pickVC;
            pickBlock==nil ?: pickBlock(pickVC);
        }
        else {
             pickBlock==nil ?: pickBlock([BTWGetPictureTool shareTool].cameraPicker);
        }
    }
    

}
+ (void)JC_SelectPicture:(void(^)(UIImagePickerController *))selectBlock {
    
    PHAuthorizationStatus state = [PHPhotoLibrary authorizationStatus];
    if (state == PHAuthorizationStatusAuthorized) {
        
        if ([BTWGetPictureTool shareTool].photoPicker == nil) {
            
            UIImagePickerController *pickVC = [[UIImagePickerController alloc] init];
            pickVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            pickVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            pickVC.mediaTypes = @[(NSString *)kUTTypeImage];
            pickVC.allowsEditing = YES;
            pickVC.delegate = [BTWGetPictureTool shareTool];
            [BTWGetPictureTool shareTool].photoPicker = pickVC;
            selectBlock==nil ?: selectBlock(pickVC);
        }
        else {
            selectBlock==nil ?: selectBlock([BTWGetPictureTool shareTool].photoPicker);
        }
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *original = info[@"UIImagePickerControllerEditedImage"];
    //压过的图片
    NSData *compressData = UIImageJPEGRepresentation(original, 0.01);
    self.AEImage = [UIImage imageWithData:compressData];
    //相机
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
    //相册
    else if (picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
    
    
    
}



@end
