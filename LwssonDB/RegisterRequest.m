//
//  RegisterRequest.m
//  LwssonDB
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "RegisterRequest.h"

@implementation RegisterRequest

- (void)registerWithName:(NSString *)name
                password:(NSString *)password
                  avator:(UIImage *)image
                 success:(SuccessResponse)success
                 failure:(FailureResponse)failure{
  
    NSDictionary *parameter = @{@"userName":name, @"password":password};
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    [request sendImageWithUrl:RegisterRequest_Url parameter:parameter image:image successReponse:^(NSDictionary *dic) {
        success(dic);
        
    } failureResponse:^(NSError *error) {
        failure(error);
        
    }];
}

    






@end
