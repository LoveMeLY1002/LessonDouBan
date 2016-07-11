//
//  MovieViewController.m
//  LwssonDB
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieTableViewCell.h"
#import "movieModel.h"
#import "MovieRequest.h"
#import "MoviedetailViewController.h"
#import "MovieDetailModel.h"

@interface MovieViewController ()

@property(nonatomic,strong)NSMutableArray *dataArray;

@property (strong, nonatomic) IBOutlet UITableView *movieTableView;

@end


@implementation MovieViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.movieTableView registerNib:[UINib nibWithNibName:@"MovieTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:movieTableViewCell_Identifiter];
    
    [self data];
}




//解析数据
- (void)data
{
    self.dataArray = [NSMutableArray array];
    
    __weak typeof(self) weakSelf = self;
    
    MovieRequest *movie = [[MovieRequest alloc] init];
    
    [movie movieRequestparameter:nil success:^(NSDictionary *dic) {
        
        NSArray *tempMovie = [dic objectForKey:@"entries"];
        
        for (NSDictionary *tempDic in tempMovie) {
            
            movieModel *model = [movieModel new];
            
            [model setValuesForKeysWithDictionary:tempDic];
            
            [weakSelf.dataArray addObject:model];
        }
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [weakSelf.movieTableView reloadData];
        });

    } failure:^(NSError *error) {
    }];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:movieTableViewCell_Identifiter];
    
    movieModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieDetailModel *model = self.dataArray[indexPath.row];
    
    [self performSegueWithIdentifier:@"movieDetail" sender:model];
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"movieDetail"]) {
        
        MoviedetailViewController *movieVC = segue.destinationViewController;

        movieVC.model = sender;
        
//        NSLog(@"~~~~%@",movieVC.model);
        
    }
    
}





@end
