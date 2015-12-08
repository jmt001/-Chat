//
//  JVLeftDrawerTableViewController.m
//  JVFloatingDrawer
//
//  Created by Julian Villella on 2015-01-15.
//  Copyright (c) 2015 JVillella. All rights reserved.
//

#import "JVLeftDrawerTableViewController.h"
#import "JVLeftDrawerTableViewCell.h"
#import "AppDelegate.h"
#import "JVFloatingDrawerViewController.h"
#import "FBShimmeringView.h"
enum {
    kJVDrawerSettingsIndex    = 0,
    kJVGitHubProjectPageIndex = 1
};

static const CGFloat kJVTableViewTopInset = 80.0;
static NSString * const kJVDrawerCellReuseIdentifier = @"JVDrawerCellReuseIdentifier";
#define WIDTH  self.tableView.frame.size.width
#define HEIGHT  self.tableView.frame.size.height
@interface JVLeftDrawerTableViewController ()
{
    UIButton *infoBtn;
    FBShimmeringView  * MYFBShimmeringView;
}
@end

@implementation JVLeftDrawerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//***<JMTbiaozhu>***   添加一个按钮图片（指向个人资料）   ***********************
    infoBtn=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH/2.0-40,-30, 60, 60)];
    infoBtn.layer.cornerRadius=infoBtn.frame.size.width/2.0;
    infoBtn.layer.masksToBounds=YES;
    infoBtn.backgroundColor=[UIColor blueColor];
    [self.tableView addSubview:infoBtn];
    //***<JMTbiaozhu>***   end   ***********************

    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.contentInset = UIEdgeInsetsMake(kJVTableViewTopInset, 0.0, 0.0, 0.0);
    self.clearsSelectionOnViewWillAppear = NO;
    
//    //***<JMTbiaozhu>***   添加FBShimeringVIew   ***********************
//    MYFBShimmeringView=[[FBShimmeringView alloc ]init];
//    [self.view addSubview:MYFBShimmeringView];
//    //添加一个uilabel测试一下
//    UILabel *l=[[UILabel alloc]initWithFrame:MYFBShimmeringView.bounds];
//    l.text=@"123";
//    [self.tableView addSubview:l];
//
//    MYFBShimmeringView.contentView=l;
//    MYFBShimmeringView.shimmering=YES;
//    //***<JMTbiaozhu>***   ***end***   ***********************

    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:kJVDrawerSettingsIndex inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JVLeftDrawerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kJVDrawerCellReuseIdentifier forIndexPath:indexPath];
//    MYFBShimmeringView.contentView=[cell myLabel];
//        MYFBShimmeringView.shimmering=YES;

    if(indexPath.row == kJVDrawerSettingsIndex) {
        cell.titleText = @"Drawer Settings";
        cell.iconImage = [UIImage imageNamed:@"665-gear"];
        
    } else {
        cell.titleText = @"GitHub Page";
        cell.iconImage = [UIImage imageNamed:@"488-github"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *destinationViewController = nil;

    if(indexPath.row == kJVDrawerSettingsIndex) {
        destinationViewController = [[AppDelegate globalDelegate] mainVC];
    } else {
        destinationViewController = [[AppDelegate globalDelegate] githubViewController];
    }
    
    [[[AppDelegate globalDelegate] drawerViewController] setCenterViewController:destinationViewController];
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com