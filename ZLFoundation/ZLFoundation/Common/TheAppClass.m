//
//  TheAppClass.m
//  learnMasonry
//
//  Created by zoulin on 16/9/2.
//  Copyright © 2016年 zoulin. All rights reserved.
//

#import "TheAppClass.h"
#import "TitleButton.h"

@implementation TheAppClass


#pragma mark - DefinedView
/**
*  @author zoulin
*
*  @brief 创建三个点
*
*  @return UIButton
*/
+ (UIButton *)CreatePointButton:(UIColor *)pointColor
{
    UIButton *backview = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 22)];
    [backview setBackgroundColor:[UIColor clearColor]];
    
    CGFloat nradius = 7;
    UIImageView *midlePoint = [TheAppClass createPoint:nradius color:UIColorFromMyRGB(RGB_C_R)];
    
    [backview addSubview:midlePoint];
    
    NSNumber * nnN = [NSNumber numberWithFloat:nradius];
    [midlePoint mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(backview.mas_centerX);
        make.centerY.equalTo(backview.mas_centerY);
        make.width.equalTo(nnN);
        make.height.equalTo(nnN);
    }];
    
    float ninterval = 3;  //间隔
    UIImageView *leftPoint = [TheAppClass createPoint:nradius color:UIColorFromMyRGB(RGB_C_R)];
    
    [backview addSubview:leftPoint];
    
    [leftPoint mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(midlePoint.mas_left).offset(-ninterval);
        make.top.equalTo(midlePoint.mas_top);
        make.width.equalTo(nnN);
        make.height.equalTo(nnN);
    }];
    
    UIImageView *rightPoint = [TheAppClass createPoint:nradius color:UIColorFromMyRGB(RGB_C_R)];
    
    [backview addSubview:rightPoint];
    
    [rightPoint mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(midlePoint.mas_right).offset(ninterval);
        make.top.equalTo(midlePoint.mas_top);
        make.width.equalTo(nnN);
        make.height.equalTo(nnN);
    }];
    
    return backview;
}

+ (UIButton *)CreateButtonPointCount:(NSInteger )pointCount color:(UIColor *)pointColor
{
    UIButton *pointButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [pointButton setBackgroundColor:[UIColor clearColor]];
    
    CGFloat nradius = 7; //point 半径
    float ninterval = 3;  //间隔
    for (int i = 0; i < pointCount; i++) {
        UIImageView *point = [TheAppClass createPoint:nradius color:UIColorFromMyRGB(RGB_C_R)];
        
        [pointButton addSubview:point];
        
        [point mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(pointButton.mas_left).offset(ninterval + i*(ninterval + nradius));
            make.centerY.equalTo(pointButton.mas_centerY);
            make.width.equalTo(@(nradius));
            make.height.equalTo(@(nradius));
        }];
    }
    
    return pointButton;
}

/**
 *  @author zoulin
 *
 *  @brief 创建一个白点
 *
 *  @param radius 半径
 *
 *  @return UIImageView
 */
+ (UIImageView *)createPoint:(CGFloat )radius color:(UIColor *)pointColor
{
    CGFloat nradius = radius;  //半径
    UIImageView *whitepoint = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, nradius, nradius)];
    //[whitepoint setBackgroundColor:[UIColor whiteColor]];
    [whitepoint setBackgroundColor:pointColor];
    whitepoint.layer.cornerRadius = whitepoint.frame.size.height/2;
    whitepoint.layer.masksToBounds = YES; //没这句话它圆不起来
    
    return whitepoint;
}

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
+ (void)DrawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}

/**
 *  @author zoulin
 *
 *  @brief 创建动画用的view
 *
 *  @param nController
 *  @param titleArray
 *  @param nAction
 */
+ (void)initControllerView:(UIViewController *)nController array:(NSArray *)titleArray action:(SEL)nAction
{
    nController.view.backgroundColor = [UIColor whiteColor];
    
    if(titleArray&&titleArray.count>0){
        NSUInteger row = titleArray.count%4==0 ? titleArray.count/4 : titleArray.count/4+1;
        UIView *operateView = [[UIView alloc] initWithFrame:CGRectMake(0, MainScreenHeigth-(row*50+20) - 64, MainScreenWidth, row*50+20)];
        [nController.view addSubview:operateView];
        for (int i=0; i<titleArray.count; i++) {
            TitleButton *btn = [[TitleButton alloc] initWithFrame:[TheAppClass rectForBtnAtIndex:i totalNum:titleArray.count] withTitle:[titleArray objectAtIndex:i]];
            btn.tag = i;
            [btn addTarget:nController action:nAction forControlEvents:UIControlEventTouchUpInside];
            [operateView addSubview:btn];
        }
    }
}

/**
 *  获得每个操作按钮的frame
 *
 *  @param index    当前按钮的位置,从0开始
 *  @param totleNum 所有按钮的总数
 *
 *  @return 按钮的frame
 */
+ (CGRect)rectForBtnAtIndex : (NSUInteger)index totalNum : (NSUInteger)totleNum
{
    //每一行最多显示4个
    NSUInteger maxColumnNum = 4;
    //每个按钮的列间距
    CGFloat columnMargin = 20;
    //每个按钮的行间距
    CGFloat rowMargin = 20;
    //行数
    // NSUInteger row = totleNum/maxColumnNum;
    //每个按钮的宽度
    CGFloat width = (MainScreenWidth - columnMargin*5)/4;
    //每个按钮的高度
    CGFloat height = 30;
    
    //每个按钮的偏移
    CGFloat offsetX = columnMargin+(index%maxColumnNum)*(width+columnMargin);
    CGFloat offsetY = rowMargin+(index/maxColumnNum)*(height+rowMargin);
    
    return CGRectMake(offsetX, offsetY, width, height);
}

/*
 *Desc:设置分割线缩进到满屏 需在viewdidload里面调用本函数 并且还需要在类里面实现willDisplayCell
 */
+ (void)SetTableViewSeperateLine:(UITableView *)nTable
{
    if ([nTable respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [nTable setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([nTable respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [nTable setLayoutMargins:UIEdgeInsetsZero];
    }
}

/**
 *Desc: UITableView有数据时去掉底部的分割线
 */
+(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

@end
