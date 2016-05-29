//
//  WKMovieCell.m
//  我看电影
//
//  Created by wangkui on 16/5/28.
//  Copyright © 2016年 wangkui. All rights reserved.
//

#import "WKMovieCell.h"
#import "WKMovieDetailView.h"

@interface WKMovieCell ()

@property(weak, nonatomic) WKMovieDetailView *movieDetailView;

@end

@implementation WKMovieCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    WKMovieCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[WKMovieCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        //添加内部细节
        [self setDetailView];
    }
    return self;
}

//- (void)setFrame:(CGRect)frame
//{
//    frame.origin.y += 2 * WKMoviePostsDateBorder;
//    frame.origin.x = WKMoviePostsDateBorder;
//    frame.size.width -= 2 * WKMoviePostsDateBorder;
//    frame.size.height -= WKMoviePostsDateBorder;
//    [super setFrame:frame];
//}

- (void)setDetailView
{
    WKMovieDetailView *movieDetailView = [[WKMovieDetailView alloc] init];
    [self.contentView addSubview:movieDetailView];
    self.movieDetailView = movieDetailView;
}

#pragma mark -- 传递frame模型
- (void)setMovieDataFrame:(WKMovieDataFrame *)movieDataFrame
{
    _movieDataFrame = movieDataFrame;
    
    self.movieDetailView.movieDetailViewFrame = movieDataFrame;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
