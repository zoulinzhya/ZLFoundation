#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Ext)
- (BOOL)hasSubStringInsensitive:(NSString *)subString;
- (BOOL)hasSubString:(NSString *)subString;
- (BOOL )isNull;
- (NSString *)isNullToString:(id)string;
- (NSString *) trim;
- (NSString *) trimAll;
- (NSString *) MD5Hash;
- (NSString *) md5;
- (NSString *) sha1;

- (NSString *) encodeToUTF8String;
- (NSString *) decodeFromUTF8String; //还没测试

- (NSString *) hmacSha1:(NSString*)key;  //返回的是base64编码的

- (NSString *) base64;
- (NSString *) base64Decode;

- (NSString *) base64URLEncode;
- (NSString *) base64URLDecode;

- (CGFloat)heightWithFont:(UIFont *)font size:(CGSize)size;
- (CGFloat)widthWithFont:(UIFont *)font size:(CGSize)size;

- (NSString *)trimZeroPoint;

@end
