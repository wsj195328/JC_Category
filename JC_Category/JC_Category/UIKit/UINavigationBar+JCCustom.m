//
//  UINavigationBar+JCCustom.m
//  JC_Category
//
//  Created by user on 2018/6/6.
//  Copyright © 2018 user. All rights reserved.
//

#import "UINavigationBar+JCCustom.h"

@implementation UINavigationBar (JCCustom)

+ (void)JC_RemoveBottomLine {

    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:(UIBarMetricsDefault)];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
}

@end
