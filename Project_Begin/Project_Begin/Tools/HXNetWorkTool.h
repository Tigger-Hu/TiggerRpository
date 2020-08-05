//
//  CJNetWorkTool.h
//  MierMilitary
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 CJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

//请求成功的block类型
typedef void(^ScuccessBlock)(id success);
//请求失败的block类型
typedef void(^FailBlock)(NSError *erreo);

//返回值类型
typedef NS_ENUM(NSUInteger, ResponseType) {
    ResponseTypeJSON,
    ResponseTypeXML,
    ResponseTypeDATA
};

//body类型
typedef NS_ENUM(NSUInteger, BodyType) {
    BodyTypeString,
    BodyTypeDictionary
};


@interface HXNetWorkTool : NSObject


/**
 *  get请求
 *
 *  @param url          URL
 *  @param parameter    参数
 *  @param header       请求头
 *  @param responseType 返回值类型
 *  @param success      成功
 *  @param fail         失败
 */

+ (void)getWithUrl:(NSString *)url parameter:(NSDictionary *)parameter httpHeader:(NSDictionary *)header responseType:(ResponseType)responseType success:(ScuccessBlock)success fail:(FailBlock)fail;

/**
 *  post请求
 *
 *  @param url          URL
 *  @param body         body
 *  @param bodyType     body类型
 *  @param header       请求头
 *  @param responseType 返回值类型
 *  @param success      成功
 *  @param fail         失败
 */

+ (void)postWithUrl:(NSString *)url body:(id)body bodyType:(BodyType)bodyType httpHeader:(NSDictionary *)header responseType:(ResponseType)responseType success:(ScuccessBlock)success fail:(FailBlock)fail;


@end
