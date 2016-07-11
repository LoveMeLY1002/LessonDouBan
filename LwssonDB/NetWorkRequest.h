//
//  NetWorkRequest.h
//  LwssonDB
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "BaseRequest.h"

//成功回调
typedef void(^SuccessResponse)(NSDictionary *dic);
//失败回调
typedef void(^FailureResponse)(NSError *error);

@interface NetWorkRequest : BaseRequest

/*请求数据
 @url:请求数据的 url
 @parameterDic:请求的参数
 @success:成功回调的 block
 @failure:失败回调的 block
 */
- (void)requestWithUrl:(NSString *)url parameters:(NSDictionary *)parameterDic successResponse:(SuccessResponse)success failureresponse:(FailureResponse)failure;



- (void)sendDataWithUrl:(NSString *)url parameters:(NSDictionary *)parameterDic successResponse:(SuccessResponse)success failureresponse:(FailureResponse)failure;




- (void)sendImageWithUrl:(NSString *)url
               parameter:(NSDictionary *)parameterDic
                   image:(UIImage *)uploadImage
          successReponse:(SuccessResponse)success
         failureResponse:(FailureResponse)failure;



@end
