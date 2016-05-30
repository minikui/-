//
//  WKMovieDetailContentView.m
//  我看电影
//
//  Created by wangkui on 16/5/29.
//  Copyright © 2016年 wangkui. All rights reserved.
//

#import "WKMovieDetailContentView.h"
#import "NSString+WK.h"

@interface WKMovieDetailContentView ()

@property(weak, nonatomic) UILabel *titleLabel;
@property(weak, nonatomic) UILabel *authorLabel;
@property(weak, nonatomic) UILabel *dateLabel;
@property(weak, nonatomic) UILabel *contentLabel;
@property(weak, nonatomic) UILabel *cateLabel;
@property(weak, nonatomic) UILabel *tagLabel;

@end

@implementation WKMovieDetailContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加各种内容
        [self setDetailContent];
    }
    return self;
}

- (void)setDetailContent
{
    //标题
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = WKMovieTitleFont;
    titleLabel.textColor = WKMovieTitleColor;
    self.titleLabel = titleLabel;
    [self addSubview:titleLabel];
    
    //作者
    UILabel *authorLabel = [[UILabel alloc] init];
    authorLabel.font = WKMovieAuthorFont;
    authorLabel.textColor = WKMovieAuthorColor;
    self.authorLabel = authorLabel;
    [self addSubview:authorLabel];

    //修改时间
    UILabel *dateLabel = [[UILabel alloc] init];
    dateLabel.font = WKMovieAuthorFont;
    dateLabel.textColor = WKMovieAuthorColor;
    self.dateLabel = dateLabel;
    [self addSubview:dateLabel];

    //内容
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.numberOfLines = 0;
    contentLabel.font = WKMovieContentFont;
    contentLabel.textColor = WKMovieContentColor;
    self.contentLabel = contentLabel;
    [self addSubview:contentLabel];

    //分类
    UILabel *cateLabel = [[UILabel alloc] init];
    cateLabel.font = WKMovieTagFont;
//    cateLabel.backgroundColor = [UIColor grayColor];
    cateLabel.textColor = WKMovieCateTagColor;
    self.cateLabel = cateLabel;
    [self addSubview:cateLabel];

    //标签
    UILabel *tagLabel = [[UILabel alloc] init];
    tagLabel.font = WKMovieTagFont;
//    tagLabel.backgroundColor = [UIColor grayColor];
    tagLabel.textColor = WKMovieCateTagColor;
    self.tagLabel = tagLabel;
    [self addSubview:tagLabel];

}

- (void)setMovieDataFrame:(WKMovieDataFrame *)movieDataFrame
{
    _movieDataFrame = movieDataFrame;
    
#pragma mark -- 设置数据
    //标题
    self.titleLabel.text = movieDataFrame.moviePostData.postTitle;
    //作者
    NSString *authorName = [NSString stringWithFormat:@"作者:%@", movieDataFrame.moviePostData.postAuthor.authorName];
    self.authorLabel.text = authorName;
    //修改时间
    NSString *modifiedTime = [NSString stringWithFormat:@"修改时间:%@", movieDataFrame.moviePostData.postModified];
    self.dateLabel.text = modifiedTime;

    //内容简介
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithData:[movieDataFrame.moviePostData.postExcerpt dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType, NSFontAttributeName : WKMovieContentFont} documentAttributes:nil error:nil];
    self.contentLabel.attributedText = attrStr;

    //分类
    NSArray *postCate = movieDataFrame.moviePostData.postCategories;
    NSString *cateName = [NSString stringWithCateArray:postCate];
    self.cateLabel.text = cateName;

    //标签
    NSArray *postTag = movieDataFrame.moviePostData.postTags;
    NSString *tagName = [NSString stringWithTagArray:postTag];
    self.tagLabel.text = tagName;

#pragma mark -- 设置frame
    self.titleLabel.frame = movieDataFrame.titleLabelFrame;
    self.authorLabel.frame = movieDataFrame.authorLabelFrame;
    self.dateLabel.frame = movieDataFrame.dateLabelFrame;
    self.contentLabel.frame = movieDataFrame.contentLabelFrame;
    self.cateLabel.frame = movieDataFrame.cateLabelFrame;
    self.tagLabel.frame = movieDataFrame.tagLabelFrame;
}

@end
