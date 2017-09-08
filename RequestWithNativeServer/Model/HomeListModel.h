//
//  HomeListModel.h
//  RequestWithNativeServer
//
//  Created by 高天翔 on 2017/9/7.
//  Copyright © 2017年 chunyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWNModelProtocol.h"
#import "MJExtension.h"

@interface HomeListModel : NSObject <RWNModelProtocol>

@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* Id;
@property (nonatomic, copy) NSString* url;

@end
