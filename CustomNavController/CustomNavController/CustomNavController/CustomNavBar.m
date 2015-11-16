//
//  CustomNavBar.m
//  CustomNavController
//
//  Created by Vols on 15/11/16.
//  Copyright © 2015年 Vols. All rights reserved.
//

#import "CustomNavBar.h"

@implementation CustomNavBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        for (UIView *view in self.subviews) {
            if ([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")]) {
                self.bgView = view;
            }
        }
    }
    return self;
}

/**
 *   显示导航条背景颜色
 */
- (void)show
{
    [UIView animateWithDuration:3 animations:^{
        self.bgView.hidden = NO;
    }];
}



/**
 *   隐藏
 */
- (void)hidden
{
    self.bgView.hidden = YES;
}


@end
