//
//  PlistManager.m
//  learnMasonry
//
//  Created by zoulin on 2016/9/29.
//  Copyright © 2016年 zoulin. All rights reserved.
//

#import "PlistManager.h"

@interface PlistManager()

@end

@implementation PlistManager

+ (instancetype)sharedInstance
{
    static PlistManager *instance = nil;
    static dispatch_once_t once ;
    dispatch_once(&once, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

//自动在沙盒路径下面创建plist文件用于保存数据
- (NSString *)getPathByfileName:(NSString *)fileName
{
    //NSString *localResDirpath = [[NSBundle mainBundle] pathForResource:@"userdefault_img@2x" ofType:@"png"]
     //沙盒路径下的文件
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path = [paths    objectAtIndex:0];
    NSString *comfileName = [NSString stringWithFormat:@"%@.plist", fileName];
    NSString *fileNamePath = [path stringByAppendingPathComponent:comfileName]; //获取路径
    
    return fileNamePath;
}

- (void)saveDataToPlistFile:(id)data  fileName:(NSString *)fileName
{
   [data writeToFile:[self getPathByfileName:fileName] atomically:YES];
}

- (id)getDataFromPlistFileName:(NSString *)fileName dataType:(DATA_TYPE )dataType
{
    NSString *getFileName = [self getPathByfileName:fileName];
    
    switch (dataType) {
        case Array_Type:
        {
            return [NSArray arrayWithContentsOfFile:getFileName];
        }
            break;
        case MutableArray_Type:
        {
            return [NSMutableArray arrayWithContentsOfFile:getFileName];
        }
            break;
        case Dictionary_Type:
        {
            return [NSDictionary dictionaryWithContentsOfFile:getFileName];
        }
            break;
        case MutableDictionary_Type:
        {
            return [NSMutableDictionary dictionaryWithContentsOfFile:getFileName];
        }
            break;
        case NSData_Type:
        {
            return [NSData dataWithContentsOfFile:getFileName];
        }
            break;
        case MutableData_Type:
        {
            return [NSMutableData dataWithContentsOfFile:getFileName];
        }
            break;
        case String_Type:
        {
            return [NSString stringWithContentsOfFile:getFileName encoding:NSUTF8StringEncoding error:nil];
        }
            break;
        case MutableString_Type:
        {
            return [NSMutableString stringWithContentsOfFile:getFileName encoding:NSUTF8StringEncoding error:nil];
        }
            break;
        case Number_Type:
        {
            return [NSNumber numberWithInt:0];
        }
            break;
        case NSDate_Type:
        {
            return [NSDate date];
        }
            break;
        default:
            break;
    }
    return nil;
}

//读取工程目录下面或者资源目录下面的手工创建的plist文件数据
- (NSArray *)readPlistFileName:(NSString *)plistName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSArray *getedPlistArray = [NSArray arrayWithContentsOfFile:path];
    return getedPlistArray;
}

@end
