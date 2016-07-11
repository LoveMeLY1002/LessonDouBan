//
//  LoginRequest.m
//  LwssonDB
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "LoginRequest.h"

@implementation LoginRequest

-(void)loginRequestWtihUsername:(NSString *)username password:(NSString *)password success:(SuccessResponse)success failure:(FailureResponse)failure{
    
    NetWorkRequest *reuqest = [[NetWorkRequest alloc]init];
    [reuqest sendDataWithUrl:LoginRequest_Url parameters:@{@"userName":username,@"password":password} successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureresponse:^(NSError *error) {
        failure(error);
    }];
    
}




@end
