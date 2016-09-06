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

- (BOOL)br_textFieldShouldBeginEditing:(nonnull BRMoneyTextField *)textField;        // return NO to disallow editing.
- (void)br_textFieldDidBeginEditing:(nonnull BRMoneyTextField *)textField;           // became first responder
- (BOOL)br_textFieldShouldEndEditing:(nonnull BRMoneyTextField *)textField;          // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (void)br_textFieldDidEndEditing:(nonnull BRMoneyTextField *)textField;             // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called

- (BOOL)br_textField:(nonnull BRMoneyTextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(nonnull NSString *)string;   // return NO to not change text

- (BOOL)br_textFieldShouldClear:(nonnull BRMoneyTextField *)textField;               // called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)br_textFieldShouldReturn:(nonnull BRMoneyTextField *)textField;              // called when 'return' key pressed. return NO to ignore.

@end

@interface BRMoneyTextField : UITextField

@property (nullable, nonatomic, weak) id<BRMoneyTextFieldDelegate> br_delegate;

@end
