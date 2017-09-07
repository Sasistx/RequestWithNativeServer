//
//  HomeListTableView.h
//  RequestWithNativeServer
//
//  Created by 高天翔 on 2017/9/7.
//  Copyright © 2017年 chunyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListViewModel.h"
#import "RWNViewModelProtocol.h"

@interface HomeListTableView : UIView <RWNViewModelProtocol>

@property (nonatomic, strong) ListViewModel* viewModel;

@end
