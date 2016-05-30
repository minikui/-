//
//  WKMovieDataFrame.h
//  我看电影
//
//  Created by wangkui on 16/5/29.
//  Copyright © 2016年 wangkui. All rights reserved.
//

#define WKMoviePostsDataCellBorder 10.0
#define WKMoviePostsDateBorder 5.0
#define WKMoviePostImageWidth 20.0
#define WKMoviePostImageScale 1.5

#define WKMovieTitleFont [UIFont systemFontOfSize:15.0]
#define WKMovieAuthorFont [UIFont systemFontOfSize:12.0]
#define WKMovieContentFont [UIFont systemFontOfSize:17.0]
#define WKMovieTagFont [UIFont systemFontOfSize:12.0]

#define WKMovieCateTagColor [UIColor colorWithRed:45/255.0 green:125/255.0 blue:177/255.0 alpha:1.0]
#define WKMovieTitleColor [UIColor colorWithRed:205/255.0 green:117/255.0 blue:100/255.0 alpha:1.0]
#define WKMovieAuthorColor [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1.0]
#define WKMovieContentColor [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0]

#import <Foundation/Foundation.h>
#import "WKMovieData.h"
#import <UIKit/UIKit.h>

@class WKMoviePostsData;

@interface WKMovieDataFrame : NSObject

@property(nonatomic, assign, readonly) CGRect imageViewFrame;
@property(nonatomic, assign, readonly) CGRect detailContentViewFrame;
@property(nonatomic, assign, readonly) CGRect titleLabelFrame;
@property(nonatomic, assign, readonly) CGRect authorLabelFrame;
@property(nonatomic, assign, readonly) CGRect dateLabelFrame;
@property(nonatomic, assign, readonly) CGRect contentLabelFrame;
@property(nonatomic, assign, readonly) CGRect cateLabelFrame;
@property(nonatomic, assign, readonly) CGRect tagLabelFrame;

@property(nonatomic, assign, readonly) CGFloat cellHeight;

@property(nonatomic, strong) WKMoviePostsData *moviePostData;

@end
