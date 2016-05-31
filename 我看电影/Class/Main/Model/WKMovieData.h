//
//  WKMovieData.h
//  我看电影
//
//  Created by wangkui on 16/5/27.
//  Copyright © 2016年 wangkui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

/**
 *  电影分类
 */
@interface WKMovieCategories : MTLModel <MTLJSONSerializing>

@property(nonatomic, assign) long cateID;
@property(nonatomic, assign) long postCountCate;
@property(nonatomic, copy) NSString *cateTitle;

@end

/**
 *  电影标签
 */
@interface WKMovieTags : MTLModel <MTLJSONSerializing>

@property(nonatomic, assign) long tagID;
@property(nonatomic, assign) long postCountTag;
@property(nonatomic, copy) NSString *tagTitle;

@end

/**
 *  电影缩略图包含的大图
 */
@interface WKMovieThumbnailLargeImages : MTLModel <MTLJSONSerializing>

@property(nonatomic, strong) NSURL *thumbnailLargeImagesURL;

@end

/**
 *  电影缩略图
 */
@interface WKMovieThumbnailImages : MTLModel <MTLJSONSerializing>

@property(nonatomic, strong) WKMovieThumbnailLargeImages *thumbnailLargeImages;

@end
/**
 *  缩略图以及大图
 */
@interface WKMovieAttachments : MTLModel <MTLJSONSerializing>

@property(nonatomic, copy) NSString *mimeType;
@property(nonatomic, strong) NSURL *imageURL;
@property(nonatomic, assign) long ID;
@property(nonatomic, copy) NSString *desc;

@end
/**
 *  文章作者
 */
@interface WKMoviePostAuthor : MTLModel <MTLJSONSerializing>

@property(nonatomic, copy) NSString *authorName;
//@property(nonatomic, copy) NSString *authorSlug;

@end
/**
 *  每一篇文章内容
 */
@interface WKMoviePostsData : MTLModel <MTLJSONSerializing>

@property(nonatomic, copy) NSString *postTitle;
@property(nonatomic, strong) NSURL *postURL;
@property(nonatomic, copy) NSString *postExcerpt;
@property(nonatomic, copy) NSString *postContent;
@property(nonatomic, copy) NSString *postDate;
@property(nonatomic, copy) NSString *postModified;
@property(nonatomic, strong) NSArray *postCategories;
@property(nonatomic, strong) NSArray *postTags;
@property(nonatomic, strong) NSArray *attachments;
@property(nonatomic, strong) WKMoviePostAuthor *postAuthor;
@property(nonatomic, strong) WKMovieThumbnailImages *thumbnailImages;

@end
/**
 *  所有内容
 */
@interface WKMovieData : MTLModel <MTLJSONSerializing>

@property(nonatomic, assign) long count;
@property(nonatomic, assign) long countTotal;;
@property(nonatomic, assign) long pages;

@property(nonatomic, strong) NSArray *posts;

@end
