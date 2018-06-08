//
//  NSData+JCCaculator.m
//  JC_Category
//
//  Created by user on 2018/6/7.
//  Copyright © 2018 user. All rights reserved.
//

#import "NSData+JCCaculator.h"

@implementation NSData (JCCaculator)

#pragma mark - ➡️< HEX - Data >⬅️()
+ (NSString *)JC_ConvertDataToHexStr:(NSData *)data {

    if (!data || [data length] == 0) {
        return @"";
    }
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[data length]];

    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if ([hexStr length] == 2) {
                [string appendString:hexStr];
            } else {
                [string appendFormat:@"0%@", hexStr];
            }
        }
    }];

    return string;
}

+ (NSData *)JC_ConvertHexStrToData:(NSString *)str {

    if (!str || [str length] == 0) {
        return nil;
    }

    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([str length] % 2 == 0) {
        range = NSMakeRange(0, 2);
    } else {
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < [str length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];

        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];

        range.location += range.length;
        range.length = 2;
    }
    return hexData;
}

#pragma mark - ➡️< HEX Byte >⬅️()
+ (Byte *)JC_GetByteArrayFromData:(NSData *)data {

    Byte *byteData=(Byte *)malloc(data.length);
    memcpy(byteData, [data bytes], [data length]);

    return byteData;
}

+ (Byte)JC_OneByteWithHexString:(NSString *)hexString {

    Byte oneByte = {0};
    if (hexString.length == 2) {

        unsigned long number = strtoul([hexString UTF8String],0,16);

        Byte b =  (Byte) ((0xff & number));
        oneByte = b;
    }
    return oneByte;
}

#pragma mark 将1Byte数据转为Data
+ (NSData *)JC_DataWithByteValue:(NSInteger)value {

    NSInteger tempValue=value&0xFF;
    Byte byte[]={tempValue};
    return [NSData dataWithBytes:byte length:1];
}

+ (NSData *)JC_DataWithByteValue:(NSInteger)value andLength:(NSInteger)length {

    NSMutableData *data=[NSMutableData data];
    NSInteger tempValue = value;

    /**
     *  按长度转换数据
     */
    for (int i=0; i<length; i++) {

        Byte byte[]={tempValue&0xFF};
        NSData *tempData=[NSData dataWithBytes:byte length:1];
        [data appendData:tempData];
        tempValue=tempValue>>8;
    }
    return data;
}


#pragma mark - ➡️< Data deal >⬅️()
+ (int)JC_GetDataCRC16:(NSData *)data {

    Byte *Databyte=[self JC_GetByteArrayFromData:data];

    unsigned short CRCValue=0xffff;

    for (int num=0; num<data.length; num++) {


        unsigned char dataValue=Databyte[num];

        CRCValue=JCcrc16OneByte(CRCValue, dataValue);

    }

    free(Databyte);

    return CRCValue;
}

unsigned short JCcrc16OneByte(unsigned short lastcrc,unsigned char ddata) {

    unsigned char i;

    for (i=0; i<8; i++) {

        if (((ddata<<i)^(lastcrc>>8))&0x80)
        {

            lastcrc<<=1;
            lastcrc=lastcrc^0x1021;

        }
        else {

            lastcrc<<=1;
        }
    }

    return lastcrc;
}


+ (NSData *)JC_ReverseData:(NSData *)data {

    NSMutableData *finData=[NSMutableData data];
    for (int i=1; i<=data.length; i++) {

        [finData appendData:[data subdataWithRange:NSMakeRange(data.length-i, 1)]];
    }

    return (NSData *)finData;
}
@end
