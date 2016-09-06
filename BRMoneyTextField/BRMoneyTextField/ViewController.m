//
//  ViewController.m
//  MoneyTextField
//
//  Created by Broccoli on 16/9/6.
//  Copyright © 2016年 youzan. All rights reserved.
//

#import "ViewController.h"
#import "BRMoneyTextField.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet BRMoneyTextField *moneyTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _moneyTextField.maxValue = 999.99;
    [_moneyTextField becomeFirstResponder];
}

@end
