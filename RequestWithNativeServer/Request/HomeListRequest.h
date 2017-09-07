//
//  HomeListRequest.h
//  RequestWithNativeServer
//
//  Created by 高天翔 on 2017/9/7.
//  Copyright © 2017年 chunyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SafeUtil.h"

typedef void(^RequestSuccess)(NSURLResponse* response, id jsonData);
typedef void(^RequestError)(NSError* error);

@interface HomeListRequest : NSObject

+ (void)requestWithPage:(NSInteger)page success:(RequestSuccess)requestSuccess error:(RequestError)requestError;

@end
