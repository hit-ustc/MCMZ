//
//  MCTopicTableViewController.m
//  抹茶美妆
//
//  Created by Aesthetic92 on 16/7/12.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "MCTopicTableViewController.h"

@interface MCTopicTableViewController ()

@end

@implementation MCTopicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTableView];
}

- (void)initTableView {
    
    self.tableView.backgroundColor = [UIColor clearColor];
}

- (void)initHeaderView {
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return nil;
}


@end
