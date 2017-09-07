//
//  ViewController.m
//  RequestWithNativeServer
//
//  Created by 高天翔 on 2017/8/29.
//  Copyright © 2017年 chunyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

+ (void)initialize {

    if (self == [ViewController self]) {
        
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

    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* task = [session dataTaskWithURL:[NSURL URLWithString:@"http://127.0.0.1:8000/hello"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            
            NSLog(@"error:%@", error.localizedDescription);
        } else {
            NSString* json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"response:%@", json);
        }
    }];
    [task resume];
    
    NSDictionary* dict = @{@"1":@"2"};
    NSMutableDictionary* dic = [NSMutableDictionary dictionaryWithDictionary:dict];
    dic[@"1"] = @"3";
    NSLog(@"%@--%@", dict, dic);
    
    UIButton* button = [[UIButton alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - protocol

- (void)vm_setupViews {

    UITableView* tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    
}

- (void)vm_bindViewModels {

    
}

- (void)vm_getDataForViewWillAppear {

    
}



@end
