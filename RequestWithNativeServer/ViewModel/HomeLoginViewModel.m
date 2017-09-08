//
//  HomeLoginViewModel.m
//  RequestWithNativeServer
//
//  Created by 高天翔 on 2017/9/8.
//  Copyright © 2017年 chunyu. All rights reserved.
//

#import "HomeLoginViewModel.h"
#import "HomeLoginRequest.h"

@implementation HomeLoginViewModel

- (RACCommand *)loginCommand {

    if (!_loginCommand) {
        
        _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(NSDictionary* info) {
            
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
                NSString* name = info[@"name"];
                NSString* pwd = info[@"pwd"];
                
                [HomeLoginRequest requestWithName:name pwd:pwd success:^(NSURLResponse *response, id jsonData) {
                   
                    [subscriber sendNext:jsonData];
                    [subscriber sendCompleted];
                } error:^(NSError *error) {
                    [subscriber sendError:error];
                    [subscriber sendCompleted];
                }];
                
                return nil;
            }];
            
        }];
    }
    
    return _loginCommand;
}

@end
