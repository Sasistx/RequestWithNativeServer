//
//  HomeListViewController.h
//  RequestWithNativeServer
//
//  Created by 高天翔 on 2017/9/7.
//  Copyright © 2017年 chunyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RWNViewModelProtocol.h"
#import "ListViewModel.h"

@interface HomeListViewController : UIViewController <RWNViewModelProtocol>

@property (nonatomic, strong) ListViewModel* viewModel;

@end
