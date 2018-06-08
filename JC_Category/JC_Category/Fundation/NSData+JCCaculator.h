//
//  NSData+JCCaculator.h
//  JC_Category
//
//  Created by user on 2018/6/7.
//  Copyright © 2018 user. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (JCCaculator)

// MARK:十六进制与NSString转换 (HEX  and  NSData)
+ (NSData *)JC_ConvertHexStrToData:(NSString *)str;
+ (NSString *)JC_ConvertDataToHexStr:(NSData *)data;


// MARK:字节与NSString转换 (Byte and NSData)
+ (Byte *)JC_GetByteArrayFromData:(NSData *)data;
+ (Byte)JC_OneByteWithHexString:(NSString *)hexString;  //  hex 转 1byte
+ (NSData *)JC_DataWithByteValue:(NSInteger)value;      //  1 NSInteger  == 1 byte
+ (NSData *)JC_DataWithByteValue:(NSInteger)value andLength:(NSInteger)length;  //构造指定长度


// MARK:data处理 (Data deal with)
+ (int)JC_GetDataCRC16:(NSData *)data;
+ (NSData *)JC_ReverseData:(NSData *)data;

@end

NS_ASSUME_NONNULL_END
