//
//  ViewController.m
//  360CustomDemo
//
//  Created by 买买提 on 15/11/25.
//  Copyright © 2015年 Intelligence community service (Beijing) Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import "CWProgressHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    //
}
- (IBAction)show:(id)sender {
    
    [[CWProgressHUD sharedHUD] show];

}
- (IBAction)hide:(id)sender {
    
    [[CWProgressHUD sharedHUD] hide];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
