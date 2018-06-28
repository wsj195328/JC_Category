//
//  JCBaseModel.m
//  JC_Category
//
//  Created by  w2033 on 2018/6/29.
//  Copyright © 2018 user. All rights reserved.
//

#import "JCBaseModel.h"
#import <objc/runtime.h>

@implementation JCBaseModel

#pragma mark - ➡️< 序列化 >⬅️(encode and decode)

//序列化
-(void)encodeWithCoder:(NSCoder *)aCoder{
    unsigned int ivarCount = 0;
    Ivar *ivars = class_copyIvarList([self class], &ivarCount);
    for (unsigned int i = 0; i < ivarCount; i++) {
        const char *ivar_name = ivar_getName(ivars[i]);
        NSString *key = [NSString stringWithCString:ivar_name encoding:NSUTF8StringEncoding];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
}

//反序列化
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        unsigned int ivarCount = 0;
        Ivar *ivars = class_copyIvarList([self class], &ivarCount);
        for (unsigned int i = 0; i < ivarCount; i++) {
            const char *ivar_name = ivar_getName(ivars[i]);
            NSString *key = [NSString stringWithCString:ivar_name encoding:NSUTF8StringEncoding];
            [self setValue:[coder decodeObjectForKey:key] forKey:key];
        }
    }
    return self;
}

#pragma mark - ➡️< 字典与模型 >⬅️
- (instancetype)initWithDictionary:(NSDictionary *)jsonDict {
    
    //异常数据处理
    if (!jsonDict || ![jsonDict isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    if (self = [super init]) {
        for (NSString *key in [jsonDict allKeys]) {
            id value = jsonDict[key];
            //1.处理对象类型和数组类型
            if ([value isKindOfClass:[NSArray class]] || [value isKindOfClass:[NSDictionary class]]) {
                [self setValue:value forKeyPath:key];
            }
            //2.处理空类型:防止出现unRecognized selector exception
            else if ([value isKindOfClass:[NSNull class]]) {
                [self setValue:nil forKey:key];
            }
            //3.处理其他类型：包括数字，字符串，布尔，全部使用NSString来处理
            else{
                [self setValue:[NSString stringWithFormat:@"%@",value] forKeyPath:key];
            }
        }
    }
    return self;
}

//MARK: 安全处理 (safe)
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"字典转模型，未能找到key = %@ \n %s",key,__func__);
}
- (void)setNilValueForKey:(NSString *)key
{
    NSLog(@"assign类型的属性set nil %s",__func__);
}

- (NSDictionary *)JC_modelToDictionary {
    
    NSArray* properties = [self filterPropertys];
    NSMutableDictionary* dic = [NSMutableDictionary dictionary];
    [properties enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        NSString* key = (NSString*)obj;
        id value = [self valueForKey:key];
        if ([value isKindOfClass:[NSString class]]) {
            NSString* va =  (NSString*)value;
            if (va.length > 0) {
                [dic setObject:value forKey:key];
            }
        }
        
    }];
    return dic;
}

//MARK: 获取属性个数数组
- (NSArray *)filterPropertys
{
    NSMutableArray* props = [NSMutableArray array];
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for(int i = 0; i < count; i++){
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        [props addObject:propertyName];
        //        NSLog(@"name:%s",property_getName(property));
        //        NSLog(@"attributes:%s",property_getAttributes(property));
    }
    free(properties);
    return props;
}


#pragma mark - ➡️< 模型打印 >⬅️(log model)
-(NSString *)description
{
    NSMutableString* text = [NSMutableString stringWithFormat:@"<%@> \n", [self class]];
    NSArray* properties = [self filterPropertys];
    [properties enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString* key = (NSString*)obj;
        id value = [self valueForKey:key];
        NSString* valueDescription = (value)?[value description]:@"(null)";
        
        if ( ![value respondsToSelector:@selector(count)] && [valueDescription length]>60  ) {
            valueDescription = [NSString stringWithFormat:@"%@...", [valueDescription substringToIndex:59]];
        }
        valueDescription = [valueDescription stringByReplacingOccurrencesOfString:@"\n" withString:@"\n   "];
        [text appendFormat:@"   [%@]: %@\n", key, valueDescription];
    }];
    [text appendFormat:@"</%@>", [self class]];;
    return text;
    
}

@end
