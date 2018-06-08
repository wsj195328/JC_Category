//
//  UITableViewCell+JCRoundCorner.m
//  JC_Category
//
//  Created by user on 2018/6/6.
//  Copyright © 2018 user. All rights reserved.
//

#import "UITableViewCell+JCRoundCorner.h"
#import "UIView+JCCustom.h"
#import "UIColor+JCCaculator.h"

@implementation UITableViewCell (JCRoundCorner)

- (instancetype)JC_TableView:(UITableView *)tableView
                      Radius:(CGFloat)radiusValue
                   IndexPath:(NSIndexPath *)indexPath {

    self.backgroundColor = UIColor.clearColor;

    //实体视图 <shape view>
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];

    //描线 <line>
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGRect bounds = CGRectInset(self.bounds, 0, 0);
    BOOL addLine = NO;

    //每组第一行 <first one，every section> | - |
    if (indexPath.row == 0) {

        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), radiusValue);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), radiusValue);
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
        addLine = YES;
    }
    //每组最后一行 <lastest one,every section> | _ |
    else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {

        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), radiusValue);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMinY(bounds), radiusValue);
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));

        //设置阴影 <shadow>
        [self JC_MakeShadowWithOffset:(CGSize){1,3}
                               radius:radiusValue
                                color:UIColor.grayColor
                              opacity:0.1];
    }
    else {

        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
        CGPathMoveToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
        addLine = YES;
    }
    layer.path = pathRef;
    CFRelease(pathRef);

    //修改颜色 <change color>

    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.strokeColor = COLORHEX(@"e5e5e5").CGColor;

    if (addLine == YES) {
        CALayer *line = [[CALayer alloc] init];
        CGFloat line_H = 1;
        line.frame = CGRectMake(CGRectGetMinX(bounds)+15, bounds.size.height-line_H, bounds.size.width-30, line_H);
        line.backgroundColor = COLORHEX(@"e5e5e5").CGColor;
        [layer addSublayer:line];
    }
    UIView *bgView = [[UIView alloc] initWithFrame:bounds];
    [bgView.layer insertSublayer:layer atIndex:0];
    bgView.backgroundColor = [UIColor whiteColor];
    self.backgroundView = bgView;

    return self;

}

@end
