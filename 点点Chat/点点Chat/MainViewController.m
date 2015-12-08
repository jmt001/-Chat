//
//  ViewController.m
//  点点Chat
//
//  Created by jiuxiaoming on 15/12/5.
//  Copyright © 2015年 jiuxiaoming. All rights reserved.
//

#import "MainViewController.h"
#import "ZLSwipeableView.h"
#import "CardView.h"
@interface MainViewController ()<ZLSwipeableViewDataSource,ZLSwipeableViewDelegate>
@property (nonatomic,strong)ZLSwipeableView  * swipeView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.toolbarHidden = NO;
//    self.navigationController.toolbar.backgroundColor=[UIColor redColor];
    self.view.clipsToBounds = YES;
    self.view.backgroundColor = [UIColor whiteColor];

    ZLSwipeableView *swipeableView=[[ZLSwipeableView alloc ]initWithFrame:CGRectZero];
    self.swipeView=swipeableView;
//    self.swipeView.backgroundColor=[UIColor redColor];
    self.swipeView.delegate=self;
    self.swipeView.dataSource=self;
    self.swipeView.translatesAutoresizingMaskIntoConstraints = NO;

    [self.view addSubview:self.swipeView];
    //***<JMTbiaozhu>***   添加约束   ***********************
    NSDictionary *metrics = @{};

    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"|-20-[swipeableView]-20-|"
                               options:0
                               metrics:metrics
                               views:NSDictionaryOfVariableBindings(
                                                                    swipeableView)]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-100-[swipeableView]-120-|"
                               options:0
                               metrics:metrics
                               views:NSDictionaryOfVariableBindings(
                                                                    swipeableView)]];
    //设置swipView允许的方向
    self.swipeView.allowedDirection =ZLSwipeableViewDirectionHorizontal;
//    self.swipeView.numberOfActiveViews = 8;

    
}
- (void)viewDidLayoutSubviews {
    [self.swipeView loadViewsIfNeeded];
}

#pragma mark - ZLSwipeableViewDelegate

- (void)swipeableView:(ZLSwipeableView *)swipeableView
         didSwipeView:(UIView *)view
          inDirection:(ZLSwipeableViewDirection)direction {
    NSLog(@"did swipe in direction: %zd", direction);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView didCancelSwipe:(UIView *)view {
//    NSLog(@"did cancel swipe");
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
  didStartSwipingView:(UIView *)view
           atLocation:(CGPoint)location {
//    [self.swipeView loadViewsIfNeeded];

//    NSLog(@"did start swiping at location: x %f, y %f", location.x, location.y);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
          swipingView:(UIView *)view
           atLocation:(CGPoint)location
          translation:(CGPoint)translation {
//    NSLog(@"swiping at location: x %f, y %f, translation: x %f, y %f", location.x, location.y,
//          translation.x, translation.y);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
    didEndSwipingView:(UIView *)view
           atLocation:(CGPoint)location {
//    NSLog(@"did end swiping at location: x %f, y %f", location.x, location.y);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIView *)nextViewForSwipeableView:(ZLSwipeableView *)swipeableView {
//***<JMTbiaozhu>***   应该在这里没执行一次加1，然后取一下数组里面的图片并赋值   并且判断是否出了请求的数组边界！***********************

    CardView *view = [[CardView alloc] initWithFrame:swipeableView.bounds];
    float red=arc4random_uniform(255)/255.0;
    float green=arc4random_uniform(255)/255.0;
    float blue=arc4random_uniform(255)/255.0;
    view.backgroundColor=[UIColor yellowColor];
    view.backgroundColor=[UIColor colorWithRed:red green:green blue:blue alpha:1];
//    NSLog(@"%@",view);
    return view;//demo中是返回那个CardView的
}
@end
