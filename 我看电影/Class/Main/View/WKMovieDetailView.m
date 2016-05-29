//
//  WKMovieDetailView.m
//  我看电影
//
//  Created by wangkui on 16/5/29.
//  Copyright © 2016年 wangkui. All rights reserved.
//

#import "WKMovieDetailView.h"
#import "WKMovieDetailContentView.h"
#import "WKMovieDataFrame.h"
#import "UIImageView+WebCache.h"

@interface WKMovieDetailView ()

@property(weak, nonatomic) UIImageView *imageView;
@property(weak, nonatomic) WKMovieDetailContentView *movieDetailContentView;

@end

@implementation WKMovieDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加左侧图片和右侧内容详情
        [self setImageAndContent];
    }
    return self;
}

- (void)setImageAndContent
{
    //添加图片
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.contentMode = UIViewContentModeScaleToFill;
    self.imageView = imageView;
    [self addSubview:imageView];
    
    //添加右侧内容
    WKMovieDetailContentView *detailContent = [[WKMovieDetailContentView alloc] init];
    self.movieDetailContentView = detailContent;
    [self addSubview:detailContent];
}

- (void)setMovieDetailViewFrame:(WKMovieDataFrame *)movieDetailViewFrame
{
    _movieDetailViewFrame = movieDetailViewFrame;
    
    WKMovieThumbnailLargeImages *thumbnailLargeImages = movieDetailViewFrame.moviePostData.thumbnailImages.thumbnailLargeImages;
    
    self.imageView.frame = movieDetailViewFrame.imageViewFrame;
    [self.imageView  sd_setImageWithURL:thumbnailLargeImages.thumbnailLargeImagesURL placeholderImage:[UIImage imageNamed:@"placeHolder"]];
    
    self.movieDetailContentView.movieDataFrame = movieDetailViewFrame;
}

@end
