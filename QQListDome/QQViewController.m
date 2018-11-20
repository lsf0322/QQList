//
//  QQViewController.m
//  QQListDome
//
//  Created by a a a a a on 13-1-5.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "QQViewController.h"

@implementation QQViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

/*
- (void)loadView
{
}
*/
- (void)viewDidLoad
{
    [super viewDidLoad];
    tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 460) style:UITableViewStyleGrouped];
    tableview.dataSource=self;
    tableview.delegate=self;
    [self.view addSubview:tableview];
    array=[[NSMutableArray alloc]init];
    
    
    for(NSInteger section='A';section<='Z';section++)
    {
        NSMutableDictionary *subdir=[NSMutableDictionary dictionary];
        NSMutableArray *arr=[NSMutableArray arrayWithCapacity:0];
        for(int i=0;i<5;i++)
        {
            [arr addObject:[NSString stringWithFormat:@"%c%d",section,i]];
        }
        [subdir setObject:arr forKey:COUNT_STR];
        [subdir setObject:[NSString stringWithFormat:@"%c组",section] forKey:GROUP_NAME];
        [subdir setObject:[NSNumber numberWithBool:NO] forKey:GROUP_STATE];
        [array addObject:subdir];
    }
}
//多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [array count];
}
//多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dir=[array objectAtIndex:section];
    NSNumber *state=[dir objectForKey:GROUP_STATE];
    if([state boolValue])
    {
        return [[dir objectForKey:COUNT_STR] count];
    }
    return 0;
}
//每一行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSDictionary *dir3=[array objectAtIndex:indexPath.section];
    NSArray *array3=[dir3 objectForKey:COUNT_STR];
    cell.textLabel.text=[array3 objectAtIndex:indexPath.row];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    NSDictionary *dir=[array objectAtIndex:section];
    [button setTitle:[dir objectForKey:GROUP_NAME] forState:UIControlStateNormal];
    button.frame=CGRectMake(0, 0, 320, 30);
    if(section%2==0)
    {
        button.backgroundColor=[UIColor yellowColor];
    }
    else
    {
        button.backgroundColor=[UIColor blueColor];
    }
    button.tag=section+100;
    [button addTarget:self action:@selector(button_click:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

-(void)button_click:(UIButton *)sender
{
    NSMutableDictionary *dir=[array objectAtIndex:sender.tag-100];
    NSNumber *stat=[dir objectForKey:GROUP_STATE];
    if([stat boolValue])
    {
        [dir setObject:[NSNumber numberWithBool:NO] forKey:GROUP_STATE];   
    }
    else
    {
        [dir setObject:[NSNumber numberWithBool:YES] forKey:GROUP_STATE]; 
    }
    //刷新指定组的数据
    [tableview reloadSections:[NSIndexSet indexSetWithIndex:sender.tag-100] withRowAnimation:UITableViewRowAnimationFade];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
