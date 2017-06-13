//
//  BaseViewController.m
//  learnMasonry
//
//  Created by zoulin on 16/9/27.
//  Copyright © 2016年 zoulin. All rights reserved.
//

#import "BaseClassController.h"
#import "TheAppClass.h"

@interface BaseClassController()

@end

@implementation BaseClassController

- (instancetype)initWithTitle:(NSString *)title {
    if (self = [super init]) {
        self.title = title;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:UIColorFromMyRGB(RGB_C_BG)];
}

- (void)configController
{
    self.view.backgroundColor = UIColorFromMyRGB(RGB_C_BG);
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

@end
