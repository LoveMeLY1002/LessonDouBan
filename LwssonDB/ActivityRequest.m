//
//  ActivityRequest.m
//  
//
//  Created by lanou3g on 16/6/27.
//
//

#import "ActivityRequest.h"

@implementation ActivityRequest


- (void)activityRequestparameter:(NSDictionary *)parameterDic success:(SuccessResponse)success failure:(FailureResponse)failure
{
    NetWorkRequest *requst = [[NetWorkRequest alloc]init];
    [requst requestWithUrl:ActivityRequet_URL parameters:parameterDic successResponse:^(NSDictionary *dic) {
        success(dic);
        
    } failureresponse:^(NSError *error) {
        failure(error);
    }];
    
    
}

@end
