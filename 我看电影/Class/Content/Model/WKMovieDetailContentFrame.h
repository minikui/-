//
//  WKMovieDetailContentFrame.h
//  我看电影
//
//  Created by wangkui on 16/5/30.
//  Copyright © 2016年 wangkui. All rights reserved.
//

#define WKMoviePostDateBorder 10.0
#define WKMoviePostImageScale 1.5


#define WKMovieDetailContentFont [UIFont systemFontOfSize:15.0]
#define WKMovieDetailAuthorFont [UIFont systemFontOfSize:12.0]
#define WKMovieDetailTitleFont [UIFont systemFontOfSize:17.0]
#define WKMovieDetailCateFont [UIFont systemFontOfSize:14.0]
#define WKMovieDetailTagFont [UIFont systemFontOfSize:14.0]

// [UIColor colorWithRed:157/255.0 green:157/255.0 blue:157/255.0 alpha:1.0]
#define WKMovieDetailCateColor [UIColor colorWithRed:157/255.0 green:157/255.0 blue:157/255.0 alpha:1.0]
#define WKMovieDetailTitleColor [UIColor colorWithRed:45/255.0 green:125/255.0 blue:177/255.0 alpha:1.0]
#define WKMovieDetailAuthorColor [UIColor colorWithRed:154/255.0 green:154/255.0 blue:154/255.0 alpha:1.0]
#define WKMovieDetailContentColor [UIColor colorWithRed:52/255.0 green:52/255.0 blue:52/255.0 alpha:1.0]
#define WKMovieDetailTagColor [UIColor colorWithRed:177/255.0 green:177/255.0 blue:177/255.0 alpha:1.0]

#define WKMovieBgColor [UIColor colorWithRed:190/255.0 green:214/255.0 blue:230/255.0 alpha:1.0]

#import <Foundation/Foundation.h>
#import "WKMovieData.h"
#import <UIKit/UIKit.h>

@interface WKMovieDetailContentFrame : NSObject

@property(nonatomic, assign, readonly) CGRect topViewFrame;
@property(nonatomic, assign, readonly) CGRect bottomViewFrame;
@property(nonatomic, assign, readonly) CGRect titleLabelFrame;
@property(nonatomic, assign, readonly) CGRect authorLabelFrame;
@property(nonatomic, assign, readonly) CGRect dateLabelFrame;
@property(nonatomic, assign, readonly) CGRect imageViewFrame;
@property(nonatomic, assign, readonly) CGRect contentLabelFrame;
@property(nonatomic, assign, readonly) CGRect cateLabelFrame;
@property(nonatomic, assign, readonly) CGRect tagLabelFrame;
@property(nonatomic, assign, readonly) CGRect lineViewFrame;

@property(nonatomic, strong) WKMoviePostsData *moviePostData;

@end
