//
//  MoviedetailViewController.m
//  LwssonDB
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "MoviedetailViewController.h"
#import "MovieDetailRequest.h"
#import <UMSocial.h>
#import <UMSocialSinaSSOHandler.h>
#import <UMSocialData.h>
#import <UMSocialSnsService.h>

@interface MoviedetailViewController ()<UMSocialUIDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *ImageView;

@property (strong, nonatomic) IBOutlet UILabel *commentLabel;

@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

@property (strong, nonatomic) IBOutlet UILabel *minuteLabel;

@property (strong, nonatomic) IBOutlet UILabel *classifyLabel;

@property (strong, nonatomic) IBOutlet UILabel *countriesLabel;

@property (strong, nonatomic) IBOutlet UILabel *summaryLabel;

@property (strong, nonatomic) IBOutlet UIScrollView *ScrollView;



@property(nonatomic,strong)MovieDetailModel *Dmodel;


@end

@implementation MoviedetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.model.title;
    self.dateLabel.text = self.model.pubdate;
    self.minuteLabel.text = self.model.stars;
    
    [self.ImageView setImageWithURL:[NSURL URLWithString:self.model.images[@"large"]]];
   
    self.summaryLabel.numberOfLines = 0;
    
     [self requetMovieDetailDataWith:_model.ID];
    
    
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"分享" style:(UIBarButtonItemStyleDone) target:self action:@selector(rightAction:)];
    
    
    _Dmodel = [[MovieDetailModel alloc] init];
    
    
    

    
    
}



- (void)rightAction:(UIBarButtonItem *)sender
{
    
    
    [[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeImage url:@"http://www.baidu.com/img/bdlogo.gif"];
    [UMSocialData defaultData].extConfig.title = @"分享的title";
    [UMSocialData defaultData].extConfig.qqData.url = @"http://baidu.com";
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"5776760f67e58eef7d001267"
                                      shareText:@"友盟社会化分享让您快速实现分享等社会化功能，http://umeng.com/social"
                                     shareImage:[UIImage imageNamed:@"icon"]
                                shareToSnsNames:@[UMShareToSina]
                                       delegate:self];
    
    
    
}


//电影详情
- (void)requetMovieDetailDataWith:(NSString *)ID
{

    
    MovieDetailRequest  *request = [[MovieDetailRequest alloc] init];
    
    [request movieDetailRequestWithParameter:@{@"id":ID} success:^(NSDictionary *dic) {
        
        
    [self.Dmodel setValuesForKeysWithDictionary:dic];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.ImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_Dmodel.images[@"large"]]]];
            self.commentLabel.text = [NSString stringWithFormat:@"评分: %@ (%@评论)",_Dmodel.rating[@"average"],_Dmodel.useful_count];
            
            self.dateLabel.text = _Dmodel.mainland_pubdate;
            
            
            self.minuteLabel.text = [self getStrFromArray:_Dmodel.durations];
            
            self.classifyLabel.text = [self getStrFromArray:_Dmodel.genres];
           
            self.countriesLabel.text = [self getStrFromArray:_Dmodel.countries];
            
            self.summaryLabel.text = _Dmodel.summary;
            
            self.summaryLabel.numberOfLines = 0;
            CGRect rect = _summaryLabel.frame;
            rect.size.height = [self textHeight:self.Dmodel];
            _summaryLabel.frame = rect;
            
        });
    
    } failure:^(NSError *error) {
        NSLog(@"error%@",error);
    }];
    
}


- (CGFloat)textHeight:(MovieDetailModel *)model
{
    CGRect rect = [model.summary boundingRectWithSize:CGSizeMake(398, 2000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0]} context:nil];
    
    
    return rect.size.height;
}






//数组转化成字符串
- (NSString *)getStrFromArray:(NSArray *)arr
{
    NSMutableString *mStr = [NSMutableString new];
    for (NSString *str in arr) {
        [mStr appendString:str];
    }
    return mStr;
}







@end
