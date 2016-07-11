//
//  MovieDetailModel.h
//  LessonDouBan
//
//  Created by CLT on 16/6/28.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "BaseModel.h"

@interface MovieDetailModel : BaseModel

@property (nonatomic , strong)NSDictionary *rating;//评分
@property (nonatomic , strong)NSString *summary;//简介
@property (nonatomic , strong)NSArray *genres;//分类
@property (nonatomic , strong)NSArray *countries;//国家
@property (nonatomic , strong)NSArray *durations;//时长
@property (nonatomic , copy)NSString *useful_count;//评论数
@property (nonatomic , strong)NSString *mainland_pubdate;//上映时间
@property(nonatomic,strong)NSDictionary *images;//所有图片
@property (nonatomic, copy) NSString *title; //标题


@end
