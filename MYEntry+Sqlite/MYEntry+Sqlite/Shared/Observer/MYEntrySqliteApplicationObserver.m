//
//  MYEntrySqliteApplicationObserver.m
//  MYFrameworkDemo
//
//  Created by Whirlwind on 13-2-16.
//  Copyright (c) 2013年 BOOHEE. All rights reserved.
//

#import "MYEntrySqliteApplicationObserver.h"
#import "MYDbManager.h"

@implementation MYEntrySqliteApplicationObserver

- (void)migrateUserDatabase:(NSNotification *)ntf {
    MYDbManager *db = [[MYDbManager alloc] init];
    [db migrateUserDatabase:ntf];
}
@end
