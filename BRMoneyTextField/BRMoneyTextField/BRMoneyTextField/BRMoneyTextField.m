//
//  BRTextField.m
//  MoneyTextField
//
//  Created by Broccoli on 16/9/6.
//  Copyright © 2016年 youzan. All rights reserved.
//

#import "BRMoneyTextField.h"

@interface BRMoneyTextField()<UITextFieldDelegate>

@end

@implementation BRMoneyTextField

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupTextField];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupTextField];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupTextField];
    }
    return self;
}

#pragma mark -- private method
- (void)setupTextField {
    self.delegate = self;
    self.keyboardType = UIKeyboardTypeDecimalPad;
}

#pragma mark -- UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if ([self.br_delegate respondsToSelector:@selector(br_textFieldShouldBeginEditing:)]) {
        return [self.br_delegate br_textFieldShouldBeginEditing:self];
    } else {
        return YES;
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([self.br_delegate respondsToSelector:@selector(br_textFieldDidBeginEditing:)]) {
        [self.br_delegate br_textFieldDidBeginEditing:self];
    } else {
        
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if ([self.br_delegate respondsToSelector:@selector(br_textFieldShouldEndEditing:)]) {
        return [self.br_delegate br_textFieldShouldEndEditing:self];
    } else {
        return YES;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if ([self.br_delegate respondsToSelector:@selector(br_textFieldDidEndEditing:)]) {
        [self.br_delegate br_textFieldDidEndEditing:self];
    } else {
        
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([self.br_delegate respondsToSelector:@selector(br_textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [self.br_delegate br_textField:self shouldChangeCharactersInRange:range replacementString:string];
    } else {
        NSString *seletedString = [textField.text substringWithRange:range];
        // 第一位不能输入 "."
        if ((range.location == 0 || [textField.text isEqualToString:@""]) && [string isEqualToString:@"."]) {
            textField.text = @"0.";
            return NO;
        }
        // 不能输入两个 "."
        if ([textField.text containsString:@"."] && [string containsString:@"."] && ![seletedString containsString:@"."]) {
            return NO;
        }
        
        // 不能输入 "00."
        if ((range.location == 0 || [textField.text isEqualToString:@""]) && [string containsString:@"0"]) {
            textField.text = @"0.";
            return NO;
        }
        
        // 最大值 /  小数点后保留两位
        // TODO:
        return YES;
    }
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    if ([self.br_delegate respondsToSelector:@selector(br_textFieldShouldClear:)]) {
        return [self.br_delegate br_textFieldShouldClear:self];
    } else {
        return YES;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ([self.br_delegate respondsToSelector:@selector(br_textFieldShouldReturn:)]) {
        return [self.br_delegate br_textFieldShouldReturn:self];
    } else {
        return YES;
    }
}

@end