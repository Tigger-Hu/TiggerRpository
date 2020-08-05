//
//  MainViewController.m
//  Project_Begin
//
//  Created by laohu on 7/5/20.
//  Copyright © 2020 laohu. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[HXToast sharedToast] showTipsInWindow:@"这是toast"];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    zzAlertView *alert = [zzAlertView createViewFromNib];
    alert.frame = CGRectMake(36, SCREEN_HEIGHT / 2 -100, SCREEN_WIDTH - 72, 200);
    [alert configAlertWithSlideRemindTypeTittle:@"提示" Msg:@"abcdefg" userInterface:doubleBtnAction];
    alert.okBlock = ^{

    };
    alert.cancelBlock = ^{

    };
    [alert showInWindow];
    
}


@end
