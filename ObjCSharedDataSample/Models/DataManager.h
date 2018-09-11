//
//  DataManager.h
//  ObjCSharedDataSample
//
//  Created by YukiOkudera on 2018/09/12.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
#import "RegistrationModel.h"

@interface DataManager : NSObject
+ (instancetype)shared;

/// ユーザ画面のモデルオブジェクト
@property (nonatomic) UserModel *userModel;

/// 登録画面のモデルオブジェクト
@property (nonatomic) RegistrationModel *registrationModel;
@end
