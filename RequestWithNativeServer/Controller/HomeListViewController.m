//
//  HomeListViewController.m
//  RequestWithNativeServer
//
//  Created by 高天翔 on 2017/9/7.
//  Copyright © 2017年 chunyu. All rights reserved.
//

#import "HomeListViewController.h"
#import "HomeListModel.h"
#import "HomeListTableView.h"
#import "NextViewController.h"

@interface HomeListViewController ()

@end

@implementation HomeListViewController

- (instancetype)initWithViewModel:(id)viewModel {
    
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    _viewModel = [[ListViewModel alloc] init];
    [self vm_setupViews];
    [self vm_bindViewModels];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - protocol

- (void)vm_setupViews {
    
    HomeListTableView* tableView = [[HomeListTableView alloc] initWithViewModel:(id)_viewModel frame:self.view.bounds];
    [self.view addSubview:tableView];
}

- (void)vm_bindViewModels {
    
    @weakify(self);
    
    [[self.viewModel.cellClickedSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(HomeListModel* listModel) {
        
        @strongify(self);
        NextViewController* controller = [[NextViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }];
    
    [[self.viewModel.pushToNextController takeUntil:self.rac_willDeallocSignal] subscribeNext:^(HomeListModel* listModel) {
       
        @strongify(self);
        NextViewController* controller = [[NextViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }];
}

@end
