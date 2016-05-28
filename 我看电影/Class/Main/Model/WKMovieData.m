//
//  WKMovieData.m
//  我看电影
//
//  Created by wangkui on 16/5/27.
//  Copyright © 2016年 wangkui. All rights reserved.
//

#import "WKMovieData.h"

@implementation WKMovieThumbnailLargeImages

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"thumbnailLargeImagesURL"    : @"url",
             };
}

- (void)setNilValueForKey:(NSString *)key {
    [self setValue:@0 forKey:key];
}

+ (NSValueTransformer *)thumbnailLargeImagesURLJSONTransformer {
    return [MTLValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end

@implementation WKMovieThumbnailImages

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"thumbnailLargeImages"    : @"large",
             };
}

- (void)setNilValueForKey:(NSString *)key {
    [self setValue:@0 forKey:key];
}

+ (NSValueTransformer *)thumbnailLargeImagesJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        WKMovieThumbnailLargeImages *thumbnailLargeImages = [MTLJSONAdapter modelOfClass:[WKMovieThumbnailLargeImages class] fromJSONDictionary:value error:nil];
        return thumbnailLargeImages;
    }];
}

@end

@implementation WKMovieAttachments

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"mimeType"    : @"mime_type",
             @"imageURL"    : @"url",
             @"ID"          : @"id",
             @"desc" : @"description",
             };
}

- (void)setNilValueForKey:(NSString *)key {
    [self setValue:@0 forKey:key];
}

+ (NSValueTransformer *)imageURLJSONTransformer {
    return [MTLValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end

@implementation WKMovieData

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"count"       : @"count",
             @"countTotal"  : @"count_total",
             @"pages"       : @"pages",
             @"posts"       : @"posts",
             };
}

- (void)setNilValueForKey:(NSString *)key {
    [self setValue:@0 forKey:key];
}

+ (NSValueTransformer *)postsJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        NSArray *jsonArray = value;
        NSMutableArray *postsArray = [NSMutableArray array];
        
        [jsonArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            WKMoviePostsData *post = [MTLJSONAdapter modelOfClass:[WKMoviePostsData class] fromJSONDictionary:obj error:nil];
            [postsArray addObject:post];
        }];
        return postsArray;
    }];
}

@end

@implementation WKMoviePostAuthor

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"authorName"  : @"name",
//             @"authorSlug"  : @"slug",
             };
}

@end

@implementation WKMoviePostsData

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"postTitle"       : @"title",
             @"postURL"         : @"url",
             @"postExcerpt"     : @"excerpt",
             @"postDate"        : @"date",
             @"postModified"    : @"modified",
//             @"postCategories"  : @"categories",
//             @"postTags"        : @"tags",
             @"attachments"     : @"attachments",
             @"postAuthor"      : @"author",
             @"thumbnailImages" : @"thumbnail_images",
             };
}

- (void)setNilValueForKey:(NSString *)key {
    [self setValue:@0 forKey:key];
}

+ (NSValueTransformer *)postURLJSONTransformer {
    return [MTLValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)postAuthorJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        WKMoviePostAuthor *author = [MTLJSONAdapter modelOfClass:[WKMoviePostAuthor class] fromJSONDictionary:value error:nil];
        return author;
    }];
}

+ (NSValueTransformer *)thumbnailImagesJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        WKMovieThumbnailImages *thumbnailImages = [MTLJSONAdapter modelOfClass:[WKMovieThumbnailImages class] fromJSONDictionary:value error:nil];
        return thumbnailImages;
    }];
}

+ (NSValueTransformer *)attachmentsJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        NSArray *jsonArray = value;
        NSMutableArray *attachmentsArray = [NSMutableArray array];
        
        [jsonArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            WKMovieAttachments *attachments = [MTLJSONAdapter modelOfClass:[WKMovieAttachments class] fromJSONDictionary:obj error:nil];
            [attachmentsArray addObject:attachments];
        }];
        return attachmentsArray;
    }];
}

//+ (NSValueTransformer *)JSONTransformer
//{
//    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
//        NSArray *jsonArray = value;
//        NSMutableArray *eachPost = [NSMutableArray array];
//        
//        [jsonArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            [eachPost addObject:obj];
//        }];
//        return eachPost;
//    }];
//}

@end
