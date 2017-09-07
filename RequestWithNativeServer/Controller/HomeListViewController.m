//
//  HomeListViewController.m
//  RequestWithNativeServer
//
//  Created by 高天翔 on 2017/9/7.
//  Copyright © 2017年 chunyu. All rights reserved.
//

#import "HomeListViewController.h"
#import "HomeListModel.h"

@interface HomeListViewController ()

@end

@implementation HomeListViewController

+ (void)initialize {
    
    if (self == [HomeListViewController self]) {
        
        @weakify(self);
        [[[self rac_signalForSelector:@selector(viewDidLoad)] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
            
            @strongify(self);
            [self vm_setupViews];
            [self vm_bindViewModels];
        }];
        
        [[[self rac_signalForSelector:@selector(viewWillAppear:)] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
            
            @strongify(self);
            [self vm_getDataForViewWillAppear];
        }];
    }
}

- (instancetype)initWithViewModel:(id<RWNModelProtocol>)viewModel {
    
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
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
    
    @weakify(self);
    
    [[self.viewModel.cellClickedSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(HomeListModel* listModel) {
        
    }];
    
    [[self.viewModel.pushToNextController takeUntil:self.rac_willDeallocSignal] subscribeNext:^(HomeListModel* listModel) {
       
        
    }];
}

- (void)vm_getDataForViewWillAppear {
    
    
}

@end
