# BRMoneyTextField
BRMoneyTextField to limit the number of amounts entered.

---

#### feature:
* The first can't input ".", replace "0."
* The first can't input "00."
* Can't input ".."
* Max value, default value is CGFLoat_MAX
* enable two decimal places

#### delegate 
replace `UITextFieldDelegate` to `BRTextFieldDelegate`

```
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
```

add a new delegate method

```
// called when textField double value overtop max value
- (void)br_textFieldOvertopMaxValue:(nonnull BRMoneyTextField *)textField;
```
---
## License

BRMoneyTextField is released under the Apache 2.0 license. See LICENSE for details.
