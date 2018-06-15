//
//  JCSingleton.h
//  JC_Category
//
//  Created by user on 2018/6/15.
//  Copyright © 2018 user. All rights reserved.
//

#ifndef JCSingleton_h
#define JCSingleton_h

//获取类单例对象
#define JC_SINGLE(class) [class sharedInstance]


// .h
#define JC_INTERFACE + (instancetype)sharedInstance;

// .m
// \ 代表下一行也属于宏
// ## 是分隔符
#define JC_IMPLEMENTATION \
static id _instance; \
\
+ (instancetype)sharedInstance {\
\
static dispatch_once_t onceToken;   \
dispatch_once(&onceToken, ^{    \
_instance=[[self alloc] init];   \
}); \
return _instance;    \
} \
\
+ (instancetype)allocWithZone:(NSZone *)zone {\
\
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
}


#endif /* JCSingleton_h */
