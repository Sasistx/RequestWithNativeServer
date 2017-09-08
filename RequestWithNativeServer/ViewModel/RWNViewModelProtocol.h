//
//  RWNViewModelProtocol.h
//  RequestWithNativeServer
//
//  Created by 高天翔 on 2017/9/7.
//  Copyright © 2017年 chunyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWNModelProtocol.h"
#import <UIKit/UIKit.h>

@protocol RWNViewModelProtocol <NSObject>

@optional

- (instancetype)initWithViewModel:(id <RWNModelProtocol> )viewModel;

- (instancetype)initWithViewModel:(id <RWNModelProtocol> )viewModel frame:(CGRect)frame;

@end
