//
//  HomeListRequest.m
//  RequestWithNativeServer
//
//  Created by 高天翔 on 2017/9/7.
//  Copyright © 2017年 chunyu. All rights reserved.
//

#import "HomeListRequest.h"

@implementation HomeListRequest

+ (void)requestWithPage:(NSInteger)page success:(RequestSuccess)requestSuccess error:(RequestError)requestError {

    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* task = [session dataTaskWithURL:[NSURL URLWithString:@"http://127.0.0.1:8000/hello"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            
            NSLog(@"error:%@", error.localizedDescription);
            safe_block(requestError, error);
        } else {
            
            NSError* error = nil;
            id jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            if (error) {
                
                safe_block(requestError, error);
            } else {
                safe_block(requestSuccess, response, jsonData);
            }
        }
    }];
    [task resume];
}

@end
