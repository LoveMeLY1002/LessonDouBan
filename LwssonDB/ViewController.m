//
//  ViewController.m
//  LwssonDB
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "ViewController.h"
//1,活动
#import "ActivityRequest.h"
#import "ActivityModel.h"
#import "ActivityDetailRequest.h"

//电影
#import "MovieRequest.h"
#import "MovieDetailRequest.h"
#import "movieModel.h"

//影院
#import "TheaterRequest.h"


@interface ViewController ()
//活动
@property(nonatomic,strong)NSMutableArray *activityArray;
//电影
@property(nonatomic,strong)NSMutableArray *movieArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.activityArray = [NSMutableArray array];
    self.movieArray = [NSMutableArray array];
    
    
    [self requetActivityData];
    [self requetmovieMData];
    [self requestTheaterData];
    [self requestActivityDetailDataWith:@"26865955"];
    [self requetMovieDetailDataWith:@"26865955"];
}


//影院
- (void)requestTheaterData
{
    
   TheaterRequest  *theater = [[TheaterRequest alloc] init];
    [theater theaterRequestparameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"success-- %@",dic);
    } failure:^(NSError *error) {
//        NSLog(@"failure-- %@",error);
    }];
}



//电影
- (void)requetmovieMData
{
    __weak typeof(self) weakSelf = self;
    MovieRequest *movie = [[MovieRequest alloc] init];
    [movie movieRequestparameter:nil success:^(NSDictionary *dic) {
//        NSString *movieTitle = [dic objectForKey:@"title"];
        NSArray *tempMovies = [dic objectForKey:@"entries"];
        
        for (NSDictionary *tempDic in tempMovies) {
            movieModel *model = [movieModel new];
            
            [model setValuesForKeysWithDictionary:tempDic];
            
            [weakSelf.movieArray addObject:model];
        }
        NSLog(@"%@",weakSelf.movieArray);
        
        
    } failure:^(NSError *error) {

        
    }];
    
}

//电影详情
- (void)requetMovieDetailDataWith:(NSString *)ID
{
    MovieDetailRequest  *request = [[MovieDetailRequest alloc] init];
    
    [request movieDetailRequestWithParameter:@{@"id":ID} success:^(NSDictionary *dic) {
        NSLog(@"12311232423423%@",dic);
        
    } failure:^(NSError *error) {
        
        
    }];
    
}







//活动
- (void)requetActivityData
{
    __weak typeof(self) weakSelf = self;
    
    ActivityRequest *activity = [[ActivityRequest alloc] init];
    [activity activityRequestparameter:nil success:^(NSDictionary *dic) {
        
//        NSLog(@"success-- %@",dic);
        NSArray *events = [dic objectForKey:@"events"];
//        NSLog(@"%@",events);
        
        for (NSDictionary *tempDic in events) {
            ActivityModel *model = [[ActivityModel alloc] init];
            
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.activityArray addObject:model];
            
        }
//        NSLog(@"%@",weakSelf.activityArray);
        
    } failure:^(NSError *error) {
//        NSLog(@"failure-- %@",error);
    }];
}



//活动详情
- (void)requestActivityDetailDataWith:(NSString *)ID
{
    ActivityDetailRequest *request = [[ActivityDetailRequest alloc] init];
    [request activityDetailRequestWithParameter:@{@"id":ID} success:^(NSDictionary *dic) {
        
//        NSLog(@"success%@",dic);
        
    } failure:^(NSError *error) {

//        NSLog(@"failure%@",error);
    }];
    
}










@end
