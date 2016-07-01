//
//  NSString+WK.m
//  我看电影
//
//  Created by wangkui on 16/5/30.
//  Copyright © 2016年 wangkui. All rights reserved.
//

#import "NSString+WK.h"
#import "WKMovieData.h"

@implementation NSString (WK)

+ (NSString *)stringWithCateArray:(NSArray *)cateArray
{
    NSMutableString *strName = [NSMutableString string];
    WKMovieCategories *movieCate = [cateArray firstObject];
    strName = [movieCate.cateTitle mutableCopy];
    for (int index = 1; index < cateArray.count; index++) {
        movieCate = cateArray[index];
        [strName appendString:[NSString stringWithFormat:@"/%@", movieCate.cateTitle]];
    }
    return [NSString stringWithFormat:@"分类：%@",strName];
}

+ (NSString *)stringWithTagArray:(NSArray *)tagArray
{
    NSMutableString *strName = [NSMutableString string];
    if (tagArray.count) {
        WKMovieTags *movieTag = [tagArray firstObject];
        strName = [movieTag.tagTitle mutableCopy];
        for (int index = 1; index < tagArray.count; index++) {
            movieTag = tagArray[index];
            [strName appendString:movieTag.tagTitle];
        }
    } else {
        strName = [NSMutableString stringWithFormat:@"标签"];
    }
    return [NSString stringWithFormat:@"Tags：%@",strName];
    
}

- (NSString *)stringCutWithMark:(NSString *)markStr
{
    //取得标记
    NSRange range = [self rangeOfString:markStr];
    return [self substringFromIndex:(range.location + range.length)];
}


@end
