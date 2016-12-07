//
//  LineChart1.m
//  chartTest
//
//  Created by foscom on 16/12/7.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "LineChart1.h"
#import "chartTest-Bridging-Header.h"
@interface LineChart1 ()

@end

@implementation LineChart1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    self.view.backgroundColor = [UIColor whiteColor];
    LineChartView *lineview = [[LineChartView alloc] initWithFrame:CGRectMake(10, 100, 300, 300)];
    
    [self.view addSubview:lineview];
    
    
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
