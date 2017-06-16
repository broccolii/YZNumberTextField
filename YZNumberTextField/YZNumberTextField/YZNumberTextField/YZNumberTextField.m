//
//  YZTextField.m
//  YZTextField
//
//  Created by Broccoli on 2017/6/16.
//  Copyright © 2017年 broccoliii. All rights reserved.
//

#import "YZNumberTextField.h"

@interface YZNumberTextField ()<UITextFieldDelegate>

@end

@implementation YZNumberTextField

#pragma mark - Initialize
- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    [self commonInit];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    [self commonInit];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (!self) {
        return nil;
    }
    [self commonInit];
    return self;
}

- (void)commonInit {
    super.delegate = self;
    self.inputViewFormat = YZInputViewFormatNumber;
    self.keyboardType = UIKeyboardTypeDecimalPad;
}

#pragma mark - Override
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if ([UIMenuController sharedMenuController]) {
        [UIMenuController sharedMenuController].menuVisible = NO;
    }
    return NO;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if ([self.yz_delegate respondsToSelector:@selector(yz_textFieldShouldBeginEditing:)]) {
        return [self.yz_delegate yz_textFieldShouldBeginEditing:textField];
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if ([self.yz_delegate respondsToSelector:@selector(yz_textFieldDidBeginEditing:)]) {
        return [self.yz_delegate yz_textFieldDidBeginEditing:textField];
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if ([self.yz_delegate respondsToSelector:@selector(yz_textFieldShouldEndEditing:)]) {
        return [self.yz_delegate yz_textFieldShouldEndEditing:textField];
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([self.yz_delegate respondsToSelector:@selector(yz_textFieldDidEndEditing:)]) {
        return [self.yz_delegate yz_textFieldDidEndEditing:textField];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason {
    if ([self.yz_delegate respondsToSelector:@selector(yz_textFieldDidEndEditing:reason:)]) {
        return [self.yz_delegate yz_textFieldDidEndEditing:textField reason:reason];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    // 没有默认值时 第一位输入 @"."
    if (textField.text.length == 0 && [string isEqualToString:@"."]) {
        textField.text = @"0.";
        return NO;
    }
    // 第一个 字符是 零 同时 光标不在第一位
    if ([textField.text isEqualToString:@"0"] && range.location != 0) {
        if ([string isEqualToString:@"."]) {
            string = @"0.";
        }
        textField.text = string;
        return NO;
    }
    
    // 只有一位数字时 点击了删除 重置为零
    if (self.isToZero) {
        if (textField.text.length == 1 && [string length] == 0 && range.length > 0) {
            textField.text = @"0";
            return NO;
        }
    }
   
    if (![YZInputViewFormatHelper originalString:textField.text shouldChangeCharactersInRange:range replacementString:string limitMode:self.inputViewFormat]) {
        return NO;
    }
    
    if ([self.yz_delegate respondsToSelector:@selector(yz_textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [self.yz_delegate yz_textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    
    if (self.isToZero) {
        self.text = @"0";
    }
    
    if ([self.yz_delegate respondsToSelector:@selector(yz_textFieldShouldClear:)]) {
        return [self.yz_delegate yz_textFieldShouldClear:textField];
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([self.yz_delegate respondsToSelector:@selector(yz_textFieldShouldReturn:)]) {
        return [self.yz_delegate yz_textFieldShouldReturn:textField];
    }
    return YES;
}

#pragma mark - setter
- (void)setDelegate:(id<UITextFieldDelegate>)delegate {
    NSAssert(delegate == nil, @"You should use YZTextFieldDelegate");
}

- (void)setIsToZero:(BOOL)isToZero {
    _isToZero = isToZero;
    if (isToZero) {
        self.text = @"0";
    }
}

@end
