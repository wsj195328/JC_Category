//
//  JCBaseModel.h
//  JC_Category
//
//  Created by  w2033 on 2018/6/29.
//  Copyright © 2018 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCBaseModel : NSObject <NSCoding>

/** 字典转模型  dict to model */
- (instancetype)initWithDictionary:(NSDictionary*)jsonDict;
/** 模型转字典  model to dict */
- (NSDictionary*)JC_modelToDictionary;

@end
