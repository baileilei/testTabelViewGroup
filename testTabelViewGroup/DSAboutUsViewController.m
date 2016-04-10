//
//  DSAboutUsViewController.m
//  testTabelViewGroup
//
//  Created by baishangshang on 16/3/3.
//  Copyright © 2016年 dscm. All rights reserved.
//

#import "DSAboutUsViewController.h"
#import "Masonry.h"
#import "DSWelComeViewController.h"

@interface DSAboutUsViewController ()

@end

@implementation DSAboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.9];
    
    self.title = @"关于我们";
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed: @"ic_zhixiang_zuo" ]style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    [self setupContent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)setupContent{
    UIImageView *imageView = [[UIImageView alloc] init];
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    imageView.center = CGPointMake(self.view.center.x, 200);
    imageView.image = [UIImage imageNamed:@"优盛-美家"];
//    imageView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:imageView];
    
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.height.width.mas_equalTo(@100);
        make.top.mas_equalTo(self.view).offset(150);
    }];
    
    
    UILabel *versionLabel = [[UILabel alloc] init];
    versionLabel.text = @"当前版本 1.0";
    versionLabel.frame = CGRectMake(100, 260, 100, 21);
    versionLabel.textColor = [UIColor darkGrayColor];
    versionLabel.textAlignment = NSTextAlignmentCenter;
//    testLabel.backgroundColor = [UIColor orangeColor];
    versionLabel.font = [UIFont systemFontOfSize:14];
//    testLabel.contentMode = UIViewContentModeCenter;
    versionLabel.center = CGPointMake(self.view.center.x, 270);
    [self.view addSubview:versionLabel];
    
    
    [versionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(imageView);
        make.height.equalTo(@21);
//        make.top.equalTo(imageView).bottom.offset(10);
        make.top.mas_equalTo(imageView.mas_bottom).offset(10);//！！！！！ 很重要
    }];
    
    
    
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 44)];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 11, 160, 21)];
    [whiteView addSubview:label];
    label.text = @"欢迎页";
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor lightGrayColor];
    [whiteView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(welcome)]];

    
}

-(void)welcome{
    NSLog(@"欢迎页");
    
    DSWelComeViewController *welCome = [[DSWelComeViewController alloc] init];
    [self presentViewController:welCome animated:YES completion:nil];
}

@end
