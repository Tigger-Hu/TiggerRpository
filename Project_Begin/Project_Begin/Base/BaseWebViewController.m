//
//  BaseWebViewController.m
//  palmHospital
//
//  Created by laohu on 10/1/19.
//  Copyright © 2019 neusoft. All rights reserved.
//

#import "BaseWebViewController.h"

@interface BaseWebViewController ()<WKNavigationDelegate,WKUIDelegate>
@end

@implementation BaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 

    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.contentUrl] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30]];

    
    [self.view addSubview:self.webView];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigator_btn_back"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];

}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.webView.frame =self.view.bounds;
}

// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    

    
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    

}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    
    
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{

}


#pragma mark - ACTION
- (void)backAction{
    
    if ([self.webView canGoBack]) {
        
        [self.webView goBack];
        
    }else{
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
