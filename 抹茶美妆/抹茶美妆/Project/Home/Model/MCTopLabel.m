//
//  MCTopLabel.m
//  抹茶美妆
//
//  Created by Aesthetic92 on 16/7/11.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "MCTopLabel.h"

@implementation MCTopLabel


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont systemFontOfSize:16];
        self.textColor = [UIColor colorWithRed:245 green:245 blue:245 alpha:0.6];
    }
    return self;
}

- (void)scale:(NSInteger )scale {
    
    self.textColor = [UIColor colorWithRed:245 green:245 blue:245 alpha:0.6 + scale/10.0];
    self.transform = CGAffineTransformMakeScale(1.0 + scale/10.0, 1.0 + scale/10.0);
    
}

@end
