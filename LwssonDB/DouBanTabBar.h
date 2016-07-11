//
//  DouBanTabBar.h
//  LwssonDB
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DouBanTabBar;

@protocol DouBanTabBarDeleage <NSObject>

- (void)DouBanItemDidClicked:(DouBanTabBar *)tabBar;

@end



@interface DouBanTabBar : UITabBar
//当前选中的TabBar
@property(nonatomic,assign)int currentSelected;
//当前讯中的 item
@property(nonatomic,strong)UIButton *currentSelectedItem;
//tabbar 上面所有的 item
@property(nonatomic,strong)NSArray *allItems;

@property(nonatomic,weak) id<DouBanTabBarDeleage>DouBandelagate;


//初始化方法:根据 items 初始化 items
- (id)initWithItems:(NSArray *)items frame:(CGRect)frame;

@end
