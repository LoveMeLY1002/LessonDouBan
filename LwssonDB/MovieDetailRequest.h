//
//  MovieDetailRequest.h
//  LwssonDB
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieDetailRequest : NSObject

- (void)movieDetailRequestWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failuer;

@end