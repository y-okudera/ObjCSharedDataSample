//
//  RegistrationModel.h
//  ObjCSharedDataSample
//
//  Created by YukiOkudera on 2018/09/12.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 登録画面のモデル
 */
@interface RegistrationModel : NSObject
@property (nonatomic) BOOL mailMagazineCheck;
@property (nonatomic) BOOL agreeCheck;

- (instancetype)initWithMailMagazineCheck:(BOOL)mailMagazineCheck
                               agreeCheck:(BOOL)agreeCheck;
@end
