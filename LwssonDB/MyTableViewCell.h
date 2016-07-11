//
//  MyTableViewCell.h
//  LwssonDB
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import <UIKit/UIKit.h>

//#define MyTableViewCell_Identify @"MyTableViewCell_Identify"

#define MyTableViewCell_Identify @"MyTableViewCell_Identify"

@interface MyTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *contentLabel;

@property (strong, nonatomic) IBOutlet UILabel *subContentLabel;

@end
