//
//  CJNetWorkTool.m
//  MierMilitary
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 CJ. All rights reserved.
//

#import "HXNetWorkTool.h"

@implementation HXNetWorkTool

+ (void)getWithUrl:(NSString *)url parameter:(NSDictionary *)parameter httpHeader:(NSDictionary *)header responseType:(ResponseType)responseType success:(ScuccessBlock)success fail:(FailBlock)fail {
    
    
    // 初始化sessionManager
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 处理请求头
    if (header) {
        for (NSString *key in header.allKeys) {
            [manager.requestSerializer setValue:header[key] forHTTPHeaderField:key];
        }
    }
    
    // 判断返回值数据类型
    switch (responseType) {
        case ResponseTypeDATA:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        case ResponseTypeJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case ResponseTypeXML:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;

    }
    
    // 判断返回值所接受的具体类型
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil]];
    
    // get 请求
    [manager GET:url parameters:parameter headers:@{} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
        success(responseObject);

        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(error);

        }
    }];
}


+ (void)postWithUrl:(NSString *)url body:(id)body bodyType:(BodyType)bodyType httpHeader:(NSDictionary *)header responseType:(ResponseType)responseType success:(ScuccessBlock)success fail:(FailBlock)fail {
    
    // 初始化sessionManager
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 处理body
    switch (bodyType) {
        case BodyTypeDictionary:
            manager.requestSerializer = [AFJSONRequestSerializer serializer];
            break;
        case BodyTypeString:
            [manager.requestSerializer setQueryStringSerializationWithBlock:^NSString * _Nonnull(NSURLRequest * _Nonnull request, id  _Nonnull parameters, NSError * _Nullable __autoreleasing * _Nullable error) {
                return parameters;
            }];
            break;
    }
    
    // 处理请求头
    if (header) {
        for (NSString *key in header.allKeys) {
            [manager.requestSerializer setValue:header[key] forHTTPHeaderField:key];
        }
    }
    
    // 判断返回值数据类型
    switch (responseType) {
        case ResponseTypeDATA:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        case ResponseTypeJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case ResponseTypeXML:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
    }
    
    // 判断返回值所接受的具体类型
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil]];
    
    // post请求
    [manager POST:url parameters:body headers:@{} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);

        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(error);

        }
    }];
}


@end
