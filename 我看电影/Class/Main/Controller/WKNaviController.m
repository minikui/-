//
//  WKNaviController.m
//  我看电影
//
//  Created by wangkui on 16/5/29.
//  Copyright © 2016年 wangkui. All rights reserved.
//

#import "WKNaviController.h"

@interface WKNaviController ()

@end

@implementation WKNaviController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //设置导航样式
    [self setNaviBar];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)setNaviBar
{
    //导航栏背景
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:44/255.0 green:120/255.0 blue:176/255.0 alpha:1.0]];
    //导航栏标题样式
    NSMutableDictionary *titleAttr = [NSMutableDictionary dictionary];
    titleAttr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    titleAttr[NSFontAttributeName] = [UIFont systemFontOfSize:14.0];
    [[UINavigationBar appearance] setTitleTextAttributes:titleAttr];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];

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
