//
//  ListViewModel.h
//  RequestWithNativeServer
//
//  Created by 高天翔 on 2017/9/7.
//  Copyright © 2017年 chunyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeListModel.h"
#import "RWNViewModelProtocol.h"
#import "RWNModelProtocol.h"
#import "ReactiveCocoa.h"

@interface ListViewModel : NSObject

@property (nonatomic, strong) HomeListModel* listModel;

@property (nonatomic, strong) RACCommand* refreshCommand;

@property (nonatomic, strong) RACCommand* loadmoreCommand;

@property (nonatomic, strong) RACSubject* cellClickedSubject;

@property (nonatomic, strong) RACSubject* refreshTableView;

@property (nonatomic, strong) RACSubject* pushToNextController;

@property (nonatomic, strong) NSMutableArray <HomeListModel *> * dataArray;

@property (nonatomic) NSInteger page;

@end
