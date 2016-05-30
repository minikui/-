//
//  WKMovieDataFrame.m
//  我看电影
//
//  Created by wangkui on 16/5/29.
//  Copyright © 2016年 wangkui. All rights reserved.
//

#import "WKMovieDataFrame.h"
#import "NSString+WK.h"

@implementation WKMovieDataFrame

- (void)setMoviePostData:(WKMoviePostsData *)moviePostData
{
    _moviePostData = moviePostData;
    
    //cell宽度
    CGFloat cellWidth = [UIScreen mainScreen].bounds.size.width - 2 * WKMoviePostsDataCellBorder;
    
    CGFloat imageViewX = WKMoviePostsDateBorder;
    CGFloat imageViewY = imageViewX;
    CGFloat imageViewWidth = WKMoviePostImageWidth * 4;
    CGFloat imageViewHeight = imageViewWidth * WKMoviePostImageScale;
    _imageViewFrame = CGRectMake(imageViewX, imageViewY, imageViewWidth, imageViewHeight);
    //标题
    CGFloat titleLabelX = CGRectGetMaxX(_imageViewFrame) + 2 * WKMoviePostsDateBorder;
    CGFloat titleLabelY = imageViewY;
    
    NSDictionary *titleAttr = @{NSFontAttributeName : WKMovieTitleFont};
    CGSize titleSize = [moviePostData.postTitle sizeWithAttributes:titleAttr];
    _titleLabelFrame = (CGRect){{titleLabelX, titleLabelY}, titleSize};
    
    //作者
    CGFloat authorLabelX = titleLabelX;
    CGFloat authorLabelY = CGRectGetMaxY(_titleLabelFrame) + WKMoviePostsDateBorder;
    NSString *authorName = [NSString stringWithFormat:@"作者:%@", moviePostData.postAuthor.authorName];
    
    NSDictionary *authorAttr = @{NSFontAttributeName : WKMovieAuthorFont};
    CGSize authorSize = [authorName sizeWithAttributes:authorAttr];
    _authorLabelFrame = (CGRect){{authorLabelX, authorLabelY}, authorSize};

    //修改时间
    CGFloat dateLabelX = CGRectGetMaxX(_authorLabelFrame) + 2 * WKMoviePostsDateBorder;
    CGFloat dateLabelY = authorLabelY;
    
    NSString *modifiedTime = [NSString stringWithFormat:@"修改时间:%@", moviePostData.postModified];
    NSDictionary *dateAttr = @{NSFontAttributeName : WKMovieAuthorFont};
    CGSize dateSize = [modifiedTime sizeWithAttributes:dateAttr];
    _dateLabelFrame = (CGRect){{dateLabelX, dateLabelY}, dateSize};
    
    //内容
    CGFloat contentLabelX = authorLabelX;
    CGFloat contentLabelY = CGRectGetMaxY(_authorLabelFrame) + WKMoviePostsDateBorder;

    //UILabel展示html内容
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithData:[moviePostData.postExcerpt dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType, NSFontAttributeName : WKMovieContentFont} documentAttributes:nil error:nil];
    
    CGSize contentSize = CGSizeMake(cellWidth * 0.7, imageViewHeight * 0.5);
    [attrStr boundingRectWithSize:contentSize options:NSStringDrawingTruncatesLastVisibleLine context:nil];
    _contentLabelFrame = (CGRect){{contentLabelX, contentLabelY}, contentSize};
    
    //分类
    CGFloat cateLabelX = contentLabelX;
    CGFloat cateLabelY = CGRectGetMaxY(_contentLabelFrame) + 2 * WKMoviePostsDateBorder;
    
    NSArray *postCate = moviePostData.postCategories;
    NSString *cateName = [NSString stringWithCateArray:postCate];

    NSDictionary *cateAttr = @{NSFontAttributeName : WKMovieTagFont};
    CGSize cateSize = [cateName sizeWithAttributes:cateAttr];
    _cateLabelFrame = (CGRect){{cateLabelX, cateLabelY}, cateSize};
    
    //标签
    CGFloat tagLabelX = CGRectGetMaxX(_cateLabelFrame) + WKMoviePostsDateBorder;
    CGFloat tagLabelY = cateLabelY;
    NSArray *postTag = moviePostData.postTags;
    NSString *tagName = [NSString stringWithTagArray:postTag];

    NSDictionary *tagAttr = @{NSFontAttributeName : WKMovieTagFont};
    CGSize tagSize = [tagName sizeWithAttributes:tagAttr];
    _tagLabelFrame = (CGRect){{tagLabelX, tagLabelY}, tagSize};
    
    _cellHeight = MAX(CGRectGetMaxY(_imageViewFrame), CGRectGetMaxY(_cateLabelFrame)) + WKMoviePostsDateBorder;
}

@end
