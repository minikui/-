//
//  WKMovieDataFrame.m
//  我看电影
//
//  Created by wangkui on 16/5/29.
//  Copyright © 2016年 wangkui. All rights reserved.
//

#import "WKMovieDataFrame.h"

@implementation WKMovieDataFrame

- (void)setMoviePostData:(WKMoviePostsData *)moviePostData
{
    _moviePostData = moviePostData;
    
    //cell宽度
    CGFloat cellWidth = [UIScreen mainScreen].bounds.size.width - 2 * WKMoviePostsDataCellBorder;
    
    CGFloat imageViewX = WKMoviePostsDateBorder;
    CGFloat imageViewY = imageViewX;
    CGFloat imageViewWidth = WKMoviePostImageWidth * 4;
    CGFloat imageViewHeight = imageViewWidth * 1.5;
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

    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithData:[moviePostData.postExcerpt dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType, NSFontAttributeName : WKMovieContentFont} documentAttributes:nil error:nil];
    
    CGSize contentSize = CGSizeMake(cellWidth * 0.7, imageViewHeight * 0.5);
    [attrStr boundingRectWithSize:contentSize options:NSStringDrawingTruncatesLastVisibleLine context:nil];
    _contentLabelFrame = (CGRect){{contentLabelX, contentLabelY}, contentSize};
    
    //分类
    CGFloat cateLabelX = contentLabelX;
    CGFloat cateLabelY = CGRectGetMaxY(_contentLabelFrame) + 2 * WKMoviePostsDateBorder;
    
    NSArray *postCate = moviePostData.postCategories;
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
    NSDictionary *cateAttr = @{NSFontAttributeName : WKMovieTagFont};
    CGSize cateSize = [cateName sizeWithAttributes:cateAttr];
    _cateLabelFrame = (CGRect){{cateLabelX, cateLabelY}, cateSize};
    
    //标签
    CGFloat tagLabelX = CGRectGetMaxX(_cateLabelFrame) + WKMoviePostsDateBorder;
    CGFloat tagLabelY = cateLabelY;
//    NSArray *postTag = moviePostData.postTags;
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
    NSDictionary *tagAttr = @{NSFontAttributeName : WKMovieTagFont};
    CGSize tagSize = [tagName sizeWithAttributes:tagAttr];
    _tagLabelFrame = (CGRect){{tagLabelX, tagLabelY}, tagSize};
    
    _cellHeight = MAX(CGRectGetMaxY(_imageViewFrame), CGRectGetMaxY(_cateLabelFrame)) + WKMoviePostsDateBorder;
}

@end
