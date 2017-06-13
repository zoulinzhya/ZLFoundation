//
//  PlistManager.h
//  learnMasonry
//
//  Created by zoulin on 2016/9/29.
//  Copyright © 2016年 zoulin. All rights reserved.
//  管理读写plist文件

#import <Foundation/Foundation.h>

/*
 plist文件是将某些特定的类，通过XML文件的方式保存在目录中。
 
 可以被序列化的类型只有如下几种：
     NSArray;
     NSMutableArray;
     NSDictionary;
     NSMutableDictionary;
     NSData;
     NSMutableData;
     NSString;
     NSMutableString;
     NSNumber;
     NSDate;
 */

typedef NS_ENUM(NSInteger, DATA_TYPE)
{
    UnKnown_Type           = -1,
    Array_Type             = 0,
    MutableArray_Type      = 1,
    Dictionary_Type        = 2,
    MutableDictionary_Type = 3,
    NSData_Type            = 4,
    MutableData_Type       = 5,
    String_Type            = 6,
    MutableString_Type     = 7,
    Number_Type            = 8,
    NSDate_Type            = 9,
};

@interface PlistManager : NSObject

+ (instancetype)sharedInstance;

- (NSString *)getPathByfileName:(NSString *)fileName;

- (void)saveDataToPlistFile:(id)data  fileName:(NSString *)fileName;

- (id)getDataFromPlistFileName:(NSString *)fileName dataType:(DATA_TYPE )dataType;

//读取工程目录下面或者资源目录下面的手工创建的plist文件数据
- (NSArray *)readPlistFileName:(NSString *)plistName;

@end
