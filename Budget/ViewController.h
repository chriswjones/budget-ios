//
//  ViewController.h
//  Budget
//
//  Created by Chris Jones on 3/15/15.
//  Copyright (c) 2015 Axis Medical Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UIWebView *webView;
@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, weak) IBOutlet UIButton *goBtn;
@property (nonatomic, weak) IBOutlet UILabel *valueLbl;
@property (nonatomic, weak) IBOutlet UIButton *resetBtn;

- (IBAction)touchUpInside:(id)sender;

@end

