//
//  ViewController.m
//  RequestWithNativeServer
//
//  Created by 高天翔 on 2017/8/29.
//  Copyright © 2017年 chunyu. All rights reserved.
//

#import "ViewController.h"
#import "HomeListViewController.h"
#import "HomeLoginViewModel.h"

@interface ViewController ()

@property (nonatomic, strong) UITextField* nameTextField;
@property (nonatomic, strong) UITextField* pwdTextField;
@property (nonatomic, strong) UIButton* loginButton;
@property (nonatomic, strong) HomeLoginViewModel* viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _viewModel = [[HomeLoginViewModel alloc] init];
    
    _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 200, [UIScreen mainScreen].bounds.size.width - 200, 35)];
    _nameTextField.placeholder = @"name";
    [self.view addSubview:_nameTextField];
    
    _pwdTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 260, [UIScreen mainScreen].bounds.size.width - 200, 35)];
    _pwdTextField.placeholder = @"pwd";
    [self.view addSubview:_pwdTextField];
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_loginButton setFrame:CGRectMake(150, 310, [UIScreen mainScreen].bounds.size.width - 300, 40)];
    [_loginButton setTitle:@"login" forState:UIControlStateNormal];
    [_loginButton setTitle:@"(null)" forState:UIControlStateDisabled];
    [_loginButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    @weakify(self);
    [[[_loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
       
        @strongify(self);
        [[self.viewModel.loginCommand execute:@{@"name":self.nameTextField.text, @"pwd":self.pwdTextField.text}] subscribeNext:^(id x) {
            
            HomeListViewController* controller = [[HomeListViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];

        } error:^(NSError *error) {
            
            NSLog(@"login error : %@", error);
        }];
    }];
    [self.view addSubview:_loginButton];
    
    RAC(_loginButton, enabled) = [RACSignal combineLatest:@[_nameTextField.rac_textSignal, _pwdTextField.rac_textSignal] reduce:^(NSString* name, NSString* pwd) {
        
        return @(name.length > 3 && pwd.length > 3);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - protocol

- (void)vm_setupViews {

}

- (void)vm_bindViewModels {

    
}

- (void)vm_getDataForViewWillAppear {

    
}



@end
