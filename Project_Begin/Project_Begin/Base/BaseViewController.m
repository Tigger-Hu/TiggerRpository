//
//  BaseControllerViewController.m
//  palmHospital
//
//  Created by laohu on 10/1/19.
//  Copyright © 2019 neusoft. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Action
- (void)backHome {
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
