//
//  DLMainTabBarViewController.m
//  DLCommercialPro
//
//  Created by DalinXie on 17/1/23.
//  Copyright © 2017年 itdarlin. All rights reserved.
//

#import "DLMainTabBarViewController.h"
#import "DLMainNavViewController.h"

@interface DLMainTabBarViewController ()

@property (nonatomic, strong) NSArray * childArray;

@end

@implementation DLMainTabBarViewController

- (NSArray *)childArray{
    if(!_childArray){
        _childArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"SXTTabBarViewController" ofType:@"plist"]];
//        _childArray = @[@"DLTimeViewController",@"DLClassViewController",@"DLBuyViewController",@"DLMineViewController"];
    }
    return _childArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
    [self addChildVC];
}
- (void)setupUI{
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:56.0/255.0 green:165.0/255.0 blue:241.0/255.0 alpha:1]} forState:UIControlStateSelected];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:132.0/255.0 green:132.0/255.0 blue:132.0/255.0 alpha:1]} forState:UIControlStateNormal];
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_back"]];
    
}
- (void)addChildVC{
    
    for (NSDictionary * item in self.childArray) {
        Class classVc = NSClassFromString(item[@"viewController"]);
        UIViewController * vc = [[classVc alloc] init];
        vc.tabBarItem.image = [UIImage imageNamed:item[@"image"]];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:item[@"selectImage"]];
        vc.title = item[@"title"];
        DLMainNavViewController * nav = [[DLMainNavViewController alloc] initWithRootViewController:vc];
        [self addChildViewController:nav];
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
