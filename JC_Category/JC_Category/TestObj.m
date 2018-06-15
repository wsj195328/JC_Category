//
//  TestObj.m
//  JC_Category
//
//  Created by user on 2018/6/11.
//  Copyright © 2018 user. All rights reserved.
//

#import "TestObj.h"

@implementation TestObj

- (NSString *)descriptionWithLocale:(id)locale {

    return [NSString stringWithFormat:@"%s locale %@",__PRETTY_FUNCTION__,locale];
}


@end
