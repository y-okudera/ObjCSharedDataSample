//
//  DataManager.m
//  ObjCSharedDataSample
//
//  Created by YukiOkudera on 2018/09/12.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

#pragma mark - Singleton

+ (instancetype)shared {

    static DataManager *dataManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataManager = [[self alloc] init];
    });
    return dataManager;
}

#pragma mark - Init

- (instancetype)init {

    self = [super init];
    return self;
}
@end
