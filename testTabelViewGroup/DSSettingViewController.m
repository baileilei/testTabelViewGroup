//
//  DSSettingViewController.m
//  testTabelViewGroup
//
//  Created by baishangshang on 16/3/3.
//  Copyright © 2016年 dscm. All rights reserved.
//

#define ScreenW self.view.frame.size.width

#import "DSSettingViewController.h"
#import "DSBindingPhoneViewController.h"
#import "UMSocial.h"
#import "DSAboutUsViewController.h"

@interface DSSettingViewController ()<UITableViewDataSource,UITableViewDelegate,UMSocialUIDelegate,UIActionSheetDelegate>

@property (weak,nonatomic) UITableView *tableview;

@property (nonatomic,strong) NSArray *testGroups;


@end

@implementation DSSettingViewController

-(NSArray *)testGroups{
    if (_testGroups == nil) {
        _testGroups = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"testGroup.plist" ofType:nil]];
    }
    return _testGroups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置导航栏
    [self setupNav];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    
    //添加tableview
    [self setupTableView];
}

-(void)setupNav{
    self.navigationItem.title = @"设置";
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    UIBarButtonItem *bar = [UIBarButtonItem appearance];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName]= [UIColor darkGrayColor];
    attrs[NSFontAttributeName]= [UIFont systemFontOfSize:12];
    [bar setTitleTextAttributes:attrs forState:UIControlStateNormal];
    
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setTitleTextAttributes:attrs];
    [navBar setTintColor:[UIColor darkGrayColor]];
}

- (void)back {
//    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)setupTableView{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //    tableView.backgroundColor = [UIColor orangeColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    tableView.sectionFooterHeight = 10;
    tableView.sectionHeaderHeight =0;
    
    tableView.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);
    tableView.scrollEnabled = NO;
    tableView.separatorInset = UIEdgeInsetsZero;
    self.tableview = tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 3;
    return self.testGroups.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *subArray = self.testGroups[section];
    return subArray.count;
    
//    if (section == 2) {
//        return 1;
//    }else{
//        return 4;
//    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"setting";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.textLabel.font = [UIFont systemFontOfSize: 12];
        cell.textLabel.textColor = [UIColor darkGrayColor];
    }
   
    
    NSLog(@"%@",self.testGroups);

    cell.textLabel.text = self.testGroups[indexPath.section][indexPath.row];
    cell.imageView.image = [UIImage imageNamed:cell.textLabel.text];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    
    if (indexPath.section == 2){
        cell.textLabel.text = nil;
        cell.accessoryType = UITableViewCellAccessoryNone;
        //退出登录按钮！！！
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, self.view.frame.size.width, 20)];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [btn setTitle:@"退出登录" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
        [cell.contentView addSubview:btn];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.titleLabel.center =CGPointMake(ScreenW/2,0);
        [btn addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    }

    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"%ld",(long)indexPath.row);
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        DSAboutUsViewController *aboutUs = [[DSAboutUsViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:aboutUs];
        
        [self presentViewController:nav animated:YES completion:nil];
    }
    
    if (indexPath.section == 0 && indexPath.row == 1) {
        DSBindingPhoneViewController *binding = [[DSBindingPhoneViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:binding];
        
        [self.navigationController pushViewController:binding animated:YES];
    }
    
    if (indexPath.section == 1 && indexPath.row == 1) {
//        [UMSocialSnsService presentSnsIconSheetView:self appKey:nil shareText:@"" shareImage:[UIImage imageNamed:@""] shareToSnsNames:@[UMShareToWechatFavorite,UMShareToQQ,UMShareToSina] delegate:self];
        [UMSocialSnsService presentSnsIconSheetView:self
                                             appKey:nil
                                          shareText:@"友盟社会化分享让您快速实现分享等社会化功能，www.umeng.com/social"
                                         shareImage:[UIImage imageNamed:@"icon.png"]
                                    shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToWechatFavorite,UMShareToSina,UMShareToQQ,UMShareToQzone]
                                           delegate:self];
    }
}

-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}

-(void)logout{
    NSLog(@"点击了退出登录");
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"提示" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles: nil];
    sheet.delegate = self;
    [sheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        NSLog(@"取消");
    }else{
        NSLog(@"确定");
//        DSLoginViewController *login = [[DSLoginViewController alloc] init];
//        [self presentViewController:login animated:YES completion:^{
//            
//        }];
        
    }
    
}



@end
