//
//  CWProgressHUD.m
//  360CustomDemo
//
//  Created by 买买提 on 15/11/25.
//  Copyright © 2015年 Intelligence community service (Beijing) Co., Ltd. All rights reserved.
//

#import "CWProgressHUD.h"
//获取物理屏幕的尺寸
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define RINGWIDE 90
#define MIDICON 40

@interface CWProgressHUD()
{
    NSInteger angle;
}
@property (nonatomic,strong)UIImageView *ringImageView;
@property (nonatomic,assign)BOOL FLAG;
@end

@implementation CWProgressHUD

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
    
        self.ringImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, RINGWIDE, RINGWIDE)];
        self.ringImageView.image = [UIImage imageNamed:@"CWProgressHUD.bundle/roll"];
        self.ringImageView.center=self.center;
        [self addSubview:self.ringImageView];
        
        UIImageView *midImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, MIDICON, MIDICON)];
        midImageView.image = [UIImage imageNamed:@"CWProgressHUD.bundle/mid"];
        midImageView.center = self.ringImageView.center;
        [self addSubview:midImageView];
    }
    
    self.contentMode = UIViewContentModeCenter;
    self.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
    
    return self;
}

- (void)layoutSubviews {
        
    [super layoutSubviews];

}

- (UIView *)initView
{
   return [self initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 200)];
}

+ (instancetype)sharedHUD {
    
    static CWProgressHUD *hud;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
     hud = [[CWProgressHUD alloc] initView];
        
    });
    return hud;
}

- (void)show
{
    self.FLAG = NO;
    //获取第一响应视图视图
    UIViewController *topVC = [self appRootViewController];
    [topVC.view addSubview:self];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.03];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(endAnimation)];
    self.ringImageView.transform = CGAffineTransformMakeRotation(angle * (M_PI / 180.0f));
    [UIView commitAnimations];
}

-(void)endAnimation{
    
    angle += 10;
    
    if (self.FLAG == NO) {
        [self show];
    }else {
        [self removeFromSuperview];
        return;
    }
}


- (void)hide
{
    self.FLAG = YES;
    [self endAnimation];
}

- (UIViewController *)appRootViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}

@end
