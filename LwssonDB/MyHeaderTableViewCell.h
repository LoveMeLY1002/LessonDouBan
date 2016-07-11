//
//  MyHeaderTableViewCell.h
//  LwssonDB
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import <UIKit/UIKit.h>
//MyHeaderTableViewCell的重用标识符
#define MyHeaderTableViewCell_Identify @"MyHeaderTableViewCell_Idenfity"

@interface MyHeaderTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *avatarimageView;

@property (strong, nonatomic) IBOutlet UILabel *username;


@end
