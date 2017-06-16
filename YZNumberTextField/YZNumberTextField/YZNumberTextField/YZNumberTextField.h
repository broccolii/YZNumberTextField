//
//  YZTextField.h
//  YZTextField
//
//  Created by Broccoli on 2017/6/16.
//  Copyright © 2017年 broccoliii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZInputViewFormatHelper.h"

@protocol YZTextFieldDelegate;
@interface YZNumberTextField : UITextField

@property (nonatomic, assign) YZInputViewFormat inputViewFormat;
@property (nonatomic, weak) id<YZTextFieldDelegate> yz_delegate;

@property (nonatomic, assign) BOOL isToZero;

@end


@protocol YZTextFieldDelegate <NSObject>

@optional
- (BOOL)yz_textFieldShouldBeginEditing:(UITextField *)textField;        // return NO to disallow editing.
- (void)yz_textFieldDidBeginEditing:(UITextField *)textField;           // became first responder
- (BOOL)yz_textFieldShouldEndEditing:(UITextField *)textField;          // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (void)yz_textFieldDidEndEditing:(UITextField *)textField;             // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
- (void)yz_textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason NS_AVAILABLE_IOS(10_0); // if implemented, called in place of textFieldDidEndEditing:

- (BOOL)yz_textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;   // return NO to not change text

- (BOOL)yz_textFieldShouldClear:(UITextField *)textField;               // called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)yz_textFieldShouldReturn:(UITextField *)textField;

@end
