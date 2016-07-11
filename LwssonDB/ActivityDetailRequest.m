//
//  ActivityDetailRequest.m
//  LwssonDB
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "ActivityDetailRequest.h"

@implementation ActivityDetailRequest


- (void)activityDetailRequestWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failuer
{
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    
    NSString *ID = [parameter objectForKey:@"id"];
    
    [request requestWithUrl:ActivityDetailRequest_url(ID) parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureresponse:^(NSError *error) {
        failuer(error);
    }];
    
}
    


@end
