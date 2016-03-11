//
//  TwoViewController.m
//  NavControllers
//
//  Created by Vols on 16/3/10.
//  Copyright © 2016年 Vols. All rights reserved.
//

#import "TwoViewController.h"

#import "VNavigationController.h"
#import "DemoViewController.h"


@interface TwoViewController ()

@property (nonatomic, strong) UIButton * popButton;


@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    DemoViewController *firstVC = [[DemoViewController alloc] init];
    //    UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    //    firstVC.title = @"First";
    //    firstVC.tabBarItem = firstItem;
    VNavigationController *firstNav = [[VNavigationController alloc] initWithRootViewController:firstVC];
    firstNav.tabBarItem.title = @"测试";
    //    self.viewControllers = @[firstNav];
    //    self.tabBarController.tabBar.translucent = YES;
    
    
    
    DemoViewController *secVC = [[DemoViewController alloc] init];
    UITabBarItem *secItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    secVC.title = @"First";
    secVC.tabBarItem = secItem;
    VNavigationController *secNav = [[VNavigationController alloc] initWithRootViewController:secVC];
    secNav.tabBarItem.title = @"测试1";
    self.viewControllers = @[firstNav,secNav];
    self.tabBarController.tabBar.translucent = YES;
    
    
    [self.view addSubview:self.popButton];
}


- (UIButton *)popButton{
    if (!_popButton) {
        _popButton= [UIButton buttonWithType:UIButtonTypeCustom];
        _popButton.frame = CGRectMake(0, 0, 80, 40);
        _popButton.center = (CGPoint){self.view.center.x, self.view.center.y+40};
        _popButton.backgroundColor = [UIColor orangeColor];
        [_popButton setTitle:@"POP" forState:UIControlStateNormal];
        _popButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        _popButton.titleLabel.textColor = [UIColor whiteColor];
        _popButton.layer.cornerRadius = 5.0;
        [_popButton setTitleColor:[UIColor brownColor] forState:UIControlStateHighlighted];
        [_popButton addTarget:self action:@selector(popAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _popButton;
}

- (void)popAction:(UIButton *)button{
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
