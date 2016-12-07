//
//  TableViewController.m
//  chartTest
//
//  Created by foscom on 16/12/7.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "TableViewController.h"
#import "BingViewController.h"
#import "LineChart.h" // 无坐标系
#import "LineChart1.h" // 有坐标系

@interface TableViewController ()
@property(nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation TableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _dataSource = [NSMutableArray new];
    
    [_dataSource addObject:@"饼状图"];
    [_dataSource addObject:@"折线图"];
    [_dataSource addObject:@"饼状图"];
    [_dataSource addObject:@"饼状图"];
    [_dataSource addObject:@"饼状图"];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( indexPath.row == 0) {
        
        BingViewController *bing = [BingViewController new];
        
        [self.navigationController pushViewController:bing animated:YES];
    }
    if ( indexPath.row == 1) {
        
        
        LineChart *line = [LineChart new];
        
        [self.navigationController pushViewController:line animated:YES];
    }
    if ( indexPath.row == 2) {
        
        
        LineChart1 *line = [LineChart1 new];
        
        [self.navigationController pushViewController:line animated:YES];
    }

    
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _dataSource[indexPath.row];
    return cell;
}


@end
