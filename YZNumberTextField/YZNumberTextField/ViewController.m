//
//  ViewController.m
//  YZNumberTextField
//
//  Created by Broccoli on 2017/6/16.
//  Copyright © 2017年 broccoliii. All rights reserved.
//

#import "ViewController.h"
#import "YZNumberTextField.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    YZNumberTextField *textField = [[YZNumberTextField alloc] initWithFrame:CGRectMake(30, 100, 200, 40)];
    textField.layer.borderColor = [UIColor grayColor].CGColor;
    textField.layer.borderWidth = 2.0;
    
    [self.view addSubview:textField];
}

@end
