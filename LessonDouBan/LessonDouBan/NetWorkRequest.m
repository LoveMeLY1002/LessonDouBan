//
//  NetWorkRequest.m
//  LessonDouBan
//
//  Created by CLT on 16/6/27.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "NetWorkRequest.h"



@implementation NetWorkRequest

- (void)requestWithUrl:(NSString *)url
            parameters:(NSDictionary *)parameterDic
       successResponse:(SuccessResponse)success
       failureResponse:(FailureResponse)failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];

    [manager GET:url parameters:parameterDic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
   
}

@end
