//
//  MCNavigationController.m
//  抹茶美妆
//
//  Created by Aesthetic92 on 16/7/9.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "MCNavigationController.h"

@interface MCNavigationController ()

@end

@implementation MCNavigationController


+ (void)initialize
{
    
    UINavigationBar *bar = [UINavigationBar appearance];
    NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
    itemAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    itemAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:17];
    [bar setTitleTextAttributes:itemAttrs];
    
//    [bar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    [bar setShadowImage:[UIImage new]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
