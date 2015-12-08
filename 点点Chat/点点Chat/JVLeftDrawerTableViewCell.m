//
//  JVDrawerTableViewCell.m
//  JVFloatingDrawer
//
//  Created by Julian Villella on 2015-01-15.
//  Copyright (c) 2015 JVillella. All rights reserved.
//

#import "JVLeftDrawerTableViewCell.h"

@interface JVLeftDrawerTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
//***<JMTbiaozhu>***      ***********************
@property (nonatomic,strong)FBShimmeringView  * FBShimmeringView;

@end

@implementation JVLeftDrawerTableViewCell
#ifdef _FOR_DEBUG_
-(BOOL) respondsToSelector:(SEL)aSelector {
    printf("SELECTOR: %s\n", [NSStringFromSelector(aSelector) UTF8String]);
    return [super respondsToSelector:aSelector];
}
#endif
//@synthesize fbShimmeringView;
- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    //***<JMTbiaozhu>***   jmtLabel   ***********************
    //在这里如果添加此代码的话就崩溃了！
//    self.mylabel=self.titleLabel;
    //***<JMTbiaozhu>***   end   ***********************

}
//***<JMTbiaozhu>***   在这里返回uilabel   ***********************
-(UIView *)myLabel{
    return self.titleLabel;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    [self highlightCell:selected];
}
/**
 fbshimmeringView
 */
-(FBShimmeringView *)FBShimmeringView{
    if (!_FBShimmeringView) {
        _FBShimmeringView=[[FBShimmeringView alloc]initWithFrame:self.titleLabel.frame];
    }
    return _FBShimmeringView;
}
-(void)layoutSubviews{
    [super layoutSubviews];
//***<JMTbiaozhu>***   jmt这里我们可以设置View的值，在这里我们判断是第几个   ***********************

    [self.contentView addSubview:self.FBShimmeringView];
    self.FBShimmeringView.contentView=self.titleLabel;
    self.FBShimmeringView.shimmering=YES;
//    self.FBShimmeringView.shimmeringBeginFadeDuration = 1.0;//无效果？

}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    [self highlightCell:highlighted];
}

- (void)highlightCell:(BOOL)highlight {
    UIColor *tintColor = [UIColor whiteColor];
    if(highlight) {
        tintColor = [UIColor colorWithWhite:1.0 alpha:0.6];
    }
    
    self.titleLabel.textColor = tintColor;
    self.iconImageView.tintColor = tintColor;
}

#pragma mark - Accessors

#pragma Title

- (NSString *)titleText {
    return self.titleLabel.text;
}

- (void)setTitleText:(NSString *)title {
    self.titleLabel.text = title;
}

#pragma Icon

- (UIImage *)iconImage {
    return self.iconImageView.image;
}

- (void)setIconImage:(UIImage *)icon {
    self.iconImageView.image = [icon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com