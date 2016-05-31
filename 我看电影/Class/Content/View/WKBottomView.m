//
//  WKBottomView.m
//  我看电影
//
//  Created by wangkui on 16/5/30.
//  Copyright © 2016年 wangkui. All rights reserved.
//

#import "WKBottomView.h"
#import "NSString+WK.h"

@interface WKBottomView ()

@property(weak, nonatomic) UILabel *titleLable;
@property(weak, nonatomic) UILabel *authorLabel;
@property(weak, nonatomic) UILabel *dateLabel;
@property(weak, nonatomic) UILabel *contentLabel;
@property(weak, nonatomic) UILabel *tagLabel;

@end

@implementation WKBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        //添加label和view
        [self setLabels];
    }
    return self;
}

- (void)setLabels
{
    //标题
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:22.0];
    titleLabel.textColor = [UIColor colorWithRed:52/255.0 green:52/255.0 blue:52/255.0 alpha:1.0];
    titleLabel.backgroundColor = [UIColor orangeColor];
    self.titleLable = titleLabel;
    [self addSubview:titleLabel];
    //作者
    UILabel *authorLabel = [[UILabel alloc] init];
    authorLabel.font = [UIFont systemFontOfSize:12.0];
    authorLabel.textColor = [UIColor colorWithRed:154/255.0 green:154/255.0 blue:154/255.0 alpha:1.0];
    self.authorLabel = authorLabel;
    [self addSubview:authorLabel];
    //时间
    UILabel *dateLabel = [[UILabel alloc] init];
    dateLabel.font = [UIFont systemFontOfSize:12.0];
    dateLabel.textColor = [UIColor colorWithRed:154/255.0 green:154/255.0 blue:154/255.0 alpha:1.0];
    self.dateLabel = dateLabel;
    [self addSubview:dateLabel];
    //正文
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.numberOfLines = 0;
    contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    contentLabel.font = [UIFont systemFontOfSize:22.0];
    contentLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    self.contentLabel = contentLabel;
    [self addSubview:contentLabel];
    //标签
    UILabel *tagLabel = [[UILabel alloc] init];
    tagLabel.font = [UIFont systemFontOfSize:14.0];
    tagLabel.textColor = [UIColor colorWithRed:177/255.0 green:177/255.0 blue:177/255.0 alpha:1.0];
    self.tagLabel = tagLabel;
    [self addSubview:tagLabel];
}

- (void)setMovieDetailBottomFrame:(WKMovieDetailContentFrame *)movieDetailBottomFrame
{
    _movieDetailBottomFrame = movieDetailBottomFrame;
    
    self.titleLable.text = movieDetailBottomFrame.moviePostData.postTitle;
    self.authorLabel.text = [NSString stringWithFormat:@"BY:%@", movieDetailBottomFrame.moviePostData.postAuthor.authorName];
    self.dateLabel.text = [NSString stringWithFormat:@"at:%@", movieDetailBottomFrame.moviePostData.postModified];
    //UILabel展示html内容
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithData:[movieDetailBottomFrame.moviePostData.postContent dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType, NSFontAttributeName : WKMovieDetailContentFont} documentAttributes:nil error:nil];
    self.contentLabel.attributedText = attrStr;
    NSArray *postTag = movieDetailBottomFrame.moviePostData.postTags;
    NSString *tagName = [NSString stringWithTagArray:postTag];
    self.tagLabel.text = tagName;
    
    self.titleLable.frame = movieDetailBottomFrame.titleLabelFrame;
    self.authorLabel.frame = movieDetailBottomFrame.authorLabelFrame;
    self.dateLabel.frame = movieDetailBottomFrame.dateLabelFrame;
    self.contentLabel.frame = movieDetailBottomFrame.contentLabelFrame;
    self.tagLabel.frame = movieDetailBottomFrame.tagLabelFrame;
    NSLog(@"%@", [NSValue valueWithCGRect:self.titleLable.frame]);
}

@end
