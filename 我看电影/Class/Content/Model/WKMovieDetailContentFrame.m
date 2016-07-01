//
//  WKMovieDetailContentFrame.m
//  我看电影
//
//  Created by wangkui on 16/5/30.
//  Copyright © 2016年 wangkui. All rights reserved.
//

#import "WKMovieDetailContentFrame.h"
#import "NSString+WK.h"

@implementation WKMovieDetailContentFrame

- (void)setMoviePostData:(WKMoviePostsData *)moviePostData
{
    _moviePostData = moviePostData;
    
    //view宽度
    CGFloat viewWidth = [UIScreen mainScreen].bounds.size.width;
//    CGFloat viewHeight = [UIScreen mainScreen].bounds.size.height;
    
    //分类
    CGFloat cateLabelX = WKMoviePostDateBorder;
    CGFloat cateLabelY = cateLabelX;
    
    NSArray *postCate = moviePostData.postCategories;
    NSString *cateName = [NSString stringWithCateArray:postCate];
    
    NSDictionary *cateAttr = @{NSFontAttributeName : WKMovieDetailCateFont};
    CGSize cateSize = [cateName sizeWithAttributes:cateAttr];
    _cateLabelFrame = (CGRect){{cateLabelX, cateLabelY}, cateSize};

    //lineView
    CGFloat lineViewX = 0;
    CGFloat lineViewY = CGRectGetMaxY(_cateLabelFrame) + WKMoviePostDateBorder;
    CGFloat lineViewWidth = viewWidth - 2 * WKMoviePostDateBorder;
    CGFloat lineViewHeight = 1.0;
    _lineViewFrame = CGRectMake(lineViewX, lineViewY, lineViewWidth, lineViewHeight);
    
    //topView
    CGFloat topViewX = WKMoviePostDateBorder;
    CGFloat topViewY = 0;
    CGFloat topViewWidth = lineViewWidth;
    CGFloat topViewHeight = CGRectGetMaxY(_lineViewFrame) + WKMoviePostDateBorder;
    
    _topViewFrame = CGRectMake(topViewX, topViewY, topViewWidth, topViewHeight);
    
    //标题
    CGFloat titleLabelX = WKMoviePostDateBorder;
    CGFloat titleLabelY = WKMoviePostDateBorder;
    
    NSDictionary *titleAttr = @{NSFontAttributeName : WKMovieDetailTitleFont};
    CGSize titleSize = [moviePostData.postTitle sizeWithAttributes:titleAttr];
    _titleLabelFrame = (CGRect){{titleLabelX, titleLabelY}, titleSize};
    
    //作者
    CGFloat authorLabelX = titleLabelX;
    CGFloat authorLabelY = CGRectGetMaxY(_titleLabelFrame) + WKMoviePostDateBorder;
    NSString *authorName = [NSString stringWithFormat:@"BY:%@", moviePostData.postAuthor.authorName];
    
    NSDictionary *authorAttr = @{NSFontAttributeName : WKMovieDetailAuthorFont};
    CGSize authorSize = [authorName sizeWithAttributes:authorAttr];
    _authorLabelFrame = (CGRect){{authorLabelX, authorLabelY}, authorSize};
    
    //修改时间
    CGFloat dateLabelX = CGRectGetMaxX(_authorLabelFrame) + WKMoviePostDateBorder;
    CGFloat dateLabelY = authorLabelY;
    
    NSString *modifiedTime = [NSString stringWithFormat:@"AT:%@", moviePostData.postModified];
    NSDictionary *dateAttr = @{NSFontAttributeName : WKMovieDetailAuthorFont};
    CGSize dateSize = [modifiedTime sizeWithAttributes:dateAttr];
    _dateLabelFrame = (CGRect){{dateLabelX, dateLabelY}, dateSize};
    
    //配图
    CGFloat imageViewX = authorLabelX;
    CGFloat imageViewY = CGRectGetMaxY(_authorLabelFrame) + 2 * WKMoviePostDateBorder;
    CGFloat imageViewWidth = topViewWidth - 2 * WKMoviePostDateBorder;
    CGFloat imageViewHeigth = imageViewWidth * 0.7;
    _imageViewFrame = CGRectMake(imageViewX, imageViewY, imageViewWidth, imageViewHeigth);
    
    //内容
    CGFloat contentLabelX = imageViewX;
    CGFloat contentLabelY = CGRectGetMaxY(_imageViewFrame) + 2 * WKMoviePostDateBorder;
#warning 重新利用模型
    //UILabel展示html内容

    NSString *markStr = @"</p>";
    NSString *contStr = [moviePostData.postContent stringCutWithMark:markStr];
    
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithData:[contStr dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType} documentAttributes:nil error:nil];

    CGSize contentSize = CGSizeMake(topViewWidth - 2 * WKMoviePostDateBorder, CGFLOAT_MAX);
    NSMutableAttributedString *muAttrStr = [[NSMutableAttributedString alloc] initWithAttributedString:attrStr];
    [muAttrStr addAttribute:NSFontAttributeName value:WKMovieDetailContentFont range:NSMakeRange(0, attrStr.length)];
    CGRect contRect = [muAttrStr boundingRectWithSize:contentSize options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin context:nil];
//    CGRect contRect = [attrStr.string boundingRectWithSize:contentSize options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : WKMovieDetailContentFont} context:nil];
    _contentLabelFrame = (CGRect){{contentLabelX, contentLabelY}, contRect.size};
    
    //标签
    CGFloat tagLabelX = contentLabelX;
    CGFloat tagLabelY = CGRectGetMaxY(_contentLabelFrame) + WKMoviePostDateBorder;
    NSArray *postTag = moviePostData.postTags;
    NSString *tagName = [NSString stringWithTagArray:postTag];
    
    NSDictionary *tagAttr = @{NSFontAttributeName : WKMovieDetailCateFont};
    CGSize tagSize = [tagName sizeWithAttributes:tagAttr];
    _tagLabelFrame = (CGRect){{tagLabelX, tagLabelY}, tagSize};
    
    //bottomView
    CGFloat bottomViewX = WKMoviePostDateBorder;
    CGFloat bottomViewY = CGRectGetMaxY(_topViewFrame);
    CGFloat bottomViewWidth = topViewWidth;
    CGFloat bottomViewHeight = CGRectGetMaxY(_tagLabelFrame) + WKMoviePostDateBorder;
    
    _bottomViewFrame = CGRectMake(bottomViewX, bottomViewY, bottomViewWidth, bottomViewHeight);
}

@end
