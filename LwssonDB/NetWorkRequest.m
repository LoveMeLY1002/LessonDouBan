//
//  NetWorkRequest.m
//  LwssonDB
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "NetWorkRequest.h"
////成功回调
//typedef void(^SuccessResponse)(NSDictionary *dic);
////失败回调
//typedef void(^FailureResponse)(NSError *error);

@implementation NetWorkRequest

-(void)requestWithUrl:(NSString *)url parameters:(NSDictionary *)parameterDic successResponse:(SuccessResponse)success failureresponse:(FailureResponse)failure
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





- (void)sendDataWithUrl:(NSString *)url parameters:(NSDictionary *)parameterDic successResponse:(SuccessResponse)success failureresponse:(FailureResponse)failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:url parameters:parameterDic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];

    
    
    
}





//上传图片
- (void)sendImageWithUrl:(NSString *)url
               parameter:(NSDictionary *)parameterDic
                   image:(UIImage *)uploadImage
          successReponse:(SuccessResponse)success
         failureResponse:(FailureResponse)failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager new];
    
    [manager POST:url parameters:parameterDic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:UIImageJPEGRepresentation(uploadImage, 0.5) name:@"avatar" fileName:@"avatar.jpg" mimeType:@"application/octet-stream"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
    
}






@end
