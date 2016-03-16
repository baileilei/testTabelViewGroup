//
//  DSBindingPhoneViewController.m
//  testTabelViewGroup
//
//  Created by baishangshang on 16/3/3.
//  Copyright © 2016年 dscm. All rights reserved.
//

#import "DSBindingPhoneViewController.h"
#import "MBProgressHUD+MJ.h"

@interface DSBindingPhoneViewController ()<UITextFieldDelegate>

@property (weak,nonatomic) UITextField *textField;

@end

@implementation DSBindingPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"绑定手机号";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(save )];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 130, self.view.frame.size.width-20, 30)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"        请输入手机号";
    textField.contentMode = UIViewContentModeCenter;
//    textField.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:textField];
    textField.delegate = self;
}

-(void)save{
    //发送网络请求？？？
    NSString *text = self.textField.text;
    if (text.length != 11) {
        [MBProgressHUD showError:@"您输入的手机号位数不对"];
        return;
    }
    if (text.length == 11) {
        NSLog(@"phone number   %@",text);
        
        //发送为服务器 进行绑定
        NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        request.HTTPMethod = @"GET";
        
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
            NSLog(@"fale");
            if (data) {
                NSLog(@"data");
            }
        }];
        
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    textField.keyboardType=  UIKeyboardTypeNumberPad;
    self.textField = textField;
    NSLog(@"begin");
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"endEditing");
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"i am return");
    
    [self dismissViewControllerAnimated:YES completion:nil];
    return  YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
