//
//  movieModel.m
//  LwssonDB
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "movieModel.h"

@implementation movieModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    }
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"ID = %@,image = %@",self.ID,self.images];
}


@end
