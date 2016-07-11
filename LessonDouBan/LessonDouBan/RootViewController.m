//
//  RootViewController.m
//  LessonDouBan
//
//  Created by CLT on 16/6/28.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "RootViewController.h"
#import "DouBanTabBar.h"

@interface RootViewController ()
@property (nonatomic, strong) DouBanTabBar *dbTabBar;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden = YES;
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"paper.png"] forState:UIControlStateNormal];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"paperH.png"] forState:UIControlStateSelected];
    btn1.backgroundColor = [UIColor greenColor];
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"video.png"] forState:UIControlStateNormal];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"videoH.png"] forState:UIControlStateSelected];
//    btn2.backgroundColor = [UIColor greenColor];
    
    self.dbTabBar = [[DouBanTabBar alloc] initWithItems:@[btn1, btn2] frame:CGRectMake(0, 100, self.view.bounds.size.width, 49)];
    NSLog(@"frame = %@", NSStringFromCGRect(self.dbTabBar.frame));
    [self.view addSubview:self.dbTabBar];
    
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
