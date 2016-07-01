//
//  WKContentController.m
//  我看电影
//
//  Created by wangkui on 16/5/30.
//  Copyright © 2016年 wangkui. All rights reserved.
//

#import "WKContentController.h"
#import "WKTopView.h"
#import "WKBottomView.h"
#import "WKContView.h"

@interface WKContentController ()

@property(weak, nonatomic) WKContView *contView;
//@property(weak, nonatomic) WKTopView *topView;
//@property(weak, nonatomic) WKBottomView *bottomView;

@end

@implementation WKContentController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    [self setcontView];
}

- (void)loadView
{
    WKContView *contView = [[WKContView alloc] init];
    self.view = contView;
}

//- (void)setcontView
//{
//    WKTopView *topView = [[WKTopView alloc] init];
//    self.topView = topView;
//    [self.view addSubview:topView];
//    
//    WKBottomView *bottomView = [[WKBottomView alloc] init];
//    self.bottomView = bottomView;
//    [self.view addSubview:bottomView];
//}

- (void)setMovieDetailContentFrame:(WKMovieDetailContentFrame *)movieDetailContentFrame
{
    _movieDetailContentFrame = movieDetailContentFrame;
    
//    self.topView.frame = movieDetailContentFrame.topViewFrame;
//    self.bottomView.frame = movieDetailContentFrame.bottomViewFrame;
//    
//    self.topView.movieDetailTopFrame = movieDetailContentFrame;
//    self.bottomView.movieDetailBottomFrame = movieDetailContentFrame;
}

- (void)setTopTitle:(NSString *)topTitle
{
    _topTitle = topTitle;
    if (_topTitle) {
        self.navigationItem.title = topTitle;
    }
}

//- (void)loadView
//{
//    WKContView *contView = [[WKContView alloc] init];
//    self.contView = contView;
//    [self.view addSubview:contView];
//}

//- (void)setMovieDetailContentFrame:(WKMovieDetailContentFrame *)movieDetailContentFrame
//{
//    _movieDetailContentFrame = movieDetailContentFrame;
//    
//    self.contView.movieDetailFrame = movieDetailContentFrame;
//}

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
