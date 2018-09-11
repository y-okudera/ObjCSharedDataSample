//
//  RegistrationModel.m
//  ObjCSharedDataSample
//
//  Created by YukiOkudera on 2018/09/12.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "RegistrationModel.h"

@implementation RegistrationModel

- (instancetype)initWithMailMagazineCheck:(BOOL)mailMagazineCheck
                               agreeCheck:(BOOL)agreeCheck
{
    self = [super init];
    if (self) {
        self.mailMagazineCheck = mailMagazineCheck;
        self.agreeCheck = agreeCheck;
    }
    return self;
}
@end
