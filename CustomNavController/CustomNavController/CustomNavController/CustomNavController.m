//
//  CustomNavController.m
//  CustomNavController
//
//  Created by Vols on 15/11/16.
//  Copyright © 2015年 Vols. All rights reserved.
//

#import "CustomNavController.h"
#import "CustomNavBar.h"

@interface CustomNavController ()

@end

@implementation CustomNavController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    CustomNavBar *navBar = [[CustomNavBar alloc] initWithFrame:CGRectMake(0, 20, 375, 44)];
    [self setValue:navBar forKey:@"navigationBar"];
    
    
    
}

+ (void)initialize
{
    //arning 一般设置导航条背景，不会在导航控制器的子控制器里设置
    // 1.设置导航条的背题图片 --- 设置全局
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    navBar.barTintColor = kRGB(38, 122,242);
    
    // 3.设置导航条标题的字体和颜色
    NSDictionary *titleAttr = @{
                                NSForegroundColorAttributeName:[UIColor whiteColor],
                                NSFontAttributeName:[UIFont systemFontOfSize:22]
                                };
    [navBar setTitleTextAttributes:titleAttr];
    
    //设置返回按钮的样式
    //tintColor是用于导航条的所有Item
    navBar.tintColor = [UIColor whiteColor];
    
    UIBarButtonItem *navItem = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
    
    //设置Item的字体大小
    [navItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]} forState:UIControlStateNormal];
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
