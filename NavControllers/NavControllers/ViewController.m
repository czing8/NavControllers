//
//  ViewController.m
//  NavControllers
//
//  Created by Vols on 16/3/10.
//  Copyright © 2016年 Vols. All rights reserved.
//

#import "ViewController.h"

#import "CustomNavController.h"
#import "OneViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource >

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) NSArray * dataSource;

@end

@implementation ViewController

- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initData];
    
    [self.view addSubview:self.tableView];   //会自动调用 (UITableView *)tableView
}

- (void)initData{
    _dataSource = @[@"one", @"one", @"one", @"one"];
}


#pragma mark - UITableViewDelegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * identifier = @"ID";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    //    for(UIView * view in cell.contentView.subviews){
    //        [view removeFromSuperview];
    //    }
    
    
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.textLabel.textColor = [UIColor colorWithWhite:0.293 alpha:1.000];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.text = _dataSource[indexPath.row];
    
    return cell;
}


//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [self performSelector:@selector(deselect:) withObject:tableView afterDelay:0.2f];
//}
//
- (void)deselect:(UITableView *)tableView
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSelector:@selector(deselect:) withObject:tableView afterDelay:0.2f];
    
    switch (indexPath.row) {
        case 0:
            [self  presentVCOne];
            break;
            
        case 1:
            break;
            
        case 2:
            break;
            
        case 3:
            break;
            
        case 4:
            break;
            
        default:
            break;
    }
}



- (void)presentVCOne{
    CustomNavController * navController = [[CustomNavController alloc] initWithRootViewController:[[OneViewController alloc] init]];
    [self presentViewController:navController animated:YES completion:nil];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
