//
//  WKContView.m
//  我看电影
//
//  Created by wangkui on 16/5/30.
//  Copyright © 2016年 wangkui. All rights reserved.
//

#import "WKContView.h"
#import "WKTopView.h"
#import "WKBottomView.h"

@interface WKContView () <UIScrollViewDelegate>

@property(weak, nonatomic) WKTopView *topView;
@property(weak, nonatomic) WKBottomView *bottomView;

@end

@implementation WKContView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //添加内部控件
        [self setcontView];
    }
    return self;
}

- (void)setcontView
{
    WKTopView *topView = [[WKTopView alloc] init];
    self.topView = topView;
    [self addSubview:topView];
    
    WKBottomView *bottomView = [[WKBottomView alloc] init];
    self.bottomView = bottomView;
    [self addSubview:bottomView];
}

- (void)setMovieDetailFrame:(WKMovieDetailContentFrame *)movieDetailFrame
{
    _movieDetailFrame = movieDetailFrame;
    
    self.topView.frame = movieDetailFrame.topViewFrame;
    self.bottomView.frame = movieDetailFrame.bottomViewFrame;
    
    self.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, CGRectGetMaxY(self.bottomView.frame));
    self.topView.movieDetailTopFrame = movieDetailFrame;
    self.bottomView.movieDetailBottomFrame = movieDetailFrame;
}

- (BOOL)isScrollEnabled
{
    return YES;
}

@end
