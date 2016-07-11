//
//  RootViewControllers.m
//  LwssonDB
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "RootViewControllers.h"
#import "DouBanTabBar.h"


@interface RootViewControllers ()<DouBanTabBarDeleage>

@property(nonatomic,strong)DouBanTabBar *dbTabBar;

@end


@implementation RootViewControllers

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.tabBar.hidden = YES;
    
    [self addButton];
    
   //代理
    self.dbTabBar.DouBandelagate = self;
    
}

- (void)addButton
     {
         UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
         [btn1 setImage:[UIImage imageNamed:@"paper.png"] forState:(UIControlStateNormal)];
         [btn1 setTitle:@"活动" forState:(UIControlStateNormal)];
         btn1.titleLabel.font = [UIFont systemFontOfSize:13];
         [btn1 setImageEdgeInsets:(UIEdgeInsetsMake(0, 0, 15, -15))];
         [btn1 setTitleEdgeInsets:(UIEdgeInsetsMake(0, -34, -30, 15))];
         [btn1 setImage:[UIImage imageNamed:@"paperH.png"] forState:(UIControlStateSelected)];
         
         
         UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
         [btn2 setImage:[UIImage imageNamed:@"video.png"] forState:(UIControlStateNormal)];
         [btn2 setTitle:@"电影" forState:(UIControlStateNormal)];
          btn2.titleLabel.font = [UIFont systemFontOfSize:13];
         [btn2 setImageEdgeInsets:(UIEdgeInsetsMake(0, 0, 15, -15))];
         [btn2 setTitleEdgeInsets:(UIEdgeInsetsMake(0, -34, -30, 15))];
         [btn2 setImage:[UIImage imageNamed:@"videoH.png"] forState:(UIControlStateSelected)];
         
         
         UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
         [btn3 setImage:[UIImage imageNamed:@"2image.png"] forState:(UIControlStateNormal)];
         [btn3 setTitle:@"影院" forState:(UIControlStateNormal)];
         btn3.titleLabel.font = [UIFont systemFontOfSize:13];
         [btn3 setImageEdgeInsets:(UIEdgeInsetsMake(0, 0, 15, -15))];
         [btn3 setTitleEdgeInsets:(UIEdgeInsetsMake(0, -34, -30, 15))];
         [btn3 setImage:[UIImage imageNamed:@"2imageH.png"] forState:(UIControlStateSelected)];
         
         
         UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
         [btn4 setImage:[UIImage imageNamed:@"person.png"] forState:(UIControlStateNormal)];
         [btn4 setTitle:@"我的" forState:(UIControlStateNormal)];
         btn4.titleLabel.font = [UIFont systemFontOfSize:13];
         [btn4 setImageEdgeInsets:(UIEdgeInsetsMake(0, 0, 15, -15))];
         [btn4 setTitleEdgeInsets:(UIEdgeInsetsMake(0, -34, -30, 15))];
         [btn4 setImage:[UIImage imageNamed:@"personH.png"] forState:(UIControlStateSelected)];
         
         
         self.dbTabBar = [[DouBanTabBar alloc] initWithItems:@[btn1,btn2,btn3,btn4] frame:CGRectMake(0, self.view.frame.size.height-49, self.view.frame.size.width, 49)];
         
//         NSLog(@"fram = %@",NSStringFromCGRect(self.dbTabBar.frame));
         [self.view addSubview:self.dbTabBar];
         
         
         
     }
     
     
- (void)DouBanItemDidClicked:(DouBanTabBar *)tabBar
{
    self.selectedIndex = tabBar.currentSelected;
    
}




@end
