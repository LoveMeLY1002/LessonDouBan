//
//  ActivitydetailsViewController.m
//  LwssonDB
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "ActivitydetailsViewController.h"
#import <UMSocial.h>
#import <UMSocialSinaSSOHandler.h>
#import <UMSocialData.h>
#import <UMSocialSnsService.h>
@interface ActivitydetailsViewController ()<UMSocialUIDelegate>

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;



@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@property (strong, nonatomic) IBOutlet UILabel *activityLabel;

@property (strong, nonatomic) IBOutlet UILabel *addressLabel;

@property (strong, nonatomic) IBOutlet UILabel *acticityintroduce;

@property (strong, nonatomic) IBOutlet UIScrollView *ScrollView;

@end

@implementation ActivitydetailsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleLabel.text = self.model.title;
    self.titleLabel.numberOfLines = 0;
    self.dateLabel.text = self.model.begin_time;
    
    self.activityLabel.text = self.model.subcategory_name;
    
    self.addressLabel.text = self.model.loc_name;
    
    self.acticityintroduce.text = self.model.content;
    self.acticityintroduce.numberOfLines = 0;
    [self.imageView setImageWithURL:[NSURL URLWithString:self.model.image]];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"分享" style:(UIBarButtonItemStyleDone) target:self action:@selector(rightAction:)];
    
}


- (void)rightAction:(UIBarButtonItem *)sender
{
    
    [[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeImage url:@"http://www.baidu.com/img/bdlogo.gif"];
    [UMSocialData defaultData].extConfig.title = @"LY 的 APP";
    [UMSocialData defaultData].extConfig.qqData.url = @"http://baidu.com";
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"5776760f67e58eef7d001267"
                                      shareText:@"友盟社会化分享让您快速实现分享等社会化功能，http://www.baidu.cou/"
                                     shareImage:[UIImage imageNamed:@"icon"]
                                shareToSnsNames:@[UMShareToSina]
                                       delegate:self];
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
