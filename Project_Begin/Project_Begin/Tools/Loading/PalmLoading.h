//
//  PalmLoading.h
//  Loading
//
//  Created by laohu on 7/2/19.
//  Copyright © 2019 laohu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PalmDelegate <NSObject>

- (void)panCancelDelegate;

@end

@interface PalmLoading : UIView


//创建单例
+ (instancetype)sharedLoading;
//展示
- (void)showLoading;
//隐藏
- (void)dismisLoading;
//sconds秒后隐藏
- (void)dismisLoadingAfter:(NSTimeInterval)seconds;




//提示语
@property (nonatomic, copy) NSString *remindString;
@property (nonatomic, weak) id<PalmDelegate>delegate;
@end

NS_ASSUME_NONNULL_END

