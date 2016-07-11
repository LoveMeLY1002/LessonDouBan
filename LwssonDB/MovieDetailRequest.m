//
//  MovieDetailRequest.m
//  LwssonDB
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "MovieDetailRequest.h"

@implementation MovieDetailRequest

- (void)movieDetailRequestWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failuer
{
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    
    NSString *ID = [parameter objectForKey:@"id"];
    
    [request requestWithUrl:MovieDetailRequet_url(ID) parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureresponse:^(NSError *error) {
        failuer(error);
    }];
    
}

@end
