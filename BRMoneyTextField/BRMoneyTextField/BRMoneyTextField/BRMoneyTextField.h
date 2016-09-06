//
//  BRTextField.h
//  MoneyTextField
//
//  Created by Broccoli on 16/9/6.
//  Copyright © 2016年 youzan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BRMoneyTextField;

@protocol BRMoneyTextFieldDelegate <NSObject>

@optional

// return NO to disallow editing.
- (BOOL)br_textFieldShouldBeginEditing:(nonnull BRMoneyTextField *)textField;

// became first responder
- (void)br_textFieldDidBeginEditing:(nonnull BRMoneyTextField *)textField;

// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (BOOL)br_textFieldShouldEndEditing:(nonnull BRMoneyTextField *)textField;

// may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
- (void)br_textFieldDidEndEditing:(nonnull BRMoneyTextField *)textField;

// return NO to not change text
- (BOOL)br_textField:(nonnull BRMoneyTextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(nonnull NSString *)string;

// called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)br_textFieldShouldClear:(nonnull BRMoneyTextField *)textField;

// called when 'return' key pressed. return NO to ignore.
- (BOOL)br_textFieldShouldReturn:(nonnull BRMoneyTextField *)textField;

// called when textField double value overtop max value
- (void)br_textFieldOvertopMaxValue:(nonnull BRMoneyTextField *)textField;

@end

@interface BRMoneyTextField : UITextField

// replace UITextField's delegate
@property (nullable, nonatomic, weak) id<BRMoneyTextFieldDelegate> br_delegate;

// defalue value is CGFLOAT_MAX
@property (nonatomic, assign) IBInspectable double maxValue;

// enable two decimal places, defalue value is YES
@property (nonatomic, assign) IBInspectable BOOL enableTwoDecimalPlaces;

@end
