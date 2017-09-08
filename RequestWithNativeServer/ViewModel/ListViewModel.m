//
//  ListViewModel.m
//  RequestWithNativeServer
//
//  Created by 高天翔 on 2017/9/7.
//  Copyright © 2017年 chunyu. All rights reserved.
//

#import "ListViewModel.h"
#import "HomeListRequest.h"

@implementation ListViewModel

- (instancetype)init {

    self = [super init];
    if (self) {
        _dataArray = [NSMutableArray array];
    }
    return self;
}

- (NSDictionary *)requestWithId:(NSString *)Id currentPage:(NSInteger)page {

    
    
    return nil;
}

- (RACCommand *)refreshCommand {

    if (!_refreshCommand) {
        
        @weakify(self);
        _refreshCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
           
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
               
                @strongify(self);
                self.page = 0;

                [HomeListRequest requestWithPage:self.page success:^(NSURLResponse *response, id jsonData) {
                    
                    [subscriber sendNext:jsonData];
                    [subscriber sendCompleted];
                } error:^(NSError *error) {
                    
                    [subscriber sendError:error];
                    [subscriber sendCompleted];
                }];
                
                return nil;
            }];
        }];
    }
    
    return _refreshCommand;
}

- (RACCommand *)loadmoreCommand {

    if (!_loadmoreCommand) {
        
        @weakify(self);
        _loadmoreCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
               
                @strongify(self);
                self.page += 1;
                
                [HomeListRequest requestWithPage:self.page success:^(NSURLResponse *response, id jsonData) {
                    
                    [subscriber sendNext:jsonData];
                    [subscriber sendCompleted];
                } error:^(NSError *error) {
                    
                    [subscriber sendError:error];
                    [subscriber sendCompleted];
                }];
                
                return nil;
            }];
        }];
    }
    
    return _loadmoreCommand;
}

- (RACSubject *)cellClickedSubject {

    if (!_cellClickedSubject) {
        
        _cellClickedSubject = [[RACSubject alloc] init];
    }
    
    return _cellClickedSubject;
}

- (RACSubject *)refreshTableView {

    if (!_refreshTableView) {
        
        _refreshTableView = [[RACSubject alloc] init];
    }
    
    return _refreshTableView;
}

- (RACSubject *)pushToNextController {

    if (!_pushToNextController) {
        
        _pushToNextController = [[RACSubject alloc] init];
    }
    
    return _pushToNextController;
}

@end
