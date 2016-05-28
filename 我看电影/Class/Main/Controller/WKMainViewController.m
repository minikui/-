//
//  WKMainViewController.m
//  我看电影
//
//  Created by wangkui on 16/5/27.
//  Copyright © 2016年 wangkui. All rights reserved.
//

#import "WKMainViewController.h"
#import "AFNetworking.h"
#import "WKMovieData.h"
#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"
#import "WKWebViewController.h"

@interface WKMainViewController ()

@property(nonatomic, strong) NSArray *postArray;

@end

@implementation WKMainViewController

- (NSArray *)postArray
{
    if (!_postArray) {
        _postArray = [NSArray array];
    }
    return _postArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //获取所有内容
    [self getAllData];
}

- (void)getAllData
{
    MBProgressHUD *hud =  [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    hud.labelText = @"正在努力加载...";

    NSString *strURL = @"http://128.199.114.93/dy/?json=1";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:strURL parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        WKMovieData *movieData = [MTLJSONAdapter modelOfClass:[WKMovieData class] fromJSONDictionary:responseObject error:nil];
//        WKMoviePostsData *postData = [movieData.posts firstObject];
//        WKMovieThumbnailLargeImages *largeImages = postData.thumbnailImages.thumbnailLargeImages;
//        NSLog(@"%@", largeImages.thumbnailLargeImagesURL);
//        NSLog(@"%lu", (unsigned long)movieData.posts.count);
        self.postArray = movieData.posts;
        hud.labelText = @"加载成功！";
        [self.tableView reloadData];
//        NSLog(@"%@", responseObject);
        [hud hide:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [hud hide:YES];
        NSLog(@"%@", error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.postArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    }
    WKMoviePostsData *postData = self.postArray[indexPath.row];
    cell.textLabel.text = postData.postTitle;
    cell.detailTextLabel.text = postData.postAuthor.authorName;

    WKMovieThumbnailLargeImages *thumbnailLargeImages = postData.thumbnailImages.thumbnailLargeImages;
    
    [cell.imageView sd_setImageWithURL:thumbnailLargeImages.thumbnailLargeImagesURL placeholderImage:[UIImage imageNamed:@"placeHolder"]];
    // Configure the cell...
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WKWebViewController *webViewController = [[WKWebViewController alloc] init];
    WKMoviePostsData *postData = self.postArray[indexPath.row];
    webViewController.contentURL = postData.postURL;
    webViewController.topTitle = postData.postTitle;
    [self.navigationController pushViewController:webViewController animated:YES];

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
