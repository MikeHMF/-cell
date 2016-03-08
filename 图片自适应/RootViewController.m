//
//  RootViewController.m
//  TestSinaCell
//
//  Created by ibokan on 12-6-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "MySinaScrollCell.h"
#import "MyCellData.h"


@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
-(void)refreshData{
    MyCellData * data1 = [[MyCellData alloc] initWithText:@"有文字有图片短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短"
                                                CellImage:[UIImage imageNamed:@"headImage.png"]];
    MyCellData * data2 = [[MyCellData alloc] initWithText:@"有文字有图片长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长片长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长片长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长片长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长片长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长片长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长"
                                                CellImage:[UIImage imageNamed:@"headImage.png"]];
    
    MyCellData * data3 = [[MyCellData alloc] initWithText:@"有文字有图片" CellImage:[UIImage imageNamed:@"headImage.png"]];    
    
    dataArr = [[NSMutableArray alloc] initWithObjects:data1,data2,data3, nil];
    
    for (int i = 0; i<5; i++) {
        MyCellData * data = [[MyCellData alloc] initWithText:@"有文字无图片" CellImage:nil];
        [dataArr addObject:data];
        [data release];
    }
    
   
    MyCellData * data4 = [[MyCellData alloc] initWithText:nil CellImage:[UIImage imageNamed:@"headImage.png"]];
    [dataArr addObject:data4];
    MyCellData * data5 = [[MyCellData alloc] initWithText:nil CellImage:[UIImage imageNamed:@"headImage.png"]];
    [dataArr addObject:data5];
    
    MyCellData * data6 = [[MyCellData alloc] initWithText:nil CellImage:nil];
    [dataArr addObject:data6];
    
   
    [data1 release];
    [data2 release];
    [data3 release];
    [data4 release];
    [data5 release];
    [data6 release];
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    UIView * aView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    aView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.view = aView;
    [aView release];
    
    UITableView * myTabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 460) style:UITableViewStylePlain];
    myTabelView.dataSource = self;
    myTabelView.delegate = self;
    myTabelView.backgroundColor = [UIColor clearColor];
    myTabelView.separatorColor = [UIColor clearColor];
    [self.view addSubview:myTabelView];
    
    [self refreshData];

}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
   
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [dataArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];  
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        /*
         //无色
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
         
         //蓝色
         cell.selectionStyle = UITableViewCellSelectionStyleBlue;
         
         //灰色
         cell.selectionStyle = UITableViewCellSelectionStyleGray;
         */
    }
    
    for (MySinaScrollCell * sinacell in cell.contentView.subviews) {
        if ([sinacell isKindOfClass:[MySinaScrollCell class]]) {
            [sinacell removeFromSuperview];
            break;
        }
    }
//    UIView * sinacellview = [cell.contentView.subviews lastObject];
//    [sinacellview removeFromSuperview];
    MySinaScrollCell * sinacell = [[MySinaScrollCell alloc] initWithFrame:CGRectZero];
    [cell.contentView addSubview:sinacell];
    MyCellData * data = [dataArr objectAtIndex:indexPath.row];
    sinacell.contentText = data.text;
    sinacell.thumbnailImage = data.cellImage;
    sinacell.headImage = data.cellImage;
    NSLog(@"+++++++++++++ %d  data.cellImage = %@",indexPath.row,data.cellImage);
    
    cell.frame = sinacell.frame;
    [sinacell release];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height+10;
}


@end
