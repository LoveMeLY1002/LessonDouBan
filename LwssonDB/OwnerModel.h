//
//  OwnerModel.h
//  LwssonDB
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "BaseModel.h"

@interface OwnerModel : BaseModel

@property(nonatomic,copy)NSString *name;//演唱会票吧
@property(nonatomic,copy)NSString *avatar;//头像
@property(nonatomic,copy)NSString *uid;//
@property(nonatomic,copy)NSString *alt;//购买票的推荐网站
@property(nonatomic,copy)NSString *type;//用户类型
@property(nonatomic,copy)NSString *ID;//活动的ID
@property(nonatomic,copy)NSString *large_avatar;//大头像

@end
