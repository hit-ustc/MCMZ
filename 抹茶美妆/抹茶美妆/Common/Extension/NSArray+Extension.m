//
//  NSArray+Extension.m
//  抹茶美妆
//
//  Created by Aesthetic92 on 16/7/12.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "NSArray+Extension.h"

@implementation NSArray (Extension)

- (NSArray *)js_getJsonArray:(NSString *)filename {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:@"json"];
    NSData *fileData = [NSData dataWithContentsOfFile:path];
    NSArray *array = [NSArray new];
    array = [NSJSONSerialization JSONObjectWithData:fileData options:NSJSONReadingMutableLeaves error:nil];
    return array;
}

@end
