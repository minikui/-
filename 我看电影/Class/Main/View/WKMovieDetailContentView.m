//
//  WKMovieDetailContentView.m
//  我看电影
//
//  Created by wangkui on 16/5/29.
//  Copyright © 2016年 wangkui. All rights reserved.
//

#import "WKMovieDetailContentView.h"

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
    titleLabel.textColor = [UIColor orangeColor];
    self.titleLabel = titleLabel;
    [self addSubview:titleLabel];
    
    //作者
    UILabel *authorLabel = [[UILabel alloc] init];
    authorLabel.font = WKMovieAuthorFont;
    authorLabel.textColor = [UIColor grayColor];
    self.authorLabel = authorLabel;
    [self addSubview:authorLabel];

    //修改时间
    UILabel *dateLabel = [[UILabel alloc] init];
    dateLabel.font = WKMovieAuthorFont;
    dateLabel.textColor = [UIColor lightGrayColor];
    self.dateLabel = dateLabel;
    [self addSubview:dateLabel];

    //内容
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.numberOfLines = 0;
    contentLabel.font = WKMovieContentFont;
    contentLabel.textColor = [UIColor blackColor];
    self.contentLabel = contentLabel;
    [self addSubview:contentLabel];

    //分类
    UILabel *cateLabel = [[UILabel alloc] init];
    cateLabel.font = WKMovieTagFont;
    cateLabel.backgroundColor = [UIColor grayColor];
    cateLabel.textColor = [UIColor whiteColor];
    self.cateLabel = cateLabel;
    [self addSubview:cateLabel];

    //标签
    UILabel *tagLabel = [[UILabel alloc] init];
    tagLabel.font = WKMovieTagFont;
    tagLabel.backgroundColor = [UIColor grayColor];
    tagLabel.textColor = [UIColor whiteColor];
    self.tagLabel = tagLabel;
    [self addSubview:tagLabel];

}

- (void)setMovieDataFrame:(WKMovieDataFrame *)movieDataFrame
{
    _movieDataFrame = movieDataFrame;
    
    self.titleLabel.text = movieDataFrame.moviePostData.postTitle;
    NSString *authorName = [NSString stringWithFormat:@"作者:%@", movieDataFrame.moviePostData.postAuthor.authorName];
    self.authorLabel.text = authorName;
    NSString *modifiedTime = [NSString stringWithFormat:@"修改时间:%@", movieDataFrame.moviePostData.postModified];
    self.dateLabel.text = modifiedTime;

    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithData:[movieDataFrame.moviePostData.postExcerpt dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType, NSFontAttributeName : WKMovieContentFont} documentAttributes:nil error:nil];
    self.contentLabel.attributedText = attrStr;

    NSArray *postCate = movieDataFrame.moviePostData.postCategories;
    NSMutableString *cateName = [NSMutableString string];
    WKMovieCategories *movieCate = [[WKMovieCategories alloc] init];
    if (postCate.count - 1) {
        movieCate = [postCate firstObject];
        cateName = [movieCate.cateTitle mutableCopy];
        
        for (int index = 0; index < postCate.count - 1; index++) {
            movieCate = postCate[index+1];
            [cateName appendString:[NSString stringWithFormat:@"*%@", movieCate.cateTitle]];
        }
    } else if (postCate.count == 1) {
        movieCate = [postCate firstObject];
        cateName = [movieCate.cateTitle mutableCopy];
    } else {
        cateName = [@"" mutableCopy];
    }
    self.cateLabel.text = cateName;

//    NSArray *postTag = movieDataFrame.moviePostData.postTags;
//    WKMovieTags *movieTag = [[WKMovieTags alloc] init];
//    NSMutableString *tagName = [NSMutableString string];
//
//    if (postTag.count - 1) {
//        movieTag = [postTag firstObject];
//        tagName = [movieTag.tagTitle mutableCopy];
//        
//        for (int index = 0; index < postCate.count - 1; index++) {
//            [tagName appendString:[NSString stringWithFormat:@".%@", postTag[index+1]]];
//        }
//    } else if (postTag.count == 1) {
//        movieTag = [postTag firstObject];
//        tagName = [movieTag.tagTitle mutableCopy];
//    } else {
//        tagName = [@"" mutableCopy];
//    }
    
    NSString *tagName = @"标签";
    self.tagLabel.text = tagName;

    self.titleLabel.frame = movieDataFrame.titleLabelFrame;
    self.authorLabel.frame = movieDataFrame.authorLabelFrame;
    self.dateLabel.frame = movieDataFrame.dateLabelFrame;
    self.contentLabel.frame = movieDataFrame.contentLabelFrame;
    self.cateLabel.frame = movieDataFrame.cateLabelFrame;
    self.tagLabel.frame = movieDataFrame.tagLabelFrame;
}

@end
