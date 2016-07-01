//
//  WKBottomView.m
//  我看电影
//
//  Created by wangkui on 16/5/30.
//  Copyright © 2016年 wangkui. All rights reserved.
//

#import "WKBottomView.h"
#import "NSString+WK.h"
#import "UIImageView+WebCache.h"

@interface WKBottomView ()

@property(weak, nonatomic) UILabel *titleLable;
@property(weak, nonatomic) UILabel *authorLabel;
@property(weak, nonatomic) UILabel *dateLabel;
@property(weak, nonatomic) UILabel *contentLabel;
@property(weak, nonatomic) UILabel *tagLabel;
@property(weak, nonatomic) UIImageView *imageView;

@end

@implementation WKBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor grayColor];
        //添加label和view
        [self setLabels];
    }
    return self;
}

- (void)setLabels
{
    //标题
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = WKMovieDetailTitleFont;
    titleLabel.textColor = WKMovieDetailTitleColor;
//    titleLabel.backgroundColor = [UIColor orangeColor];
    self.titleLable = titleLabel;
    [self addSubview:titleLabel];
    //作者
    UILabel *authorLabel = [[UILabel alloc] init];
    authorLabel.font = WKMovieDetailAuthorFont;
    authorLabel.textColor = WKMovieDetailAuthorColor;
    self.authorLabel = authorLabel;
    [self addSubview:authorLabel];
    //时间
    UILabel *dateLabel = [[UILabel alloc] init];
    dateLabel.font = WKMovieDetailAuthorFont;
    dateLabel.textColor = WKMovieDetailAuthorColor;
    self.dateLabel = dateLabel;
    [self addSubview:dateLabel];
    //正文配图
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView = imageView;
    [self addSubview:imageView];
    //正文
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.numberOfLines = 0;
    contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
//    contentLabel.textColor = ;
    self.contentLabel = contentLabel;
    [self addSubview:contentLabel];
    //标签
    UILabel *tagLabel = [[UILabel alloc] init];
    tagLabel.font = WKMovieDetailTagFont;
    tagLabel.textColor = WKMovieDetailTagColor;
    self.tagLabel = tagLabel;
    [self addSubview:tagLabel];
}

- (void)setMovieDetailBottomFrame:(WKMovieDetailContentFrame *)movieDetailBottomFrame
{
    _movieDetailBottomFrame = movieDetailBottomFrame;
    
    self.titleLable.text = movieDetailBottomFrame.moviePostData.postTitle;
    self.authorLabel.text = [NSString stringWithFormat:@"BY:%@", movieDetailBottomFrame.moviePostData.postAuthor.authorName];
    self.dateLabel.text = [NSString stringWithFormat:@"at:%@", movieDetailBottomFrame.moviePostData.postModified];

    //配图
    NSArray *attach = movieDetailBottomFrame.moviePostData.attachments;
    WKMovieAttachments *movieAttach = [[WKMovieAttachments alloc] init];
    if (attach.count > 1) {
        movieAttach = [attach lastObject];
    } else {
        movieAttach = [attach firstObject];
    }
    [self.imageView sd_setImageWithURL:movieAttach.imageURL placeholderImage:[UIImage imageNamed:@"placeHolder"]];
    
    //UILabel展示html内容
    NSString *markStr = @"</p>";
    NSString *contStr = [movieDetailBottomFrame.moviePostData.postContent stringCutWithMark:markStr];
    
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithData:[contStr dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    NSMutableAttributedString *muAttrStr = [[NSMutableAttributedString alloc] initWithAttributedString:attrStr];
    [muAttrStr addAttribute:NSFontAttributeName value:WKMovieDetailContentFont range:NSMakeRange(0, attrStr.length)];
    [muAttrStr addAttribute:NSForegroundColorAttributeName value:WKMovieDetailContentColor range:NSMakeRange(0, attrStr.length)];
    
    self.contentLabel.attributedText = muAttrStr;
    
    NSArray *postTag = movieDetailBottomFrame.moviePostData.postTags;
    NSString *tagName = [NSString stringWithTagArray:postTag];
    self.tagLabel.text = tagName;
    
    self.titleLable.frame = movieDetailBottomFrame.titleLabelFrame;
    self.authorLabel.frame = movieDetailBottomFrame.authorLabelFrame;
    self.dateLabel.frame = movieDetailBottomFrame.dateLabelFrame;
    self.imageView.frame = movieDetailBottomFrame.imageViewFrame;
    self.contentLabel.frame = movieDetailBottomFrame.contentLabelFrame;
    self.tagLabel.frame = movieDetailBottomFrame.tagLabelFrame;
//    NSLog(@"%@", [NSValue valueWithCGRect:self.titleLable.frame]);
}

@end
