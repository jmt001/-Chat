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
#import "JVFloatingDrawerSpringAnimator.h"
#import "FBShimmeringView.h"
@interface MainViewController ()<ZLSwipeableViewDataSource,ZLSwipeableViewDelegate>{
    FBShimmeringView *MYFBShimmering;
}
@property (nonatomic, strong, readonly) JVFloatingDrawerSpringAnimator *drawerAnimator;//在添加之前也可正常运行？
@property (nonatomic,strong)ZLSwipeableView  * swipeView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加一个imageview
    UIImageView *iv=[[UIImageView alloc]initWithFrame:self.view.bounds];
    iv.image=[UIImage imageNamed:@"bg_jmt"];
    [self.view addSubview:iv];

    [self initView1];//这个是设置主页图片的
    [self initView2];//添加左右btn（最上面的）
    [self initView3];//设置初始的动画效果
    [self initView4];//设置self.view的边界
}
-(void)initView1{
    self.navigationController.toolbarHidden = NO;
    //    self.navigationController.toolbar.backgroundColor=[UIColor redColor];
    self.view.clipsToBounds = YES;
//    self.view.backgroundColor = [UIColor clearColor];
    
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
//***<JMTbiaozhu>***   在这里测试一下效果看看是否可以   ***********************
//    UILabel *l=[[UILabel alloc]initWithFrame:CGRectMake(65, 30, 190, 20)];
//    l.textAlignment=NSTextAlignmentCenter;
//    l.text=@"12321";
//    [self.view addSubview:l];
//    //***<JMTbiaozhu>***   FBShimering   ***********************
//    MYFBShimmering =[[FBShimmeringView alloc]init];
//    MYFBShimmering.frame=CGRectMake(65, 30, 190, 20);
//    MYFBShimmering.contentView=l;
//    MYFBShimmering.shimmering=YES;
//    [self.view addSubview:MYFBShimmering];
    

}
-(void)initView2{
    UIButton *btnLeft=[[UIButton alloc]initWithFrame:CGRectMake(20, 30, 40, 40)];
    [btnLeft setBackgroundImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];
//    btnLeft.backgroundColor=[UIColor blueColor];
    [btnLeft addTarget:self action:@selector(topLeftBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnLeft];
    
    UIButton *btnRight=[[UIButton alloc]initWithFrame:CGRectMake(260, 30, 40, 40)];
    [btnRight addTarget:self action:@selector(topRightBtn) forControlEvents:UIControlEventTouchUpInside];
    [btnRight setBackgroundImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
//    btnRight.backgroundColor=[UIColor blueColor];
    [self.view addSubview:btnRight];

}
-(void)initView3{
    self.drawerAnimator.animationDuration = 1.0;
    self.drawerAnimator.animationDelay = 0.0;
    self.drawerAnimator.initialSpringVelocity = 10.0;
    self.drawerAnimator.springDamping = 0.50;

}
-(void)initView4{
//    self.view.layer.cornerRadius=60.0;
//***<JMTbiaozhu>***   这里其实可以尝试改变self.view的的bounds，不过又涉及到自动布局的问题，暂且作罢！   ***********************
    self.view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    
//    self.view.alpha=0.6;
//    self.view.layer.masksToBounds=YES;
}
//-(void)viewDidLayoutSubviews{
//    
//}
-(void)topLeftBtn{
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
}
-(void)topRightBtn{
    [[AppDelegate globalDelegate] toggleRightDrawer:self animated:YES];
}
- (void)viewDidLayoutSubviews {
//    self.view.bounds=CGRectMake(0, 0, 300, 520);

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
- (JVFloatingDrawerSpringAnimator *)drawerAnimator {
    return  (JVFloatingDrawerSpringAnimator *)[[AppDelegate globalDelegate] drawerAnimator];
}

@end
