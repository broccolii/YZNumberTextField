//
//  YZInputViewFormatHelper.m
//  YZTextField
//
//  Created by Broccoli on 2017/6/16.
//  Copyright © 2017年 broccoliii. All rights reserved.
//

#import "YZInputViewFormatHelper.h"

@implementation YZInputViewFormatHelper

+ (BOOL)originalString:(NSString *)originalString appendString:(NSString *)string limitMode:(YZInputViewFormat)limitMode {
   return [YZInputViewFormatHelper originalString:originalString shouldChangeCharactersInRange:NSMakeRange(string.length, 0) replacementString:string limitMode:limitMode];
}

+ (BOOL)originalString:(NSString *)originalString shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string limitMode:(YZInputViewFormat)limitMode {
    NSString *finalString = [originalString stringByReplacingCharactersInRange:range withString:string];
    switch (limitMode) {
        case YZInputViewFormatUnlimited:
            return YES;
        case YZInputViewFormatNumber:
            return [YZInputViewFormatHelper checkNumberFormatString:finalString];
        case YZInputViewFormatMoney:
            return [YZInputViewFormatHelper checkMoneyFormatString:finalString];
        case YZInputViewFormatDiscount:
            return [YZInputViewFormatHelper checkDiscountFormatString:finalString];
        default:
            break;
    }
    return YES;
}

+ (BOOL)checkNumberFormatString:(NSString *)string {
    // 没有小数点
    if ([string rangeOfString:@"."].location == NSNotFound) {
        // 0 开头
        if ([string hasPrefix:@"0"] && string.length > 1) {
            return NO;
        }
    }
    // 有小数点
    else {
        // 多个小数点
        if ([string componentsSeparatedByString:@"."].count != 2) {
            return NO;
        }
        
        // @"." 在第一位
        if ([string rangeOfString:@"."].location == 0) {
            return NO;
        }
        
        NSString *prefixString = [string componentsSeparatedByString:@"."][0];
        
        // 0 开头
        if ([prefixString hasPrefix:@"0"] && prefixString.length > 1) {
            return NO;
        }
    }
    return YES;
}

+ (BOOL)checkMoneyFormatString:(NSString *)string {
   // 没有小数点
    if ([string rangeOfString:@"."].location == NSNotFound) {
        // 0 开头
        if ([string hasPrefix:@"0"] && string.length > 1) {
            return NO;
        }
    }
   // 有小数点
    else {
        // 多个小数点
        if ([string componentsSeparatedByString:@"."].count != 2) {
           return NO;
        }
        
        // @"." 在第一位
        if ([string rangeOfString:@"."].location == 0) {
            return NO;
        }
        
        NSString *prefixString = [string componentsSeparatedByString:@"."][0];
        NSString *suffixString = [string componentsSeparatedByString:@"."][1];
        
        // 0 开头
        if ([prefixString hasPrefix:@"0"] && prefixString.length > 1) {
            return NO;
        }
        
        // 小数点后两位
        if (suffixString.length > 2) {
            return NO;
        }
    }
    return YES;
}

// 0 < discountValue < 10
+ (BOOL)checkDiscountFormatString:(NSString *)string {
    // 没有小数点
    if ([string rangeOfString:@"."].location == NSNotFound) {
        // 整数部分只能有一位
        if (string.length > 1) {
            return NO;
        }
    }
    // 有小数点
    else {
        // 多个小数点
        if ([string componentsSeparatedByString:@"."].count != 2) {
            return NO;
        }
        
        // @"." 在第一位
        if ([string rangeOfString:@"."].location == 0) {
            return NO;
        }
        
        NSString *prefixString = [string componentsSeparatedByString:@"."][0];
        NSString *suffixString = [string componentsSeparatedByString:@"."][1];
        
        // 整数部分只能有一位
        if (prefixString.length > 1) {
            return NO;
        }
        
        // 小数点后一位
        if (suffixString.length > 1) {
            return NO;
        }
    }
    return YES;
}

@end
