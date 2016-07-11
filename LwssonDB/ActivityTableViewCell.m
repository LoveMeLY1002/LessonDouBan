//
//  ActivityTableViewCell.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "ActivityTableViewCell.h"

@implementation ActivityTableViewCell



-(void)setModel:(ActivityModel *)model{
    
    self.titleLabel.text = model.title;
    self.dateLabel.text = [NSString stringWithFormat:@"%@-%@",model.begin_time,model.end_time];
    self.addressLabel.text = model.address;
    self.activityTypeLabel.text = model.category;
    self.interestingNumberLabel.text = [NSString stringWithFormat:@"感兴趣：%ld",model.wisher_count];
    self.joinNumberLabel.text = [NSString stringWithFormat:@"参加：%ld",model.participant_count];
    [self.activityImageView setImageWithURL:[NSURL URLWithString: model.image]];
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
