//
//  AppDelegate.m
//  02-UITabBarControllerDemoWithCode
//
//  Created by qingyun on 15/10/20.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "AppDelegate.h"
#import "QYFirstViewController.h"
#import "QYSecondViewController.h"
#import "QYThirdViewController.h"
#import "QYFourthViewController.h"
#import "QYFifthViewController.h"
#import "QYSixthViewController.h"
@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.hidden = NO;
    _window = window;
    
    //创建tabBarController包含的视图控制器
    QYFirstViewController *firstVC = [[QYFirstViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:firstVC];
    
    nav.hidesBarsOnTap = YES;
    
    QYSecondViewController *secondVC = [[QYSecondViewController alloc] init];
    QYThirdViewController *thirdVC = [[QYThirdViewController alloc] init];
    QYFourthViewController *fourthVC = [[QYFourthViewController alloc] init];
    
    //添加第五六个视图控制器
    QYFifthViewController *fifthVC = [[QYFifthViewController alloc] init];
    //设置第五个视图控制器所对应的tabBarItem
    UITabBarItem *fifthTabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:5];
    fifthVC.tabBarItem = fifthTabBarItem;
    
    QYSixthViewController *sixthVC = [[QYSixthViewController alloc] init];
    //设置第六个视图控制器所对应的tabBarItem
    UITabBarItem *sixthTabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:6];
    sixthVC.tabBarItem = sixthTabBarItem;
    
    
    //创建tabBarController
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    //把视图控制器添加在tabBarController里
    NSArray *vcs = [NSArray arrayWithObjects:nav,secondVC,thirdVC,fourthVC,fifthVC,sixthVC, nil];
    
    tabBarController.viewControllers = vcs;
    //设置tabBar的tintColor
    tabBarController.tabBar.tintColor = [UIColor blackColor];
    
    //设置tabBar的barTintColor
    //tabBarController.tabBar.barTintColor = [UIColor orangeColor];
    
    tabBarController.delegate = self;
    _window.rootViewController = tabBarController;
    return YES;
}
//允许选择视图控制器
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if (viewController.tabBarItem.tag == 2) {
        return YES;
    }
    return YES;
}
//点击视图控制器对应的tab
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    viewController.tabBarItem.badgeValue = nil;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
