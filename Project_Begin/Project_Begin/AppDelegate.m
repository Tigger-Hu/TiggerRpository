//
//  AppDelegate.m
//  Project_Begin
//
//  Created by laohu on 7/5/20.
//  Copyright © 2020 laohu. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import <UserNotifications/UserNotifications.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    MainViewController *main = [StoryBoard(@"Main") instantiateViewControllerWithIdentifier:@"MainViewController"];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:main];
    
    self.window.rootViewController = nav;
    
    
    //调用了这个方法 setBadge才好用
    [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:UNAuthorizationOptionBadge|UNAuthorizationOptionSound|UNAuthorizationOptionAlert completionHandler:^(BOOL granted, NSError * _Nullable error) {
        NSLog(@"%@", error);
    }];
    
    
    return YES;
}



@end
