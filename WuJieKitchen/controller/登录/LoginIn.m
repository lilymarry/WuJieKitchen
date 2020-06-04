//
//  LoginIn.m
//  WuJieKitchen
//
//  Created by 天津沃天科技 on 2019/5/28.
//  Copyright © 2019年 wotianshiyan. All rights reserved.
//

#import "LoginIn.h"
#import "MainController.h"
@interface LoginIn ()

@end

@implementation LoginIn

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
//隐藏NavigationBar
-(void) viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES]; //设置隐藏
    [super viewWillAppear:animated];
}

-(void) viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [super viewWillDisappear:animated];
}
- (IBAction)submitPress:(id)sender {
    MainController *main=[[MainController alloc]init];
    main.type=@"1";
    [self.navigationController pushViewController:main animated:YES];
}
@end
