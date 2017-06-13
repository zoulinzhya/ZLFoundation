//
//  UITableView+TableViewExtend.h
//  learnMasonry
//
//  Created by zoulin on 16/9/2.
//  Copyright © 2016年 zoulin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UITableView (TableViewExtend)

/**
 *  @author zoulin
 *
 *  @brief 去掉底部FooterView
 */
- (void)takeOutTableViewFooterView;

/**
 *  @author zoulin
 *
 *  @brief 去掉顶部HeaderView
 */
- (void)takeOutTableViewHeaderView;


@end
