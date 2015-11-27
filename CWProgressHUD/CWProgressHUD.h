//
//  CWProgressHUD.h
//  360CustomDemo
//
//  Created by 买买提 on 15/11/25.
//  Copyright © 2015年 Intelligence community service (Beijing) Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CWProgressHUDStatus) {
    
    /** 显示 */
    CWProgressHUDStatusShow,
    
    /** 隐藏 */
    CWProgressHUDStatusHide,
    
};

@interface CWProgressHUD : UIView

/*
 返回一个 HUD 的单例 
 */
+ (instancetype)sharedHUD;

- (UIView *)initView;
/* 显示加载提示框
 duration  (0 - 0.1);
 */
- (void)show;

/*
 停止加载提示框
 */
- (void)hide;

@end
