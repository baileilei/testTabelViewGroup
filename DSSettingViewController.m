//
//  DSSettingViewController.m
//  YSMeiJia
//
//  Created by DSYX on 15/11/3.
//  Copyright © 2015年 DSYX. All rights reserved.
//

#import "DSSettingViewController.h"
#import "DSLoginViewController.h"

@interface DSSettingViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,UIActionSheetDelegate>

@property (nonatomic, strong) UITableView *tableView;


@end

@implementation DSSettingViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];

    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = @"设置";
    
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_zhixiang_zuo"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = leftItem;

    //创建tableview
    [self setupTableView];
}

-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 创建tableview
-(void)setupTableView
{
    UITableView * tableView = [[UITableView alloc]init];
    _tableView = tableView;
    tableView.frame = self.view.frame;
    tableView.delegate = self;
    tableView.dataSource =self;
    tableView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    [self.view addSubview:tableView];
}

#pragma mark - TableView data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return 1;
    }
    return 2;
}
//设置cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
//组头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        return 20;
    }
    return 5;
}
//设置cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    if (indexPath.section == 0&&indexPath.row==0) {
        UIImageView * iv = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 20, 20)];
        iv.image = [UIImage imageNamed:@"ic_wo_xtsc"];
        [cell.contentView addSubview:iv];
        
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(maxX(iv)+10, 10, 300, 20)];

        label.font = [UIFont systemFontOfSize:15];
        label.text = @"系统设置";
        [cell.contentView addSubview:label];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    else if (indexPath.section == 0 && indexPath.row==1){
        UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 20, 20)];
        iv.image = [UIImage imageNamed:@"ic_wo_bdsj"];
        [cell.contentView addSubview:iv];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(maxX(iv)+10, 10, 300, 20)];
        label.font = [UIFont systemFontOfSize:15];
        label.text = @"绑定手机号";
        [cell.contentView addSubview:label];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    else if (indexPath.section == 1 && indexPath.row==0){
        UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 20, 20)];
        iv.image = [UIImage imageNamed:@"ic_wo_gywm"];
        [cell.contentView addSubview:iv];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(maxX(iv)+10, 10, 300, 20)];
        label.font = [UIFont systemFontOfSize:15];
        label.text = @"关于我们";
        [cell.contentView addSubview:label];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    else if (indexPath.section == 1 && indexPath.row==1){
        UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 20, 20)];
        iv.image = [UIImage imageNamed:@"ic_wo_tjhy"];
        [cell.contentView addSubview:iv];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(maxX(iv)+10, 10, 300, 20)];
        label.font = [UIFont systemFontOfSize:15];
        label.text = @"推荐好友";
        [cell.contentView addSubview:label];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    else if (indexPath.section == 2){
                
        //退出登录按钮！！！
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, self.view.frame.size.width, 20)];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
    
        [btn setTitle:@"退出登录" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
        [cell.contentView addSubview:btn];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.titleLabel.centerX = ScreenW/2;
        [btn addTarget:self action:@selector(logOut) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return cell;
}

-(void)logOut{
    NSLog(@"退出登录");
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"提示" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles: nil];
    sheet.delegate = self;
    [sheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        NSLog(@"取消");
    }else{
        NSLog(@"确定");
        DSLoginViewController *login = [[DSLoginViewController alloc] init];
        [self presentViewController:login animated:YES completion:^{
            
        }];
        
    }

}




//选中cell触发的事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
