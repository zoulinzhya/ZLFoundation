



#import "NSString+Ext.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>

@implementation NSString (Ext)

- (BOOL)hasSubStringInsensitive:(NSString *)subString{
    if ( subString ) {
        if ( [self rangeOfString:subString options:NSCaseInsensitiveSearch].location != NSNotFound ) {
            return YES;
        }
    }
    
    return NO;
}
- (BOOL)hasSubString:(NSString *)subString {
    if ( subString ) {
        if ( [self rangeOfString:subString].location != NSNotFound ) {
            return YES;
        }
    }
    
    return NO;
}

- (NSString *)isNullToString:(id)string
{
    if ([self isNull])
    {
        return @"";
    }
    else
    {
        return (NSString *)string;
    }
}

- (BOOL )isNull
{
    if ([self isEqual:@"NULL"] || [self isKindOfClass:[NSNull class]] || [self isEqual:[NSNull null]] || [self isEqual:NULL] || [[self class] isSubclassOfClass:[NSNull class]] || self == nil || self == NULL || [self isKindOfClass:[NSNull class]] || [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0 || [self isEqualToString:@"<null>"] || [self isEqualToString:@"(null)"])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

// 去掉头尾的空格与换行符
- (NSString *)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)trimAll {
    NSArray *arr = [self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return [arr componentsJoinedByString:@""];
}

- (NSString *) MD5Hash {
    
    CC_MD5_CTX md5;
    CC_MD5_Init (&md5);
    CC_MD5_Update (&md5, [self UTF8String], [self length]);
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final (digest, &md5);
    NSString *s = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                   digest[0],  digest[1],
                   digest[2],  digest[3],
                   digest[4],  digest[5],
                   digest[6],  digest[7],
                   digest[8],  digest[9],
                   digest[10], digest[11],
                   digest[12], digest[13],
                   digest[14], digest[15]];
    
    return s;
    
}
- (NSString *)md5{
    const char *cStr = [self UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, strlen(cStr), digest );
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}
- (NSString *)sha1{
    const char *ptr = [self UTF8String];
    
    int i =0;
    int len = strlen(ptr);
    Byte byteArray[len];
    while (i!=len)
    {
        unsigned eachChar = *(ptr + i);
        unsigned low8Bits = eachChar & 0xFF;
        
        byteArray[i] = low8Bits;
        i++;
    }
    
    unsigned char digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(byteArray, len, digest);
    
    NSMutableString *hex = [NSMutableString string];
    for (int i=0; i<20; i++)
        [hex appendFormat:@"%02x", digest[i]];
    
    NSString *immutableHex = [NSString stringWithString:hex];
    
    return immutableHex;
}


- (NSString *)encodeToUTF8String{
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)self,NULL,(CFStringRef)@"!*'();:@&=+$,/?%#[]",kCFStringEncodingUTF8));
    
}

- (NSString *)decodeFromUTF8String{
    NSMutableString *outputStr = [NSMutableString stringWithString:self];
    [outputStr replaceOccurrencesOfString:@"+"
                               withString:@" "
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0, [outputStr length])];
    
    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)hmacSha1:(NSString*)key{
    const char *cKey  = [key cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cData = [self cStringUsingEncoding:NSUTF8StringEncoding];
    
    char cHMAC[CC_SHA1_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);

    NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC length:CC_SHA1_DIGEST_LENGTH];
    NSString *hashsss = [HMAC base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return hashsss;
}

- (NSString *) base64{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

- (NSString *) base64Decode {
    NSData * data = [[NSData alloc] initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSString * decodeStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    return decodeStr;
}

- (NSString *) base64URLEncode {
    NSString * b64 = [self base64];
    
    b64 = [b64 componentsSeparatedByString:@"="][0];
    b64 = [b64 stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
    b64 = [b64 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    
    return b64;
}

- (NSString *) base64URLDecode {
    NSString * replace = self;
    replace = [replace stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
    replace = [replace stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
    
    switch (replace.length % 4) {
        case 0:
        {
            NSLog(@"length ok ....");
        }
            break;
            
        case 2:
        {
            replace = [NSString stringWithFormat:@"%@==", replace];
        }
            break;
            
        case 3:
        {
            replace = [NSString stringWithFormat:@"%@=", replace];
        }
            break;
            
        default:
        {
            NSAssert(NO, @"base64URLDecode Base string error....");
            return nil;
        }
            break;
    }
    
    return [replace base64Decode];
//    NSData * data = [[NSData alloc] initWithBase64EncodedString:replace options:NSDataBase64DecodingIgnoreUnknownCharacters];
//    NSString * decodeStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    
//    return decodeStr;
}

- (CGFloat)heightWithFont:(UIFont *)font size:(CGSize)size
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName : font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGFloat height = ceilf([self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size.height);
    
    return height + 2;
}

- (CGFloat)widthWithFont:(UIFont *)font size:(CGSize)size
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    NSDictionary * attributes = @{NSFontAttributeName : font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGFloat width = ceilf([self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size.width);
    return width + 2;
}

- (NSString *)trimZeroPoint
{
    if ([self hasSuffix:@".00"]) {
        return [self stringByReplacingOccurrencesOfString:@".00" withString:@""];
    }
    
    return self;
}

@end

