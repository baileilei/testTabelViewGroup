//
//  DSWelComeViewController.m
//  testTabelViewGroup
//
//  Created by baishangshang on 16/3/30.
//  Copyright © 2016年 dscm. All rights reserved.
//

#import "DSWelComeViewController.h"
#import "Masonry.h"

@interface DSWelComeViewController ()

@end

@implementation DSWelComeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.9];
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.frame = self.view.bounds;
    scrollView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.view.frame.size.height);
//    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.left.right.mas_equalTo(scrollView);
//    }];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = self.view.bounds;
    imageView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:imageView];
//    imageView.image = [UIImage imageNamed:@"引导页1-0"];
    imageView.userInteractionEnabled = YES;
    
//    CGFloat imageViewW = self.view.frame.size.width;
//    CGFloat imageViewH = self.view.frame.size.height;
//    
//    
//    for (int i = 0; i < 3; i ++) {
//        
//        CGFloat imageViewY = 0;
//        CGFloat imageViewX = i * imageViewW;
//        NSString *name = [NSString stringWithFormat:@"引导页1-%d",i];
//        imageView.image = [UIImage imageNamed:name ];
//        
//        imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
//        [scrollView addSubview:imageView];
//    }
    
    // 0.一些固定的尺寸参数
    CGFloat imageW = self.view.frame.size.width;
    CGFloat imageH = self.view.frame.size.height;
    CGFloat imageY = 0;
    
    // 1.添加5张图片到scrollView中
    for (int i = 0; i<3; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        
        // 设置frame
        CGFloat imageX = i * imageW;
        imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
        
        // 设置图片
        NSString *name = [NSString stringWithFormat:@"引导页%d-0",i+1];
        imageView.image = [UIImage imageNamed:name];
        
        [scrollView addSubview:imageView];
    }

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
