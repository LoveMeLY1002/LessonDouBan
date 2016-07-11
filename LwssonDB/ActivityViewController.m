//
//  ActivityViewController.m
//  
//
//  Created by lanou3g on 16/6/28.
//
//

#import "ActivityViewController.h"
#import "ActivityTableViewCell.h"
#import "ActivityRequest.h"
#import "ActivityModel.h"
#import "ActivitydetailsViewController.h"
#import "GiFHUD.h"

@interface ActivityViewController ()

@property (strong, nonatomic) IBOutlet UITableView *activitytableView;

@property(nonatomic,strong)NSMutableArray *dataArray;

@end


@implementation ActivityViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.activitytableView registerNib:[UINib nibWithNibName:@"ActivityTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ActivityTableViewCell_Identifiter];
    
    [GiFHUD show];
    [GiFHUD setGifWithImageName:@"pika.gif"];
    
    [self data];
}

- (void)data
{
    self.dataArray = [NSMutableArray array];
    
    __weak typeof(self) weakSelf = self;
    
    ActivityRequest *request = [ActivityRequest new];
    [request  activityRequestparameter:nil success:^(NSDictionary *dic) {
        
        NSArray *tempEvents = [dic objectForKey:@"events"];
        
        for (NSDictionary *tempDic in tempEvents) {
            ActivityModel *model = [[ActivityModel alloc] init];
            
            [model setValuesForKeysWithDictionary:tempDic];
            
            [weakSelf.dataArray addObject:model];
        }
        
//        NSLog(@"activity%@",weakSelf.dataArray);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
           [weakSelf.activitytableView reloadData];
            
            [GiFHUD dismiss];
            
            
        });
        
    } failure:^(NSError *error) {
        NSLog(@"activity error%@",error);
        
    }];
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}


//返回 cell 的方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ActivityTableViewCell_Identifiter];
    
    ActivityModel *model = self.dataArray[indexPath.row];
    
    cell.model = model;
    
    return cell;
}




//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 150;
    
}



//cell 点击跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActivityModel *model = self.dataArray[indexPath.row];

    [self performSegueWithIdentifier:@"activityDetail" sender:model];
}





//传值
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"activityDetail"]) {
        
        ActivitydetailsViewController *detailVC = segue.destinationViewController;
        
        detailVC.model = sender;
        
        
//        NSLog(@"aaa%@",detailVC.model);
    }
}








@end
