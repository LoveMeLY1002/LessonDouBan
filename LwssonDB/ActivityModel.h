//
//  ActivityModel.h
//  LwssonDB
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "BaseModel.h"
#import "OwnerModel.h"
@class OwnerModel;

@interface ActivityModel : BaseModel

@property(nonatomic,copy)NSString *subcategory_name;//活动的分类

@property(nonatomic,copy)NSString *image;//显示的图片

@property(nonatomic,copy)NSString *adapt_url;//活动信息

@property(nonatomic,copy)NSString *loc_name;//活动地址

@property(nonatomic,strong)OwnerModel *user;//活动发布者

@property(nonatomic,copy)NSString *alt;//购票网址

@property(nonatomic,copy)NSString *ID;//活动 ID

@property(nonatomic,copy)NSString *category;//类别

@property(nonatomic,copy)NSString *title;//标题

@property(nonatomic,assign)NSInteger wisher_count;//评论数

@property(nonatomic,assign)BOOL *has_ticket;//是否有票

@property(nonatomic,copy)NSString *content;//活动内容

@property(nonatomic,copy)NSString *can_invite;//是否邀请

@property(nonatomic,copy)NSString *album;//唱片集

@property(nonatomic,assign)NSInteger participant_count;//参与人数

@property(nonatomic,copy)NSString *tags;//标签

@property(nonatomic,copy)NSString *begin_time;//活动开始时间

@property(nonatomic,copy)NSString *end_time;//活动结束时间

@property(nonatomic,copy)NSString *address;//活动地址
@end