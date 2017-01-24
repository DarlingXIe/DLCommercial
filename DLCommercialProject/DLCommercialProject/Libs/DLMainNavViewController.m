//
//  DLMainNavViewController.m
//  DLCommercialPro
//
//  Created by DalinXie on 17/1/23.
//  Copyright © 2017年 itdarlin. All rights reserved.
//

#import "DLMainNavViewController.h"
@interface DLMainNavViewController ()

@end

@implementation DLMainNavViewController

+ (void)initialize{
    
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    [navBar setBackgroundImage:[UIImage imageNamed:@"nav_backImage"] forBarMetrics:(UIBarMetricsDefault)];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if(self.childViewControllers.count){
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 40, 40);
        [btn setBackgroundImage:[UIImage imageNamed:@"详情界面返回按钮"] forState:(UIControlStateNormal)];
        [btn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * barItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        viewController.navigationItem.leftBarButtonItem = barItem;
        
        viewController.hidesBottomBarWhenPushed = true;
    }
    [super pushViewController:viewController animated:true];
}
-(void)backAction{
    [self popViewControllerAnimated:true];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
