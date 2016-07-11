//
//  TheaterRequest.m
//  LwssonDB
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "TheaterRequest.h"

@implementation TheaterRequest

- (void)theaterRequestparameter:(NSDictionary *)parameterDic success:(SuccessResponse)success failure:(FailureResponse)failure
{
    NetWorkRequest *requst = [[NetWorkRequest alloc]init];
    [requst requestWithUrl:TheaterRequet_URL parameters:parameterDic successResponse:^(NSDictionary *dic) {
        success(dic);
        
    } failureresponse:^(NSError *error) {
        failure(error);
    }];
    
    
}


@end
