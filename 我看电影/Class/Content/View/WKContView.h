//
//  WKContView.h
//  我看电影
//
//  Created by wangkui on 16/5/30.
//  Copyright © 2016年 wangkui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WKMovieDetailContentFrame.h"

@interface WKContView : UIScrollView

@property(nonatomic, strong) WKMovieDetailContentFrame *movieDetailFrame;

@end
