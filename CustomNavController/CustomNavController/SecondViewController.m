//
//  SecondViewController.m
//  CustomNavController
//
//  Created by Vols on 15/11/16.
//  Copyright © 2015年 Vols. All rights reserved.
//

#import "SecondViewController.h"
#import "CustomNavBar.h"

@interface SecondViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tabView;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"ssss";
    
    self.tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, -64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height+64) style:UITableViewStylePlain];
    self.tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    [self.view addSubview:self.tabView];
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    bgView.backgroundColor = [UIColor redColor];
    self.tabView.tableHeaderView = bgView;
    
    [self setNavbarBackgroundHidden:YES];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
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




- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self setNavbarBackgroundHidden:NO];
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
