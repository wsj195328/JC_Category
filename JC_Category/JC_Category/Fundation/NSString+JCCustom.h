//
//  NSString+JCCustom.h
//  JC_Category
//
//  Created by user on 2018/6/7.
//  Copyright © 2018 user. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JCCustom)

// FIXME:判断发布证书 (justify distribution ceritification)
+ (BOOL)CheckCodesignWithAppStoreID:(nullable NSString *)str1
                       EnterpriseID:(nullable NSString *)str2;

@end

NS_ASSUME_NONNULL_END
