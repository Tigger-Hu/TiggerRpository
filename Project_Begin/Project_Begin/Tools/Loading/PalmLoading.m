//
//  PalmLoading.m
//  Loading
//
//  Created by laohu on 7/2/19.
//  Copyright © 2019 laohu. All rights reserved.
//

#import "PalmLoading.h"
#import "PalmLoadingView.h"
#define kCurrentWindow [UIApplication sharedApplication].keyWindow
static PalmLoading *loading = nil;
@interface PalmLoading ()
@property (nonatomic, strong) PalmLoadingView *loadingView;

@end


@implementation PalmLoading

+ (instancetype)sharedLoading {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loading = [[PalmLoading alloc] init];
        [loading setupLoadingView];
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:loading action:@selector(panGes:)];
        [loading addGestureRecognizer:pan];
    });
    return loading;
}

- (void)setRemindString:(NSString *)remindString {
    _remindString = remindString;
    loading.loadingView.remindLbl.text = remindString;
}

#pragma mark - Public
- (void)showLoading {
    UIWindow *window = kCurrentWindow;
    if ([window.subviews containsObject:loading]) {
        [self removeFromSuperview];
    }
//    [[UIApplication sharedApplication].windows.lastObject addSubview:loading];
    [window addSubview:loading];
    [loading beginLoading];
    
}

- (void)dismisLoadingAfter:(NSTimeInterval)seconds {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismisLoading];
    });
}

#pragma mark - Private
- (void)setupLoadingView {
    loading.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    loading.backgroundColor = [UIColor clearColor];
    UIView *mask = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    mask.backgroundColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:0.3];
//    mask.alpha = 0.5;
    [self addSubview:mask];
    
    loading.loadingView = [[PalmLoadingView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 100, [UIScreen mainScreen].bounds.size.height / 2 - 100, 200, 200)];
    [self addSubview:loading.loadingView];
}

- (void)beginLoading {
//    CABasicAnimation *rotationAnimation;
//    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI* 2.0];
//    rotationAnimation.duration = 3;
//    rotationAnimation.cumulative = YES;
//    rotationAnimation.repeatCount = CGFLOAT_MAX;
//    [loading.loadingView.circleView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    loading.loadingView.circleImageV.animationDuration = 0.5;
    loading.loadingView.circleImageV.animationRepeatCount = 0;
    [loading.loadingView.circleImageV startAnimating];
}

- (void)dismisLoading {
    
//    [loading.loadingView.circleView.layer removeAnimationForKey:@"rotationAnimation"];
//    if ([[UIApplication sharedApplication].windows.lastObject.subviews containsObject:loading]) {
//        [self removeFromSuperview];
//    }
    [loading.loadingView.circleImageV stopAnimating];
    [self removeFromSuperview];
}

- (void)panGes:(UIGestureRecognizer *)gesture {
    if ([self.delegate respondsToSelector:@selector(panCancelDelegate)]) {
        [self.delegate panCancelDelegate];
    }
    [loading dismisLoading];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end


