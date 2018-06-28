//
//  JCAlterViewController.h
//  JC_Category
//
//  Created by  w2033 on 2018/6/27.
//  Copyright © 2018 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JCAlterViewController : NSObject

/**
 *  单个按键的 alertView
 */
+ (void)JC_presentAlertViewWithTitle:(NSString *)title
                             message:(NSString *)message
                        confirmTitle:(NSString *)confirmTitle
                             handler:(void(^)(void))handler;

/**
 *  双按键的 alertView
 */
+ (void)JC_presentAlertViewWithTitle:(NSString *)title
                             message:(NSString *)message
                         cancelTitle:(NSString *)cancelTitle
                        defaultTitle:(NSString *)defaultTitle
                            distinct:(BOOL)distinct
                              cancel:(void(^)(void))cancel
                             confirm:(void(^)(void))confirm;


/**
 *  任意多按键的 alert (alertView or ActionSheet)
 */
+ (void)JC_presentAlertWithTitle:(NSString *)title
                         message:(NSString *)message
                    actionTitles:(NSArray *)actionTitles
                  preferredStyle:(UIAlertControllerStyle)preferredStyle
                         handler:(void(^)(NSUInteger buttonIndex, NSString *buttonTitle))handler;

@end
