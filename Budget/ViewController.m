//
//  ViewController.m
//  Budget
//
//  Created by Chris Jones on 3/15/15.
//  Copyright (c) 2015 Axis Medical Technologies. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated  {
    [super viewWillAppear:animated];
    [self showTextInput];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.wellsfargo.com"]]];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self submit:nil];
        return YES;
}

- (void)showTextInput {
    _textField.hidden = FALSE;
    _goBtn.hidden = FALSE;
    _valueLbl.hidden = TRUE;
        _resetBtn.hidden = TRUE;
    _textField.text = @"";
}

- (void)showCalc:(NSInteger)diff {
    _textField.hidden = TRUE;
        _goBtn.hidden = TRUE;
    _valueLbl.hidden = FALSE;
            _resetBtn.hidden = FALSE;
    _valueLbl.text = [NSString stringWithFormat:@"%ld", (long)diff];
    if (diff > 0) {
        _valueLbl.textColor = [UIColor greenColor];
    } else if (diff < 0) {
        _valueLbl.textColor = [UIColor redColor];
    } else {
        _valueLbl.textColor = [UIColor whiteColor];
    }
}

- (IBAction)touchUpInside:(id)sender {
    [self showTextInput];
}

- (IBAction)submit:(id)sender {
    NSInteger curBalance = [_textField.text integerValue];
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDate *now = [NSDate date];
    
    NSInteger day = [[[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:now] day];
    NSInteger daysInMonth = [cal rangeOfUnit:NSCalendarUnitDay
                                      inUnit:NSCalendarUnitMonth
                                     forDate:now].length;
    
    NSInteger spendPerDay = 100;
    NSInteger floor = 2000;
    
    NSInteger monthStart = floor + (daysInMonth * spendPerDay);
    NSInteger spent = (day - 1) * spendPerDay;
    NSInteger targetValue = monthStart - spent;
    
    NSInteger diff = curBalance - targetValue;
    [self showCalc:diff];
}

@end
