//
//  QQViewController.h
//  QQListDome
//
//  Created by a a a a a on 13-1-5.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//内容
#define COUNT_STR @"COUNT_STR"
//组名
#define GROUP_NAME @"GROUP_NAME"
//状态
#define GROUP_STATE @"GROUP_STATE"

@interface QQViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableview;
    NSMutableArray *array;
}
-(void)button_click:(UIButton *)sender;
@end
