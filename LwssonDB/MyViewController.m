//
//  MyViewController.m
//  LwssonDB
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "MyViewController.h"
#import "LoginViewController.h"
#import "MyHeaderTableViewCell.h"
#import "MyTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface MyViewController ()

@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property(nonatomic,strong)NSArray *titles;


@end


@implementation MyViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self addRightNavigationItem];
    
    self.titles = @[@"我的活动",@"我的电影",@"清除缓存"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_daxiang.png"]];
    
    
    [self.myTableView setBackgroundView:imageView];
    
    
    
    
    
    
    
    [self.myTableView registerNib:[UINib nibWithNibName:@"MyHeaderTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MyHeaderTableViewCell_Identify];
    
    [self.myTableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MyTableViewCell_Identify];

    
    [self removeCache];
    
}






//登录按钮
- (void)addRightNavigationItem{
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    [btn setTitle:@"登录" forState:(UIControlStateNormal)];
    
    btn.frame = CGRectMake(0, 0, 40, 30);
    
    [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    
    [btn addTarget:self action:@selector(rightBarItemCilcked:) forControlEvents:(UIControlEventTouchUpInside)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
}



//点击跳转登录页面
- (void)rightBarItemCilcked:(UIButton *)btn{
    
    UIStoryboard *mainSb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    LoginViewController *loginVC = [mainSb instantiateViewControllerWithIdentifier:@"LoginViewController"];
    
    //    UIModalTransitionStyleCoverVertical 从下到上
    //    UIModalTransitionStyleFlipHorizontal 旋转
    //    UIModalTransitionStyleCrossDissolve 闪一下
    //    UIModalTransitionStylePartialCurl 翻书的
    //    loginVC.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    
    [self presentViewController:loginVC animated:YES completion:^{
        
    }];
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==0) {
        
        MyHeaderTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:MyHeaderTableViewCell_Identify];
        
        cell.avatarimageView.image =
        
        
        [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://162.211.125.85%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"avatar"]]]]];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else{
        
        MyTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:MyTableViewCell_Identify];
        
        cell.contentLabel.text = self.titles[indexPath.row-1];
        
        if (indexPath.row == 3) {
            
            cell.subContentLabel.text = [NSString stringWithFormat:@"%.1fM",self.getFilePath];
            
        }
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
    
}




//cell点击方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [self removeCache];
        [self.myTableView reloadData];
    }
    
    if (indexPath.row == 3) {
        [self removeCache];
        [self.myTableView reloadData];
    }
}


//cell 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        return 150;
    }else{
        
        return 40;
        
    }
}




-(float)getFilePath{
    
    //文件管理
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //缓存路径
    
    NSArray *cachePaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES);
    
    NSString *cacheDir = [cachePaths objectAtIndex:0];
    
    NSArray *cacheFileList;
    
    NSEnumerator *cacheEnumerator;
    
    NSString *cacheFilePath;
    
    unsigned long long cacheFolderSize = 0;
    
    cacheFileList = [fileManager subpathsOfDirectoryAtPath:cacheDir error:nil];
    
    cacheEnumerator = [cacheFileList objectEnumerator];
    
    while (cacheFilePath = [cacheEnumerator nextObject]) {
        
        NSDictionary *cacheFileAttributes = [fileManager attributesOfItemAtPath:[cacheDir stringByAppendingPathComponent:cacheFilePath] error:nil];
        
        cacheFolderSize += [cacheFileAttributes fileSize];
        
    }
    
    //单位KB
    
    return cacheFolderSize/1024;
    
}




//清除缓存
- (void)removeCache
{
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSString *path = NSHomeDirectory();
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            //如有需要，加入条件，过滤掉不想删除的文件
            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
            [fileManager removeItemAtPath:absolutePath error:nil];
        }
    }
    
    [[SDImageCache sharedImageCache] cleanDisk];
}







@end
