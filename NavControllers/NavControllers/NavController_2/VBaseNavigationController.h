//
//  VBaseNavigationController.h
//  NavControllers
//
//  Created by Vols on 16/3/11.
//  Copyright © 2016年 Vols. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VBaseNavigationController : UINavigationController

+ (instancetype)shareNavgationController;

@property (nonatomic, assign) BOOL fullScreenPopGestureEnable; /* 是否开启全屏侧滑返回手势*/

@property (nonatomic, strong) UIImage *backButtonImage; /* 返回按钮图片*/


@end
