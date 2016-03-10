//
//  OneViewController.m
//  NavControllers
//
//  Created by Vols on 16/3/10.
//  Copyright © 2016年 Vols. All rights reserved.
//

#import "OneViewController.h"
#import "DemoViewController.h"

#import "CustomNavBar.h"

@interface OneViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *tabView;

@property (nonatomic, strong) UIButton * pushButton;
@property (nonatomic, strong) UIButton * popButton;

@end

@implementation OneViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self setNavbarBackgroundHidden:NO];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor grayColor];
    self.title = @"ssss";

    [self.view addSubview:self.tabView];
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    bgView.backgroundColor = [UIColor redColor];
    self.tabView.tableHeaderView = bgView;
    
    [self.view addSubview:self.pushButton];
    [self.view addSubview:self.popButton];
    
    [self setNavbarBackgroundHidden:YES];
}


- (UITableView *)tabView{
    
    if (!_tabView) {
        _tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, -64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height+64)];
        _tabView.delegate = self;
        _tabView.dataSource = self;
        _tabView.backgroundColor = [UIColor clearColor];
        _tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tabView;
}

- (UIButton *)pushButton{
    if (!_pushButton) {
        _pushButton= [UIButton buttonWithType:UIButtonTypeCustom];
        _pushButton.frame = CGRectMake(0, 0, 80, 40);
        _pushButton.center = (CGPoint){self.view.center.x, self.view.center.y-40};
        _pushButton.backgroundColor = [UIColor orangeColor];
        [_pushButton setTitle:@"PUSH" forState:UIControlStateNormal];
        _pushButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        _pushButton.titleLabel.textColor = [UIColor whiteColor];
        _pushButton.layer.cornerRadius = 5.0;
        [_pushButton setTitleColor:[UIColor brownColor] forState:UIControlStateHighlighted];
        [_pushButton addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushButton;
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

- (void)pushAction:(UIButton *)button{
    
    [self.navigationController pushViewController:[[DemoViewController alloc] init] animated:YES];

}


- (void)popAction:(UIButton *)button{

    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - UITableViewDelegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld行",(long)indexPath.row];
    
    return cell;
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y==-64) {
        return;
    }
    
    if (scrollView.contentOffset.y>50) {
        
        [self setNavbarBackgroundHidden:NO];
    }else{
        [self setNavbarBackgroundHidden:YES];
        
    }
}

- (void)setNavbarBackgroundHidden:(BOOL)hidden
{
    CustomNavBar *navBar =(CustomNavBar*)self.navigationController.navigationBar;
    if (!hidden) {
        [navBar show];
    }else{
        [navBar hidden];
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
