//
//  UserModel.m
//  ObjCSharedDataSample
//
//  Created by YukiOkudera on 2018/09/12.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (instancetype)initWithNames:(NSArray <NSString *> *)names
{
    self = [super init];
    if (self) {
        self.names = names;
    }
    return self;
}
@end
