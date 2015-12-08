//
//  AppDelegate.h
//  点点Chat
//
//  Created by jiuxiaoming on 15/12/5.
//  Copyright © 2015年 jiuxiaoming. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JVFloatingDrawerViewController;
@class JVFloatingDrawerSpringAnimator;
@class MainViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

//   $(SRCROOT)/点点Chat/PrefixHeader.pch

@property (strong, nonatomic) UIWindow *window;
//***<JMTbiaozhu>***   侧边栏   ***********************
@property (nonatomic, strong) JVFloatingDrawerViewController *drawerViewController;
@property (nonatomic, strong) JVFloatingDrawerSpringAnimator *drawerAnimator;

@property (nonatomic, strong) UITableViewController *leftDrawerViewController;
@property (nonatomic, strong) UITableViewController *rightDrawerViewController;
@property (nonatomic, strong) UIViewController *githubViewController;
@property (nonatomic, strong) MainViewController *mainVC;

+ (AppDelegate *)globalDelegate ;
- (void)toggleLeftDrawer:(id)sender animated:(BOOL)animated;
- (void)toggleRightDrawer:(id)sender animated:(BOOL)animated;
@end

