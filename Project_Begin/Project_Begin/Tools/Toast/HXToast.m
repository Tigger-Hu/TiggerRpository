//
//  HXToast.m
//  pamlPRM
//
//  Created by laohu on 9/12/19.
//  Copyright © 2019 sysucc. All rights reserved.
//

#import "HXToast.h"

static HXToast *toast = nil;
#define cWindow [UIApplication sharedApplication].delegate.window
//[[UIApplication sharedApplication].windows firstObject]
@interface HXToast ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *workSpace;
@property (nonatomic, strong) UILabel *messageLbl;
@property (nonatomic, strong) NSString *message;
@end

@implementation HXToast

- (void)layoutSubviews {
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.bgView.frame = self.frame;
    CGSize textSize = [self calculateTextString];
    self.workSpace.frame =CGRectMake(SCREEN_WIDTH / 2 -textSize.width / 2-20, SCREEN_HEIGHT / 2 - textSize.height / 2-20, textSize.width+40, textSize.height+40);
    self.messageLbl.frame = CGRectMake(SCREEN_WIDTH / 2 -textSize.width / 2, SCREEN_HEIGHT / 2 - textSize.height / 2, textSize.width, textSize.height);
}

+ (instancetype)sharedToast {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        toast = [[HXToast alloc] init];
        BOOL has = NO;
        for (UIView *view in cWindow.subviews) {
            if ([view isKindOfClass:[HXToast class]]) {
                has = YES;
                [cWindow bringSubviewToFront:view];
            }
        }
        if (!has) {
            [cWindow addSubview:toast];
        }
    });
    return toast;
}

- (void)showTipsInWindow:(NSString *)toastMessage {
    self.hidden = NO;
    if (self.bgView) {
        
    }
    if (self.workSpace) {
        
    }
    //在iphone7上 文本会被渲染两次
    self.messageLbl.text = @"";
    self.message = toastMessage;
    self.messageLbl.text = toastMessage;
    [self setNeedsDisplay];
    [self setNeedsLayout];
    UIWindow *window = cWindow;
    if ([window.subviews containsObject:self]) {
        [self removeFromSuperview];
    }
    [window addSubview:self];
    NSLog(@"%@",[UIApplication sharedApplication].windows);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
//        self.hidden = YES;
    });
}

- (void)showTipsInWindow:(NSString *)toastMessage AfterDelay:(NSInteger)seconds {
    self.hidden = NO;
    if (self.bgView) {
        
    }
    if (self.workSpace) {
        
    }
    self.messageLbl.text = @"";
    self.message = toastMessage;
    self.messageLbl.text = toastMessage;
    [self setNeedsDisplay];
    [self setNeedsLayout];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.hidden = YES;
    });
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor clearColor];
        [self addSubview:_bgView];
    }
    return _bgView;
}

- (UIView *)workSpace {
    if (!_workSpace) {
        _workSpace = [[UIView alloc] init];
        _workSpace.backgroundColor = RGBCOLOR(0x33, 0x33, 0x33);
        _workSpace.alpha = 0.7;
        _workSpace.layer.cornerRadius = 10;
        [self addSubview:_workSpace];
    }
    return _workSpace;
}

- (UILabel *)messageLbl {
    if (!_messageLbl) {
        _messageLbl = [[UILabel alloc] init];
        _messageLbl.textColor = [UIColor whiteColor];
        _messageLbl.font = [UIFont systemFontOfSize:15];
        _messageLbl.textAlignment = NSTextAlignmentCenter;
        _messageLbl.numberOfLines = 0;
        [self addSubview:_messageLbl];
    }
    return _messageLbl;
}

//计算文字的size
- (CGSize)calculateTextString {
    //label所能承受的最大宽度
    
    CGFloat maxWidth = SCREEN_WIDTH - 80;
    
    //单行的高度
    CGFloat singleLineHeight = [CommonUtil getTextHeightWithWidth:maxWidth String:@"a" FontSize:15];
    
    //高度合计
    CGFloat textHeight = [CommonUtil getTextHeightWithWidth:maxWidth String:self.message FontSize:15];
    if (textHeight > singleLineHeight) {
        //合计>单行
        return CGSizeMake(maxWidth, textHeight);
    }else {
        //合计<单行 算宽度
        CGFloat width = [CommonUtil getTextHeightWithWidth:singleLineHeight String:self.message FontSize:15];
        return CGSizeMake(width, singleLineHeight);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
