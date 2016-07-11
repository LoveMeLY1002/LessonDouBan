//
//  ActivityRequest.h
//  
//
//  Created by lanou3g on 16/6/27.
//
//

#import <Foundation/Foundation.h>

@interface ActivityRequest : NSObject

- (void)activityRequestparameter:(NSDictionary *)parameterDic success:(SuccessResponse)success failure:(FailureResponse)failure;


@end
