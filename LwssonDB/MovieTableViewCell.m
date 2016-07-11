//
//  MovieTableViewCell.m
//  LwssonDB
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "MovieTableViewCell.h"

@implementation MovieTableViewCell


- (void)setModel:(movieModel *)model
{
    self.titleLabel.text = model.title;
    self.starlevelLabel.text = model.stars;
    self.showdate.text = model.pubdate;
    [self.ImageView setImageWithURL:[NSURL URLWithString:model.images[@"large"]]];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
