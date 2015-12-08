//
//  AppDelegate.m
//  点点Chat
//
//  Created by jiuxiaoming on 15/12/5.
//  Copyright © 2015年 jiuxiaoming. All rights reserved.
//

#import "AppDelegate.h"
#import <MAMapKit/MAAnnotation.h>
#import "JVFloatingDrawerSpringAnimator.h"
static NSString * const kJVDrawersStoryboardName = @"Main";
static NSString * const kJVLeftDrawerStoryboardID = @"JVLeftDrawerViewControllerStoryboardID";
static NSString * const kJVRightDrawerStoryboardID = @"JVRightDrawerViewControllerStoryboardID";
static NSString * const MainVcStoryboardId = @"main";
static NSString * const kJVGitHubProjectPageViewControllerStoryboardID = @"JVGitHubProjectPageViewControllerStoryboardID";
@interface AppDelegate ()

@property (nonatomic, strong, readonly) UIStoryboard *drawersStoryboard;

@end

@implementation AppDelegate
@synthesize drawersStoryboard = _drawersStoryboard;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.drawerViewController;
    [self configureDrawerViewController];
    
    [self.window makeKeyAndVisible];
    return YES;
    
}
/**
 这里是跳到侧边栏的第二个选项！
 */
- (UIViewController *)githubViewController {
    if (!_githubViewController) {
        _githubViewController = [self.drawersStoryboard instantiateViewControllerWithIdentifier:kJVGitHubProjectPageViewControllerStoryboardID];
    }
    
    return _githubViewController;
}
/**
 侧边栏控制器
 */
- (JVFloatingDrawerViewController *)drawerViewController {
    if (!_drawerViewController) {
        _drawerViewController = [[JVFloatingDrawerViewController alloc] init];
    }
    return _drawerViewController;
}

/**
 window显示之前
 */
-(void)configureDrawerViewController{
    self.drawerViewController.leftViewController = self.leftDrawerViewController;
    self.drawerViewController.rightViewController = self.rightDrawerViewController;
    //这里是主页VC
    self.drawerViewController.centerViewController = self.mainVC;
    self.drawerViewController.animator = self.drawerAnimator;
    self.drawerViewController.backgroundImage = [UIImage imageNamed:@"sky"];
}

/**
  左
 */
- (UITableViewController *)leftDrawerViewController {
    if (!_leftDrawerViewController) {
        _leftDrawerViewController = [self.drawersStoryboard instantiateViewControllerWithIdentifier:kJVLeftDrawerStoryboardID];
    }
    
    return _leftDrawerViewController;
}
/**
 右
 */
- (UITableViewController *)rightDrawerViewController {
    if (!_rightDrawerViewController) {
        _rightDrawerViewController = [self.drawersStoryboard instantiateViewControllerWithIdentifier:kJVRightDrawerStoryboardID];
    }
    
    return _rightDrawerViewController;
}
/**
 main
 */
- (UIViewController *)mainVC {
    if (!_mainVC) {
        _mainVC = [self.drawersStoryboard instantiateViewControllerWithIdentifier:MainVcStoryboardId];
    }
    
    return _mainVC;
}
/**
 drawAnimator类型
 */
- (JVFloatingDrawerSpringAnimator *)drawerAnimator {
    if (!_drawerAnimator) {
        _drawerAnimator = [[JVFloatingDrawerSpringAnimator alloc] init];
    }
    
    return  (JVFloatingDrawerSpringAnimator *)_drawerAnimator;
}
/**
 stroyboard
 */
- (UIStoryboard *)drawersStoryboard {
    if(!_drawersStoryboard) {
        _drawersStoryboard = [UIStoryboard storyboardWithName:kJVDrawersStoryboardName bundle:nil];
    }
    
    return _drawersStoryboard;
}

//***<JMTbiaozhu>***   **************************   ***********************
#pragma mark - Global Access Helper
+ (AppDelegate *)globalDelegate {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (void)toggleLeftDrawer:(id)sender animated:(BOOL)animated {
    [self.drawerViewController toggleDrawerWithSide:JVFloatingDrawerSideLeft animated:animated completion:nil];
}

- (void)toggleRightDrawer:(id)sender animated:(BOOL)animated {
    [self.drawerViewController toggleDrawerWithSide:JVFloatingDrawerSideRight animated:animated completion:nil];
}
//***<JMTbiaozhu>***   结尾   ***********************





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
