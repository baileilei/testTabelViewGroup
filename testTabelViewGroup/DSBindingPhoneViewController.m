//
//  DSBindingPhoneViewController.m
//  testTabelViewGroup
//
//  Created by baishangshang on 16/3/3.
//  Copyright © 2016年 dscm. All rights reserved.
//

#import "DSBindingPhoneViewController.h"
#import "MBProgressHUD+MJ.h"
#import "JKCountDownButton.h"

#import "AFNetworking.h"

#define BASE_URL sdljfakjfsalkf

@interface DSBindingPhoneViewController ()<UITextFieldDelegate>

@property (weak,nonatomic) UITextField *textField;

@property (weak,nonatomic) UITextField *VtextField;

@end

@implementation DSBindingPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"绑定手机号";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(save )];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    
    [self setupContent];
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

-(void)setupContent{
    UILabel *showPhoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 90, 170, 21)];
    showPhoneLabel.text = @"请输入手机号码";
//    showPhoneLabel.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:showPhoneLabel];
    showPhoneLabel.textColor= [UIColor darkGrayColor];
    
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 130, self.view.frame.size.width-120, 30)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @" 请输入手机号";
    textField.font = [UIFont systemFontOfSize:14];
    textField.contentMode = UIViewContentModeCenter;
    
//        textField.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:textField];
    textField.delegate = self;
    
    JKCountDownButton *vefyBtn = [JKCountDownButton buttonWithType:UIButtonTypeCustom];
    vefyBtn.frame = CGRectMake(CGRectGetMaxX(textField.frame) + 10, CGRectGetMinY(textField.frame), 90, 30);
    vefyBtn.backgroundColor = [UIColor colorWithRed:168/255.0 green:200/255.0 blue:62/255.0 alpha:1.0];
    [vefyBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [vefyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    vefyBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [vefyBtn addTarget:self action:@selector(vefy) forControlEvents:UIControlEventTouchUpInside];
    vefyBtn.layer.cornerRadius = 5;
    vefyBtn.clipsToBounds = YES;
    [self.view addSubview:vefyBtn];
    
    [vefyBtn addToucheHandler:^(JKCountDownButton *countDownButton, NSInteger tag) {
        countDownButton.enabled = NO;
        
        [countDownButton startWithSecond:60];
        
        [countDownButton didChange:^NSString *(JKCountDownButton *countDownButton,int second) {
            NSString *title = [NSString stringWithFormat:@"剩余%d秒",second];
            return title;
        }];
        [countDownButton didFinished:^NSString *(JKCountDownButton *countDownButton, int second) {
            countDownButton.enabled = YES;
            return @"点击重新获取";
            
        }];
    }];
    
    
    UILabel *showVefyLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, 170, 21)];
    showVefyLabel.text = @"请输入验证码";
    showVefyLabel.textColor = [UIColor darkGrayColor];
    //    showPhoneLabel.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:showVefyLabel];
    
    
    UITextField *VtextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 230, self.view.frame.size.width-20, 30)];
    VtextField.borderStyle = UITextBorderStyleRoundedRect;
    VtextField.placeholder = @" 请输入验证码";
    VtextField.font = [UIFont systemFontOfSize:14];
    VtextField.contentMode = UIViewContentModeCenter;
    //        textField.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:VtextField];
    VtextField.delegate = self;
    self.VtextField = VtextField;
    
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmBtn.frame = CGRectMake(10, CGRectGetMaxY(VtextField.frame)+20, self.view.frame.size.width -20, 30);
    confirmBtn.backgroundColor = [UIColor colorWithRed:168/255.0 green:200/255.0 blue:62/255.0 alpha:1.0];
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    confirmBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [confirmBtn addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];
    confirmBtn.layer.cornerRadius = 5;
    confirmBtn.clipsToBounds = YES;
    [self.view addSubview:confirmBtn];
   
    
}


-(void)confirm{
    NSLog(@"点击了确定按钮");
    
    NSString *phone =self.textField.text;
    NSString *sms = self.VtextField.text;
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    NSString *tkn = [[NSUserDefaults standardUserDefaults] valueForKey:@"tkn"];
    [mgr.requestSerializer setValue:tkn forHTTPHeaderField:@"Authorization"];
    [mgr.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"mobile"] = phone;
    params[@"SMSCode"] = sms;
    
    NSString *url = [NSString stringWithFormat:@"%@/ysmjservice/user/changeMobile",@1];
    
    [mgr POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"请求成功----%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败%@",error);
    }];
    
    
    
}

-(void)vefy{
    NSLog(@"点击了获取验证码按钮");
}

@end
