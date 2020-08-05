//
//  PalmLoadingView.m
//  Loading
//
//  Created by laohu on 7/2/19.
//  Copyright © 2019 laohu. All rights reserved.
//

#import "PalmLoadingView.h"

@interface PalmLoadingView ()

@property (nonatomic, strong) UIImageView *centerImageV;
@end

@implementation PalmLoadingView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _Coreframe = frame;
        [self initView];
    }
    return self;
}

- (void)initView {
    
    UIView *whiteBK = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _Coreframe.size.width, _Coreframe.size.height)];
    whiteBK.backgroundColor = [UIColor whiteColor];
    whiteBK.layer.cornerRadius = 10;
//    [self addSubview:whiteBK];
    //100*110
    //圆圈 边距5
    self.circleImageV = [[UIImageView alloc] initWithFrame:CGRectMake(50, 20, 100, 100)];
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 1; i <28; i++) {
        UIImage *image =[UIImage imageNamed:[NSString stringWithFormat:@"loading_%02d", i]];
        [images addObject:image];
    }
    self.circleImageV.animationImages = images;
    [self addSubview:self.circleImageV];
    
    //中心 边距15
    self.centerImageV = [[UIImageView alloc] initWithFrame:CGRectMake(50, 20, 100, 100)];
    _centerImageV.layer.cornerRadius = 50;
    _centerImageV.image = [UIImage imageNamed:@"loading_center"];
    [self addSubview:_centerImageV];
    
    self.remindLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 140, _Coreframe.size.width, 25)];
    self.remindLbl.text = @"请稍候...";
    self.remindLbl.font = [UIFont systemFontOfSize:18];
    self.remindLbl.textColor = [UIColor colorWithRed:48/255.0 green:195/255.0 blue:125/255.0 alpha:1];
//    remindLbl.textColor = [UIColor redColor];
    self.remindLbl.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.remindLbl];
    

    
}



@end

