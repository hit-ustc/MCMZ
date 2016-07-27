//
//  NSString+Extension.m
//  抹茶美妆
//
//  Created by Aesthetic92 on 16/7/12.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

/**
 *  快速返回沙盒中，Documents文件的路径
 *
 *  @return Documents文件的路径
 */
+ (NSString *)js_pathForDocuments
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

/**
 *  快速返回Documents文件中某个子文件的路径
 *
 *  @param fileName 子文件名称
 *
 *  @return 快速返回Documents文件中某个子文件的路径
 */
+ (NSString *)js_filePathAtDocumentsWithFileName:(NSString *)fileName
{
    return  [[self js_pathForDocuments] stringByAppendingPathComponent:fileName];
}

/**
 *  快速返回沙盒中Library下Caches文件的路径
 *
 *  @return 快速返回沙盒中Library下Caches文件的路径
 */
+ (NSString *)js_pathForCaches
{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)js_filePathAtCachesWithFileName:(NSString *)fileName
{
    return [[self js_pathForCaches] stringByAppendingPathComponent:fileName];
}

/**
 *  快速返回MainBundle(资源捆绑包的)的路径
 *
 *  @return 快速返回MainBundle(资源捆绑包的)的路径
 */
+ (NSString *)js_pathForMainBundle
{
    return [NSBundle mainBundle].bundlePath;
}

/**
 *  快速返回MainBundle(资源捆绑包的)下文件的路径
 *
 *  @param fileName MainBundle(资源捆绑包的)下的文件名
 *
 *  @return 快速返回MainBundle(资源捆绑包的)下文件的路径
 */
+ (NSString *)js_filePathAtMainBundleWithFileName:(NSString *)fileName
{
    return [[self js_pathForMainBundle] stringByAppendingPathComponent:fileName];
}

/**
 *  快速返回沙盒中tmp(临时文件)文件的路径
 *
 *  @return 快速返回沙盒中tmp文件的路径
 */
+ (NSString *)js_pathForTemp
{
    return NSTemporaryDirectory();
}

/**
 *  快速返回沙盒中，temp文件中某个子文件的路径
 *
 *  @param fileName 子文件名
 *
 *  @return 快速返回temp文件中某个子文件的路径
 */
+ (NSString *)js_filePathAtTempWithFileName:(NSString *)fileName
{
    return [[self js_pathForTemp] stringByAppendingPathComponent:fileName];
}

/**
 *  快速返回沙盒中，Library下Preferences文件的路径
 *
 *  @return 快速返回沙盒中Library下Caches文件的路径
 */
+ (NSString *)js_pathForPreferences
{
    return [NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES) lastObject];
}

/**
 *  快速返回沙盒中，Library下Preferences文件中某个子文件的路径
 *
 *  @param fileName 子文件名称
 *
 *  @return 快速返回Preferences文件中某个子文件的路径
 */
+ (NSString *)js_filePathAtPreferencesWithFileName:(NSString *)fileName
{
    return [[self js_pathForPreferences] stringByAppendingPathComponent:fileName];
}

/**
 *  快速你指定的系统文件的路径
 *
 *  @param directory NSSearchPathDirectory枚举
 *
 *  @return 快速你指定的系统文件的路径
 */
+ (NSString *)js_pathForSystemFile:(NSSearchPathDirectory)directory
{
    return [NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES) lastObject];
}

/**
 *  快速返回沙盒中，你指定的系统文件的中某个子文件的路径。tmp文件除外，请使用filePathAtTempWithFileName
 *
 *  @param directory 你指的的系统文件
 *  @param fileName  子文件名
 *
 *  @return 快速返回沙盒中，你指定的系统文件的中某个子文件的路径
 */
+ (NSString *)js_filePathForSystemFile:(NSSearchPathDirectory)directory withFileName:(NSString *)fileName
{
    return [[self js_pathForSystemFile:directory] stringByAppendingPathComponent:fileName];
}


@end
