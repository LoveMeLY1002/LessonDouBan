//
//  MovieTableViewCell.h
//  LwssonDB
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import <UIKit/UIKit.h>
#define movieTableViewCell_Identifiter @"movieTableViewCell_Identifiter"
#import "movieModel.h"


@interface MovieTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *ImageView;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UILabel *starlevelLabel;

@property (strong, nonatomic) IBOutlet UILabel *showdate;

@property(nonatomic,strong)movieModel *model;



@end
