//
//  WKTopView.m
//  我看电影
//
//  Created by wangkui on 16/5/30.
//  Copyright © 2016年 wangkui. All rights reserved.
//

#import "WKTopView.h"
#import "NSString+WK.h"

@interface WKTopView ()

@property(weak, nonatomic) UILabel *cateLabel;
@property(weak, nonatomic) UIView *lineView;

@end

@implementation WKTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        //添加label和view
        [self setLabelView];
    }
    return self;
}

- (void)setLabelView
{
    //分类标签
    UILabel *cateLabel = [[UILabel alloc] init];
    cateLabel.font = [UIFont systemFontOfSize:20.0];
    cateLabel.textColor = [UIColor colorWithRed:157/255.0 green:157/255.0 blue:157/255.0 alpha:1.0];
    self.cateLabel = cateLabel;
    [self addSubview:cateLabel];
    //横线view
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor grayColor];
    self.lineView = lineView;
    [self addSubview:lineView];
}

- (void)setMovieDetailTopFrame:(WKMovieDetailContentFrame *)movieDetailTopFrame
{
    _movieDetailTopFrame = movieDetailTopFrame;
    
    NSArray *postCate = movieDetailTopFrame.moviePostData.postCategories;
    NSString *cateName = [NSString stringWithCateArray:postCate];
    self.cateLabel.text = cateName;
    
    self.cateLabel.frame = movieDetailTopFrame.cateLabelFrame;
    self.lineView.frame = movieDetailTopFrame.lineViewFrame;
    NSLog(@"%@", [NSValue valueWithCGRect:self.lineView.frame]);
}

@end
