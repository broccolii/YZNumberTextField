# YZNumberTextField
YZNumberTextField to limit the number of amounts entered.

#### feature:
* The first can't input ".", replace "0."
* The first can't input "00."
* Can't input ".."
* Max value, default value is CGFLoat_MAX
* enable two decimal places

#### delegate 
replace `UITextFieldDelegate` to `YZTextFieldDelegate`

```
// return NO to disallow editing.
- (BOOL)yz_textFieldShouldBeginEditing:(nonnull BRMoneyTextField *)textField;

// became first responder
- (void)yz_textFieldDidBeginEditing:(nonnull BRMoneyTextField *)textField;

// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (BOOL)yz_textFieldShouldEndEditing:(nonnull BRMoneyTextField *)textField;

// may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
- (void)yz_textFieldDidEndEditing:(nonnull BRMoneyTextField *)textField;

// return NO to not change text
- (BOOL)yz_textField:(nonnull BRMoneyTextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(nonnull NSString *)string;

// called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)yz_textFieldShouldClear:(nonnull BRMoneyTextField *)textField;

// called when 'return' key pressed. return NO to ignore.
- (BOOL)yz_textFieldShouldReturn:(nonnull BRMoneyTextField *)textField;
```

add a new delegate method

```
// called when textField double value overtop max value
- (void)yz_textFieldOvertopMaxValue:(nonnull BRMoneyTextField *)textField;
```

## License

YZNumberTextField is released under the Apache 2.0 license. See LICENSE for details.


