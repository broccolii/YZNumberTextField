//
//  YZInputViewFormatHelper.h
//  YZTextField
//
//  Created by Broccoli on 2017/6/16.
//  Copyright © 2017年 broccoliii. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, YZInputViewFormat) {
    YZInputViewFormatUnlimited,
    YZInputViewFormatNumber,
    YZInputViewFormatMoney,
    YZInputViewFormatDiscount
};

@interface YZInputViewFormatHelper : NSObject

+ (BOOL)originalString:(NSString *)originalString appendString:(NSString *)string limitMode:(YZInputViewFormat)limitMode;
+ (BOOL)originalString:(NSString *)originalString shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string limitMode:(YZInputViewFormat)limitMode;

+ (BOOL)checkNumberFormatString:(NSString *)string;
+ (BOOL)checkMoneyFormatString:(NSString *)string;
+ (BOOL)checkDiscountFormatString:(NSString *)string;

@end
