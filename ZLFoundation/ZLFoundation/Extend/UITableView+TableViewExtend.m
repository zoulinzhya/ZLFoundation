//
//  UITableView+TableViewExtend.m
//  learnMasonry
//
//  Created by zoulin on 16/9/2.
//  Copyright © 2016年 zoulin. All rights reserved.
//

#import "UITableView+TableViewExtend.h"

@implementation UITableView (TableViewExtend)

/**
 *  @author zoulin
 *
 *  @brief 去掉底部FooterView
 */
- (void)takeOutTableViewFooterView
{
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [self setTableFooterView:view];
}

/**
 *  @author zoulin
 *
 *  @brief 去掉顶部HeaderView
 */
- (void)takeOutTableViewHeaderView
{
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [self setTableHeaderView:view];
}
@end
