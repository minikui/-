//
//  WKWebViewController.m
//  我看电影
//
//  Created by wangkui on 16/5/28.
//  Copyright © 2016年 wangkui. All rights reserved.
//

#import "WKWebViewController.h"

@interface WKWebViewController ()

@end

@implementation WKWebViewController

- (void)loadView
{
    UIWebView *webView = [[UIWebView alloc] init];
    webView.scalesPageToFit = YES;
    self.view = webView;
}

- (void)setContentURL:(NSURL *)contentURL
{
    _contentURL = contentURL;
    if (_contentURL) {
        NSURLRequest *req = [NSURLRequest requestWithURL:_contentURL];
        [(UIWebView *)self.view loadRequest:req];
    }
}

- (void)setTopTitle:(NSString *)topTitle
{
    _topTitle = topTitle;
    if (_topTitle) {
        self.navigationItem.title = _topTitle;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
