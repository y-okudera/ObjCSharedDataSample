//
//  RegistrationViewController.h
//  ObjCSharedDataSample
//
//  Created by YukiOkudera on 2018/09/12.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

/**
 登録画面
 */
@interface RegistrationViewController : UIViewController

/// 値渡し無しの場合
+ (RegistrationViewController *)make;

/// 値渡し有りの場合
+ (RegistrationViewController *)makeWithUserModel:(UserModel *)userModel;
@end
