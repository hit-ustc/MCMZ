//
//  MCHomeViewController.m
//  抹茶美妆
//
//  Created by Aesthetic92 on 16/7/9.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "MCHomeViewController.h"
#import "MCTopLabel.h"
#import "MCTopicTableViewController.h"

@interface MCHomeViewController () <UIScrollViewDelegate>
{
    UIScrollView *_top;
    UIScrollView *_content;
    MCTopLabel *_selectLabel;

}

@end

@implementation MCHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    
    [self initTopTitle];
    
}

- (void)setupNav {
    
    self.view.backgroundColor = JSGlobalBg;
    self.navigationController.navigationBar.barTintColor = JSNavBackgroundColor;
    
    UINavigationBar *bar = self.navigationController.navigationBar;
    [bar setHidden:YES];
}

- (void)initTopTitle {
    
    // 不加的话，scrollview位置有问题
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _top = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenW - 64, 64)];
    _content = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, ScreenW, ScreenH - 64)];
    
    _content.backgroundColor = JSGlobalBg;
    _content.delegate = self;
    
    _top.backgroundColor = JSNavBackgroundColor;
    _top.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:_top];
    [self.view addSubview:_content];
    
    NSArray *titleArr = @[@"关注", @"头条", @"护肤", @"彩妆", @"时尚", @"专题"];
    
    for (NSInteger i = 0; i < titleArr.count; i++) {
        
        MCTopLabel *label = [[MCTopLabel alloc] initWithFrame:CGRectMake(i * 60, 20, 60, 44)];
        [_top addSubview:label];
        label.text = titleArr[i];
        label.tag = i;
        
        label.userInteractionEnabled = true;
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTap:)]];
        
        MCTopicTableViewController *vc = [[MCTopicTableViewController alloc] init];
        [self addChildViewController:vc];
        
        if (i == 1) {
            
            _selectLabel = label;
            [_selectLabel scale:1];
            vc.view.frame = CGRectMake(ScreenW, 0, ScreenW, _content.bounds.size.height);
            [_content addSubview:vc.view];
        }
        
    }
    
    _top.contentSize = CGSizeMake(60 * titleArr.count, 0);
    
    _content.contentSize = CGSizeMake(ScreenW * self.childViewControllers.count, 0);
    _content.contentOffset = CGPointMake(ScreenW, _content.contentOffset.y);
    _content.pagingEnabled = true;
    
    UIView *backIv = [[UIView alloc] initWithFrame:CGRectMake(ScreenW - 64, 0, 64, 20)];
    backIv.backgroundColor = JSNavBackgroundColor;
    [self.view addSubview:backIv];
    
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenW - 64, 20, 64, 44)];
    iv.image = [UIImage imageNamed:@"search_white"];
    iv.contentMode = UIViewContentModeCenter;
    iv.backgroundColor = JSNavBackgroundColor;
    [self.view addSubview:iv];
    
}

- (void)labelTap:(UITapGestureRecognizer *)gesture {

    MCTopLabel *label = (MCTopLabel *)gesture.view;

    [_content setContentOffset:CGPointMake(_content.frame.size.width * label.tag, _content.contentOffset.y) animated:true];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSInteger index = scrollView.contentOffset.x / ScreenW;
    
    [_selectLabel scale:0];
    MCTopLabel *label = _top.subviews[index];
    _selectLabel = label;
    [label scale:1];
    
    CGFloat offsetX = label.center.x - _top.frame.size.width * 0.5;
    CGFloat offsetMax = _top.contentSize.width - _top.frame.size.width;
    
    if (offsetX < 0) {
        offsetX = 0;
    } else if (offsetX > offsetMax) {
        offsetX = offsetMax;
    }
    
    [_top setContentOffset:CGPointMake(offsetX, _top.contentOffset.y) animated:YES];
}

@end
