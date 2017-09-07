//
//  HomeListTableView.m
//  RequestWithNativeServer
//
//  Created by 高天翔 on 2017/9/7.
//  Copyright © 2017年 chunyu. All rights reserved.
//

#import "HomeListTableView.h"
#import "MJRefresh.h"

@interface HomeListTableView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@end

@implementation HomeListTableView

+ (void)initialize {

    if (self == [HomeListTableView self]) {
        
        @weakify(self);
        [[[self rac_signalForSelector:@selector(initWithFrame:)] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
            
            @strongify(self);
            [self vm_setupViews];
            [self vm_bindViewModels];
        }];
    }
}

- (instancetype)initWithViewModel:(id <RWNModelProtocol> )viewModel frame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        
        self.viewModel = viewModel;
    }
    return self;
}

- (void)vm_setupViews {

    _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self addSubview:_tableView];
    [self createMJRefreshFooter];
    [self createMJRefreshHeader];
}

- (void)vm_bindViewModels {

    
}

#pragma mark -
#pragma mark - tableview delegate & datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.viewModel.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
//    LSCircleListTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithUTF8String:object_getClassName([LSCircleListTableCell class])] forIndexPath:indexPath];
//    
//    if (self.viewModel.dataArray.count > indexPath.row) {
//        
//        cell.viewModel = self.viewModel.dataArray[indexPath.row];
//    }
//    
//    return cell;
    return nil;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.viewModel.dataArray.count > indexPath.row) {
        
        [self.viewModel.cellClickedSubject sendNext:self.viewModel.dataArray[indexPath.row]];
    }
}

#pragma mark -
#pragma mark - mjrefresh

- (void)createMJRefreshHeader
{
    @weakify(self);
    MJRefreshNormalHeader* headerView = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        @strongify(self);
        [self.viewModel.refreshCommand execute:nil];

    }];
    self.tableView.mj_header = headerView;
}

- (void)createMJRefreshFooter
{
    @weakify(self);
    if (self.tableView.mj_footer == nil) {
        MJRefreshBackNormalFooter* footView = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            
            @strongify(self);
            [self.viewModel.loadmoreCommand execute:nil];
            
        }];
        self.tableView.mj_footer = footView;
    }
}

- (void)removeMJRefreshFooter{
    
    self.tableView.mj_footer = nil;
}

#pragma mark -
#pragma mark - tablview header footer status change

- (void)endTableviewHeaderLoading
{
    [self.tableView.mj_header endRefreshing];
}

- (void)endTableviewFooterLoading
{
    [self.tableView.mj_footer endRefreshing];
}

@end
