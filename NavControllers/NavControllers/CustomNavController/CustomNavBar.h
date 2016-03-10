//
//  CustomNavBar.h
//  CustomNavController
//
//  Created by Vols on 15/11/16.
//  Copyright © 2015年 Vols. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomNavBar : UINavigationBar

@property (nonatomic, strong) UIView *bgView;
/**
 *   显示导航条背景颜色
 */
- (void)show;


/**
 *   隐藏
 */
- (void)hidden;


@end
