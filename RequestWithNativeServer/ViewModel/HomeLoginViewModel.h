//
//  HomeLoginViewModel.h
//  RequestWithNativeServer
//
//  Created by 高天翔 on 2017/9/8.
//  Copyright © 2017年 chunyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactiveCocoa.h"

@interface HomeLoginViewModel : NSObject

@property (nonatomic, strong) RACCommand* loginCommand;

@end
