//
//  UserModel.h
//  ObjCSharedDataSample
//
//  Created by YukiOkudera on 2018/09/12.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 ユーザ画面のモデル
 */
@interface UserModel : NSObject
@property (nonatomic) NSArray <NSString *> *names;

- (instancetype)initWithNames:(NSArray <NSString *> *)names;
@end
