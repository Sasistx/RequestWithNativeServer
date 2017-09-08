//
//  HomeLoginRequest.h
//  RequestWithNativeServer
//
//  Created by 高天翔 on 2017/9/8.
//  Copyright © 2017年 chunyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SafeUtil.h"

@interface HomeLoginRequest : NSObject

+ (void)requestWithName:(NSString *)name pwd:(NSString *)pwd success:(RequestSuccess)requestSuccess error:(RequestError)requestError;

@end
