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
    
    lineview.noDataText = @"暂时没有数据";
    
    // 设置交互样式
    lineview.scaleYEnabled = NO;//取消Y轴缩放
    lineview.doubleTapToZoomEnabled = NO;//取消双击缩放
    lineview.dragEnabled = YES;//启用拖拽图标
    lineview.dragDecelerationEnabled = YES;//拖拽后是否有惯性效果
    lineview.dragDecelerationFrictionCoef = 0.9;//拖拽后惯性效果的摩擦系数(0~1)，数值越小，惯性越不明显
    
    // 设置X轴
    ChartXAxis *xAxis = lineview.xAxis;
    xAxis.axisLineWidth = 1.0/[UIScreen mainScreen].scale;//设置X轴线宽
    xAxis.labelPosition = XAxisLabelPositionBottom;//X轴的显示位置，默认是显示在上面的
    xAxis.drawGridLinesEnabled = NO;//不绘制网格线
    xAxis.spaceMin = 4;
    xAxis.labelTextColor = [UIColor redColor];//label文字颜色
    xAxis.axisMinimum = 0;
    
    // 设置Y轴样式
    lineview.rightAxis.enabled = NO;//不绘制右边轴
//    ChartYAxis *leftAxis = lineview.leftAxis;//获取左边Y轴
//    leftAxis.labelCount = 5;//Y轴label数量，数值不一定，如果forceLabelsEnabled等于YES, 则强制绘制制定数量的label, 但是可能不平均
//    leftAxis.forceLabelsEnabled = NO;//不强制绘制指定数量的label
////    leftAxis.showOnlyMinMaxEnabled = NO;//是否只显示最大值和最小值
//
//    leftAxis.axisMinValue = 0;//设置Y轴的最小值
////    leftAxis.startAtZeroEnabled = YES;//从0开始绘制
//    leftAxis.axisMaxValue = 105;//设置Y轴的最大值
//    leftAxis.axisMaximum = 150;
//    leftAxis.axisMinimum = 0;
//    leftAxis.inverted = NO;//是否将Y轴进行上下翻转
//    leftAxis.axisLineWidth = 1.0/[UIScreen mainScreen].scale;//Y轴线宽
//    leftAxis.axisLineColor = [UIColor blackColor];//Y轴颜色
//    leftAxis.valueFormatter = [[ChartIndexAxisValueFormatter alloc] init];//自定义格式
    
    ChartYAxis *leftAxis = lineview.leftAxis;
    leftAxis.labelTextColor = [UIColor colorWithRed:51/255.f green:181/255.f blue:229/255.f alpha:1.f];
    leftAxis.axisMaximum = 200.0;
    leftAxis.axisMinimum = 0.0;
    leftAxis.drawGridLinesEnabled = YES;
    leftAxis.drawZeroLineEnabled = NO;
    leftAxis.granularityEnabled = YES;
    
//    leftAxis.valueFormatter =  [[ChartIndexAxisValueFormatter alloc] init]; 设置了左边的数值就不会显示，需要重新配置
    
//    leftAxis.valueFormatter.positiveSuffix = @" $";//数字后缀单位
    leftAxis.labelPosition = YAxisLabelPositionOutsideChart;//label位置
    leftAxis.labelTextColor = [UIColor redColor];//文字颜色
    leftAxis.labelFont = [UIFont systemFontOfSize:10.0f];//文字字体
    
    // 网格样式
    leftAxis.gridLineDashLengths = @[@3.0f, @3.0f];//设置虚线样式的网格线
    leftAxis.gridColor = [UIColor colorWithRed:200/255.0f green:200/255.0f blue:200/255.0f alpha:1];//网格线颜色
    leftAxis.gridAntialiasEnabled = YES;//开启抗锯齿
    
    
    // 设置限制线
    ChartLimitLine *limitLine = [[ChartLimitLine alloc] initWithLimit:80 label:@"限制线"];
    limitLine.lineWidth = 2;
    limitLine.lineColor = [UIColor greenColor];
    limitLine.lineDashLengths = @[@5.0f, @5.0f];//虚线样式
    limitLine.labelPosition = ChartLimitLabelPositionRightTop;//位置
    limitLine.valueTextColor = [UIColor blueColor];//label文字颜色
    limitLine.valueFont = [UIFont systemFontOfSize:12];//label字体
    [leftAxis addLimitLine:limitLine];//添加到Y轴上
    leftAxis.drawLimitLinesBehindDataEnabled = YES;//设置限制线绘制在折线图的后面
    
    // 设置图例及描述
    [lineview setDescriptionText:@"折线图"];//折线图描述
    [lineview setDescriptionTextColor:[UIColor darkGrayColor]];
    lineview.legend.form = ChartLegendFormLine;//图例的样式
    lineview.legend.formSize = 30;//图例中线条的长度
    lineview.legend.textColor = [UIColor darkGrayColor];//图例文字颜色
    
    // 设置数据

    NSMutableArray *yVals1 = [[NSMutableArray alloc] init];
    for (int i = 0; i < 36; i++)
    {
        double mult = 100 / 2.0;
        double val = (double) (arc4random_uniform(mult)) + 50;
        [yVals1 addObject:[[ChartDataEntry alloc] initWithX:i y:val]];
    }
    LineChartDataSet *set1 = nil;
    set1 = [[LineChartDataSet alloc] initWithValues:yVals1 label:@"DataSet 1"];
    set1.axisDependency = AxisDependencyLeft;
    [set1 setColor:[UIColor colorWithRed:51/255.f green:181/255.f blue:229/255.f alpha:1.f]];
    [set1 setCircleColor:[UIColor redColor]];
    set1.lineWidth = 2.0;
    set1.circleRadius = 3.0;
    set1.fillAlpha = 65/255.0;
    set1.fillColor = [UIColor colorWithRed:51/255.f green:181/255.f blue:229/255.f alpha:1.f];
    set1.highlightColor = [UIColor colorWithRed:244/255.f green:117/255.f blue:117/255.f alpha:1.f];
    set1.drawCircleHoleEnabled = NO;
    
    NSMutableArray *dataSets = [[NSMutableArray alloc] init];
    [dataSets addObject:set1];
  
    
    LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
    [data setValueTextColor:[UIColor blackColor]];
    [data setValueFont:[UIFont systemFontOfSize:9.f]];
    
    lineview.data = data;

    
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
