//
//  OwnerModel.m
//  LwssonDB
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "OwnerModel.h"

@implementation OwnerModel

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@",self.ID];
}



-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    }
}




@end
