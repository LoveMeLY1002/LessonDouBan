//
//  ActivityModel.m
//  LwssonDB
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "ActivityModel.h"


@implementation ActivityModel

-(NSString *)description
{
    return [NSString stringWithFormat:@"ID--%@,user---%@",self.ID,self.user];
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    }else if ([key isEqualToString:@"owner"]){
        OwnerModel *model = [[OwnerModel alloc] init];
        [model setValuesForKeysWithDictionary:value];

        _user = model;
        
    }
 
}



@end
