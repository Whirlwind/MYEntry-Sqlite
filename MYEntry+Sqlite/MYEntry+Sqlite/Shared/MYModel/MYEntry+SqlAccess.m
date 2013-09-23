//
//  MYEntry+SqlAccess.m
//  MYFrameworkDemo
//
//  Created by Whirlwind on 13-2-27.
//  Copyright (c) 2013年 BOOHEE. All rights reserved.
//

#import "MYEntry+SqlAccess.h"
#import "MYDbManager.h"

@implementation MYEntry (SqlAccess)

+ (NSMutableDictionary *)sharedDbFieldNameToPropertyNameTable
{
    static dispatch_once_t once;
    static NSMutableDictionary * __sharedDbFieldNameToPropertyNameTable__;
    dispatch_once( &once, ^{ __sharedDbFieldNameToPropertyNameTable__ = [[NSMutableDictionary alloc] init]; } );
    NSString *table = [self tableName];
    NSMutableDictionary *value = [__sharedDbFieldNameToPropertyNameTable__ valueForKey:table];
    if (!value) {
        value = [[NSMutableDictionary alloc] init];
        [__sharedDbFieldNameToPropertyNameTable__ setValue:value forKey:table];
    }
    return value;
}

+ (NSMutableDictionary *)sharedPropertyNameToDbFieldNameTable
{
    static dispatch_once_t once;
    static NSMutableDictionary * __sharedPropertyNameToDbFieldNameTable__;
    dispatch_once( &once, ^{ __sharedPropertyNameToDbFieldNameTable__ = [[NSMutableDictionary alloc] init]; } );
    NSString *table = [self tableName];
    NSMutableDictionary *value = [__sharedPropertyNameToDbFieldNameTable__ valueForKey:table];
    if (!value) {
        value = [[NSMutableDictionary alloc] init];
        [__sharedPropertyNameToDbFieldNameTable__ setValue:value forKey:table];
    }
    return value;
}

+ (NSString *)convertPropertyNameToDbFieldName:(NSString *)name {
    NSMutableDictionary *dic = [self sharedPropertyNameToDbFieldNameTable];
    NSString *value = [dic valueForKey:name];
    if (value) {
        return value;
    }
    if ([name isEqualToString:@"index"]) {
        value = @"id";
    }
    value = [self convertAppleStylePropertyToRailsStyleProperty:name];
    [dic setValue:value forKey:name];
    return value;
}

+ (NSString *)convertDbFieldNameToPropertyName:(NSString *)name {
    NSMutableDictionary *dic = [self sharedDbFieldNameToPropertyNameTable];
    NSString *value = [dic valueForKey:name];
    if (value) {
        return value;
    }
    if ([name isEqualToString:@"id"]) {
        value = @"index";
    }
    value = [self convertRailsStylePropertyToAppleStyleProperty:name];
    [dic setValue:value forKey:name];
    return value;
}

+ (NSString *)tableName {
    return [self convertAppleStylePropertyToRailsStyleProperty:NSStringFromClass([self class])];
}

+ (FMDatabaseQueue *)dbQueue {
    return [MYDbManager sharedDbQueue];
}

@end
