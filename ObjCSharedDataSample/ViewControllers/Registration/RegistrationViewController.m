//
//  RegistrationViewController.m
//  ObjCSharedDataSample
//
//  Created by YukiOkudera on 2018/09/12.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "RegistrationViewController.h"
#import "DataManager.h"
#import "RegistrationModel.h"

@interface RegistrationViewController ()
@property (weak, nonatomic) IBOutlet UILabel *usersLabel;
@property (weak, nonatomic) IBOutlet UIButton *mailMagazineCheck;
@property (weak, nonatomic) IBOutlet UIButton *agreeCheck;

@property (nonatomic) UserModel *userModel;
@end

@implementation RegistrationViewController

#pragma mark - Factory

+ (RegistrationViewController *)make {

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"RegistrationViewController" bundle:nil];
    RegistrationViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"RegistrationViewController"];
    return vc;
}

+ (RegistrationViewController *)makeWithUserModel:(UserModel *)userModel {

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"RegistrationViewController" bundle:nil];
    RegistrationViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"RegistrationViewController"];
    vc.userModel = userModel;
    return vc;
}

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    // データマネージャからuserModelを取得
    self.userModel = [DataManager shared].userModel;

    NSMutableString *mutableString = [@"" mutableCopy];
    for (NSString *name in self.userModel.names) {
        [mutableString appendString:name];
        [mutableString appendString:@"\n"];
    }
    self.usersLabel.text = mutableString.copy;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"%s", __func__);
}

#pragma mark - IBAction

- (IBAction)didTapMailMagazineCheck:(UIButton *)sender {
    [sender setSelected:!sender.isSelected];
}

- (IBAction)didTapAgreeCheck:(UIButton *)sender {
    [sender setSelected:!sender.isSelected];
}

- (IBAction)didTapRegistration:(UIButton *)sender {

    RegistrationModel *registrationModel = [[RegistrationModel alloc]
                                            initWithMailMagazineCheck:self.mailMagazineCheck.isSelected
                                            agreeCheck:self.agreeCheck.isSelected];
    [DataManager shared].registrationModel = registrationModel;

    // 登録結果を確認
    NSLog(@"mailMagazineCheck: %d", [DataManager shared].registrationModel.mailMagazineCheck);
    NSLog(@"agreeCheck: %d", [DataManager shared].registrationModel.agreeCheck);
}

@end
