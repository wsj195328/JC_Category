//
//  UITableViewCell+JCRoundCorner.h
//  JC_Category
//
//  Created by user on 2018/6/6.
//  Copyright © 2018 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (JCRoundCorner)

- (instancetype)JC_TableView:(UITableView *)tableView
                      Radius:(CGFloat)radiusValue
                   IndexPath:(NSIndexPath *)indexPath;

@end
