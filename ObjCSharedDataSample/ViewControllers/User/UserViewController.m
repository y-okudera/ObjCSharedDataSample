//
//  UserViewController.m
//  ObjCSharedDataSample
//
//  Created by YukiOkudera on 2018/09/11.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "UserViewController.h"
#import "DataManager.h"
#import "RegistrationViewController.h"
#import "UserModel.h"

@interface UserViewController () <UITextFieldDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewHeight;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic) NSMutableArray <NSString *>*users;
@end

@implementation UserViewController

#pragma mark - Life cycle

- (void)loadView {
    [super loadView];

    NSLog(@"self.contentViewHeight: %f", self.contentViewHeight.constant);

    self.contentViewHeight.constant = self.view.frame.size.height
    - UIApplication.sharedApplication.statusBarFrame.size.height
    - self.navigationController.navigationBar.frame.size.height;

    NSLog(@"self.contentViewHeight: %f", self.contentViewHeight.constant);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.users = [@[@"ユーザA", @"ユーザB", @"ユーザC", @"ユーザD"] mutableCopy];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"%s", __func__);
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

#pragma mark - IBAction

- (IBAction)didTapAddButton:(UIButton *)sender {

    if ([self.userTextField.text isEqualToString:@""]) {
        return;
    }
    [self.users addObject:self.userTextField.text];
    [self.tableView reloadData];
}

- (IBAction)didTapNextButton:(UIButton *)sender {

    NSArray<NSIndexPath *> *selectedIndexPaths =  self.tableView.indexPathsForSelectedRows;

    NSMutableArray <NSString *> *selectedUsers = [@[] mutableCopy];
    for (NSIndexPath *indexPath in selectedIndexPaths) {
        [selectedUsers addObject:self.users[indexPath.row]];
    }

    UserModel *model = [[UserModel alloc] initWithNames:selectedUsers.copy];

    [DataManager shared].userModel = model;
    RegistrationViewController *vc = [RegistrationViewController makeWithUserModel:model];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Selectors

- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    NSValue *keyboardInfo = userInfo[UIKeyboardFrameEndUserInfoKey];
    double duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];

    CGSize keyboardSize = keyboardInfo.CGRectValue.size;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0, 0, keyboardSize.height, 0);
    [UIView animateWithDuration:duration animations:^{
        self.scrollView.contentInset = contentInsets;
        self.scrollView.scrollIndicatorInsets = contentInsets;
        [self.view layoutIfNeeded];
    }];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    self.scrollView.contentInset = UIEdgeInsetsZero;
    self.scrollView.scrollIndicatorInsets = UIEdgeInsetsZero;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return true;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"
                                                            forIndexPath:indexPath];
    cell.textLabel.text = self.users[indexPath.row];
    return cell;
}

@end
