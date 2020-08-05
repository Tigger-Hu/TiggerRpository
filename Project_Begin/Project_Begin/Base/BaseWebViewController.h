//
//  BaseWebViewController.h
//  palmHospital
//
//  Created by laohu on 10/1/19.
//  Copyright © 2019 neusoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface BaseWebViewController : UIViewController
@property (nonatomic,strong) WKWebView *webView;
@property (nonatomic,strong) NSString *contentUrl;
@end

NS_ASSUME_NONNULL_END
