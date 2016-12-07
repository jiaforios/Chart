//
//  LineChart.m
//  chartTest
//
//  Created by foscom on 16/12/7.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "LineChart.h"
#import "chartTest-Bridging-Header.h"
@interface LineChart ()<ChartViewDelegate>

@end

@implementation LineChart

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    LineChartView *lineView = [[LineChartView alloc] initWithFrame:CGRectMake(20, 100, 300, 300)];
    
    [self.view addSubview:lineView];
    
    
    LineChartData *data = [self dataWithCount:36 range:100];
    [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:7.f]];

    NSArray *colors = @[
                        [UIColor colorWithRed:137/255.f green:230/255.f blue:81/255.f alpha:1.f],
                        [UIColor colorWithRed:240/255.f green:240/255.f blue:30/255.f alpha:1.f],
                        [UIColor colorWithRed:89/255.f green:199/255.f blue:250/255.f alpha:1.f],
                        [UIColor colorWithRed:250/255.f green:104/255.f blue:104/255.f alpha:1.f],
                        ];
    
    
    [self setupChart:lineView data:data color:colors[0]];

    
}

- (void)setupChart:(LineChartView *)chart data:(LineChartData *)data color:(UIColor *)color
{
    [(LineChartDataSet *)[data getDataSetByIndex:0] setCircleHoleColor:color];
    
    chart.delegate = self;
    chart.backgroundColor = [UIColor blueColor];
    chart.chartDescription.enabled = NO;
    
    chart.drawGridBackgroundEnabled = NO;
    chart.dragEnabled = YES;
    [chart setScaleEnabled:YES];
    chart.pinchZoomEnabled = NO;
    [chart setViewPortOffsetsWithLeft:10.0 top:0.0 right:10.0 bottom:0.0];
    
    chart.legend.enabled = NO;
    
    chart.leftAxis.enabled = NO;
    chart.leftAxis.spaceTop = 0.4;
    chart.leftAxis.spaceBottom = 0.4;
    chart.rightAxis.enabled = NO;
    chart.xAxis.enabled = NO;
    
    chart.data = data;
    
    [chart animateWithXAxisDuration:1.5];
}


- (LineChartData *)dataWithCount:(int)count range:(double)range
{
    NSMutableArray *yVals = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < count; i++)
    {
        double val = (double) (arc4random_uniform(range)) + 3;
        [yVals addObject:[[ChartDataEntry alloc] initWithX:i y:val]];
    }
    
    LineChartDataSet *set1 = [[LineChartDataSet alloc] initWithValues:yVals label:@"DataSet 1"];
    
    set1.lineWidth = 1.75;
    set1.circleRadius = 5.0;
    set1.circleHoleRadius = 2.5f;
    [set1 setColor:UIColor.whiteColor];
    [set1 setCircleColor:UIColor.whiteColor];
    set1.highlightColor = UIColor.whiteColor;
    set1.drawValuesEnabled = NO;
    
    return [[LineChartData alloc] initWithDataSet:set1];
}

#pragma mark - ChartViewDelegate

- (void)chartValueSelected:(ChartViewBase * __nonnull)chartView entry:(ChartDataEntry * __nonnull)entry highlight:(ChartHighlight * __nonnull)highlight
{
    NSLog(@"chartValueSelected");
}

- (void)chartValueNothingSelected:(ChartViewBase * __nonnull)chartView
{
    NSLog(@"chartValueNothingSelected");
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
