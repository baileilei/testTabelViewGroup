//
//  ViewController.m
//  testTabelViewGroup
//
//  Created by baishangshang on 16/2/26.
//  Copyright © 2016年 dscm. All rights reserved.
//

#define ScreenW 375

#define centerY center.y

#import "ViewController.h"
#import "TSMyBtn.h"
#import "AFNetworking.h"
#import "DSSettingViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak,nonatomic) UITableView *tableview;


@end

@implementation ViewController



//创建顶部视图
-(void)createTopView
{
    UIView *top = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 180)];
//    self.topView = top;
    top.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:top];
    //背景图片
    UIImageView *iv = [[UIImageView alloc] initWithFrame:top.frame];
    iv.image = [UIImage imageNamed:@"my_pic"];
    [top addSubview:iv];
    
    //添加头像背景
    UIImageView *headerBack = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
   
    headerBack.center = CGPointMake(ScreenW/2, 130);
//    headerBack.center.y = 70;
//    headerBack.center.x = ScreenW/2;
    headerBack.image = [UIImage imageNamed:@"ic_wo_touxiang_bg"];
    [top addSubview:headerBack];
    
    //添加头像
    UIImageView *header = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
//    header.centerY = 70;
//    header.centerX = ScreenW/2;
    header.center =CGPointMake(ScreenW/2, 130);
    header.image = [UIImage imageNamed:@"ic_mrtx"];
    [top addSubview:header];
    
    //添加昵称
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 20)];
    [top addSubview:name];
    name.text = @"白雪公主";
    name.textAlignment = NSTextAlignmentCenter;
    name.font = [UIFont boldSystemFontOfSize:13];
    name.textColor = [UIColor whiteColor];
    name.center = CGPointMake(self.view.frame.size.width * 0.5, 170);
//    name.centerX = ScreenW/2;
//    name.centerY = 140;
    
    //添加关注数(demo已删除？)
    //    UILabel *guanzhu = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 10)];
    //    guanzhu.textAlignment = NSTextAlignmentCenter;
    //    guanzhu.text = @"关注：1";
    //    guanzhu.centerY = 160;
    //    guanzhu.centerX = ScreenW/2;
    //    guanzhu.font = [UIFont boldSystemFontOfSize:11];
    //    guanzhu.textColor = [UIColor whiteColor];
    //    [top addSubview:guanzhu];
    
    
    //添加设置按钮
    UIButton *setBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    setBtn.frame = CGRectMake(ScreenW-30, 30, 20, 20);
    [setBtn setBackgroundImage:[UIImage imageNamed:@"ic_wo_sz"] forState:0];
    [top addSubview:setBtn];
    [setBtn addTarget:self action:@selector(setClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)setClick{
    NSLog(@"点击了设置");
    
    DSSettingViewController *setting = [[DSSettingViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:setting];
    
//    [self.navigationController pushViewController:setting animated:YES];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}


- (void)viewDidLoad {
    
    NSLog(@"i like to do somthing to test haha");
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//    tableView.backgroundColor = [UIColor orangeColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    tableView.sectionFooterHeight = 10;
    tableView.sectionHeaderHeight =0;
    
    tableView.contentInset = UIEdgeInsetsMake(160, 0, 0, 0);
    tableView.scrollEnabled = NO;
    tableView.separatorInset = UIEdgeInsetsZero;
    self.tableview = tableView;
    
    
    [self createTopView];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
//    return self.testGroups.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
//    return self.testGroups[section].count;
//    NSArray *subArray = self.testGroups[section];
//    return subArray.count;
    
    if (section == 1) {
        return 3;
    }else{
        return 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"test";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.textLabel.font = [UIFont systemFontOfSize: 12];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = @"你大爷";

    
    NSArray *nameArr = @[@"收藏",@"我的足迹"];

    if (indexPath.section == 0 &&indexPath.row == 0) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        //添加俩个自定义按钮
        cell.textLabel.text = @"";
        for (int i = 0; i < nameArr.count; i++) {
            TSMyBtn *myBtn = [[TSMyBtn alloc] init];
            
            CGFloat myBtnY = 0;
            CGFloat myBtnW = self.view.frame.size.width * 0.5;
            CGFloat myBtnH = 44;
            CGFloat myBtnX = i * myBtnW;
            myBtn.frame = CGRectMake(myBtnX, myBtnY, myBtnW, myBtnH);
            
            [myBtn setTitle:nameArr[i] forState:UIControlStateNormal];
            [myBtn setImage:[UIImage imageNamed:nameArr[i]] forState:UIControlStateNormal];
            [cell.contentView addSubview:myBtn];
            [myBtn addTarget:self action:@selector(myBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            UIView *divider = [[UIView alloc] initWithFrame:CGRectMake(myBtnW, 10, 1, 24)];
            divider.backgroundColor = [UIColor lightGrayColor];
            [cell.contentView addSubview:divider];
        }

    }else if(indexPath.section == 1){
        NSArray *myArray = @[@"我的消息",@"我的订单",@"我的地址",@"我关注的供应商",@"客服"];
        cell.textLabel.text = myArray[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize: 12];
        
        cell.imageView.image = [UIImage imageNamed:myArray[indexPath.row]];
        
    }else if (indexPath.section == 2){
        cell.textLabel.text =@"我关注的供应商";
        cell.imageView.image = [UIImage imageNamed:@"我关注的供应商"];
    }else if (indexPath.section == 3){
        cell.textLabel.text =@"客服  400-032-3320";
        cell.textLabel.textColor = [UIColor orangeColor];
//        cell.imageView.image = [UIImage imageNamed:@"客服"];
        
    }
    
    
    
    return cell;
}
-(void)myBtnClick:(UIButton *)btn{
    NSLog(@"点击了btn");
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableview deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 3) {
        NSURL *url=[NSURL URLWithString:@"TEL://10010"];
        [[UIApplication sharedApplication] openURL:url];
    }
    
    NSLog(@"daye");
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 49;
    }else{
        return 40;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
