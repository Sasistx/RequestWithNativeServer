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
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://127.0.0.1:8000/list?page=%zi", page]]];
    request.HTTPMethod = @"GET";
    NSURLSessionDataTask* task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
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
        });
    }];
    [task resume];
}

@end
