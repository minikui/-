//
//  WKMovieDetailContentFrame.h
//  我看电影
//
//  Created by wangkui on 16/5/30.
//  Copyright © 2016年 wangkui. All rights reserved.
//

#define WKMoviePostDateBorder 10.0
#define WKMoviePostImageScale 1.5


#define WKMovieDetailContentFont [UIFont systemFontOfSize:22.0]
#define WKMovieDetailAuthorFont [UIFont systemFontOfSize:12.0]
#define WKMovieDetailTitleFont [UIFont systemFontOfSize:22.0]
#define WKMovieDetailCateFont [UIFont systemFontOfSize:20.0]

//#define WKMovieCateTagColor [UIColor colorWithRed:45/255.0 green:125/255.0 blue:177/255.0 alpha:1.0]
//#define WKMovieTitleColor [UIColor colorWithRed:205/255.0 green:117/255.0 blue:100/255.0 alpha:1.0]
//#define WKMovieAuthorColor [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1.0]
//#define WKMovieContentColor [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0]

#import <Foundation/Foundation.h>
#import "WKMovieData.h"
#import <UIKit/UIKit.h>

@interface WKMovieDetailContentFrame : NSObject

@property(nonatomic, assign, readonly) CGRect topViewFrame;
@property(nonatomic, assign, readonly) CGRect bottomViewFrame;
@property(nonatomic, assign, readonly) CGRect titleLabelFrame;
@property(nonatomic, assign, readonly) CGRect authorLabelFrame;
@property(nonatomic, assign, readonly) CGRect dateLabelFrame;
@property(nonatomic, assign, readonly) CGRect contentLabelFrame;
@property(nonatomic, assign, readonly) CGRect cateLabelFrame;
@property(nonatomic, assign, readonly) CGRect tagLabelFrame;
@property(nonatomic, assign, readonly) CGRect lineViewFrame;

@property(nonatomic, strong) WKMoviePostsData *moviePostData;

@end
