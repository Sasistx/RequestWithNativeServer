//
//  HomeListModel.m
//  RequestWithNativeServer
//
//  Created by 高天翔 on 2017/9/7.
//  Copyright © 2017年 chunyu. All rights reserved.
//

#import "HomeListModel.h"

@implementation HomeListModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"Id" : @"id",
             @"Description":@"description"
             };
}

+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    NSDictionary *d = [self mj_replacedKeyFromPropertyName];
    NSString *key = d[propertyName];
    if (key) return key;
    return [propertyName mj_underlineFromCamel];
}

@end
