//
//  TheAppClass.h
//  learnMasonry
//
//  Created by zoulin on 16/9/2.
//  Copyright © 2016年 zoulin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TheAppClass : NSObject

#pragma mark - DefinedView
/**
 *  @author zoulin
 *
 *  @brief 创建三个点
 *
 *  @return UIButton
 */
+ (UIButton *)CreatePointButton:(UIColor *)pointColor;

/**
 *  @author zoulin
 *
 *  @brief 创建一个白点
 *
 *  @param radius 半径
 *
 *  @return UIImageView
 */
+ (UIImageView *)createPoint:(CGFloat )radius color:(UIColor *)pointColor;

+ (UIButton *)CreateButtonPointCount:(NSInteger )pointCount color:(UIColor *)pointColor;

/**
 *  @author zoulin
 *
 *  @brief 绘制一条虚线
 *
 *  @param lineView    需要绘制成虚线的view
 *  @param lineLength  虚线的宽度
 *  @param lineSpacing 虚线的间距
 *  @param lineColor   虚线的颜色
 */
+ (void)DrawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

/**
 *  @author zoulin
 *
 *  @brief 创建动画用的view
 *
 *  @param nController
 *  @param titleArray
 *  @param nAction
 */
+ (void)initControllerView:(UIViewController *)nController array:(NSArray *)titleArray action:(SEL)nAction;

/**
 *  获得每个操作按钮的frame
 *
 *  @param index    当前按钮的位置,从0开始
 *  @param totleNum 所有按钮的总数
 *
 *  @return 按钮的frame
 */
+ (CGRect)rectForBtnAtIndex : (NSUInteger)index totalNum : (NSUInteger)totleNum;


/*
 *Desc:设置分割线缩进到满屏 需在viewdidload里面调用本函数 并且还需要在类里面实现willDisplayCell
 */
+ (void)SetTableViewSeperateLine:(UITableView *)nTable;

/**
 *Desc: UITableView有数据时去掉底部的分割线
 */
+(void)setExtraCellLineHidden: (UITableView *)tableView;

@end
