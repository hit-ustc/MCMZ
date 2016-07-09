//
//  MCTabBarController.m
//  抹茶美妆
//
//  Created by Aesthetic92 on 16/7/9.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "MCTabBarController.h"
#import "MCNavigationController.h"
#import "MCHomeViewController.h"
#import "MCCommunityViewController.h"
#import "MCPostViewController.h"
#import "MCBestBuyViewController.h"
#import "MCProfileViewController.h"


@interface MCTabBarController ()

@end

@implementation MCTabBarController

+ (void)initialize
{
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = JSTabBarItemTitleColor;
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildVc:[[MCHomeViewController alloc] init] title:@"首页" image:@"home" selectedImage:@"home_selected"];
    
    [self setupChildVc:[[MCCommunityViewController alloc] init] title:@"茶社" image:@"community" selectedImage:@"community_selected"];
    
    [self setupChildVc:[[MCPostViewController alloc] init] title:@"发布" image:@"post" selectedImage:@"post_selected"];
    
    [self setupChildVc:[[MCBestBuyViewController alloc] init] title:@"值得买" image:@"best_pro" selectedImage:@"best_pro_selected"];
    
    [self setupChildVc:[[MCProfileViewController alloc] init] title:@"我的" image:@"profile_icon" selectedImage:@"profile_icon_selected"];
    
    //    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabBarBackground"]];
    
}

- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 包装一个导航控制器, 添加导航控制器为tabbarController的子控制器
    MCNavigationController *nav = [[MCNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}


@end
