//
//  CampainDetailsController.m
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 21/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "CampainDetailsController.h"
#import "App_Header.h"
#import "SimpleBarChart.h"

@interface CampainDetailsController ()<SimpleBarChartDataSource, SimpleBarChartDelegate>
{
    SimpleBarChart *_chart;
    NSMutableArray *_values , *graph_value;
}

@end

@implementation CampainDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   App_Header  *heade_view = [[App_Header alloc]init];
    
    [heade_view header_Class:@"DETAILS" head_object:heade_view view:header_baseview controller:self Main_view:mainView ButtonImage:@"hamburger menu"];
    
    //_values							= @[@0, @, @44, @60, @95, @2, @8, @9, @30, @45, @44, @60, @95, @2, @8, @9];
    
    _values = [NSMutableArray new];
    graph_value = [NSMutableArray new];
    
    for (int i=0; i<15; i++)
    {
        if (i<=9)
        {
            [_values addObject:[NSString stringWithFormat:@"0%d",i]];
        }
        else
        {
            [_values addObject:[NSString stringWithFormat:@"%d",i]];
        }
        
        
        NSString *min = @"0"; //Get the current text from your minimum and maximum textfields.
        NSString *max = @"1000";
        
        int randNum = rand() % ([max intValue] - [min intValue]) + [min intValue]; //create the random number.
        
        NSString *num = [NSString stringWithFormat:@"%d", randNum];
        
        [graph_value addObject:num];
    }
    
    _chart							= [[SimpleBarChart alloc] initWithFrame:CGRectMake(10, 15, charBaseview.frame.size.width-20, charBaseview.frame.size.height-20)];
    _chart.delegate					= self;
    _chart.dataSource				= self;
    _chart.barShadowOffset			= CGSizeMake(2.0, 1.0);
    _chart.animationDuration		= 1.0;
    _chart.barShadowColor			= [UIColor lightGrayColor];
    _chart.barShadowAlpha			= 0.5;
    _chart.barShadowRadius			= 1.0;
    _chart.barWidth					= 10.0;
    _chart.xLabelType				= SimpleBarChartXLabelTypeHorizontal;
    _chart.incrementValue			= 100;
    
    _chart.barTextType				= SimpleBarChartBarTextTypeTop;
    _chart.barTextColor				= [UIColor clearColor];
    _chart.gridColor				= [UIColor lightGrayColor];
    _chart.chartBorderColor         = [UIColor lightGrayColor];
    
    [charBaseview addSubview:_chart];
    
    
    [_chart reloadData];
    
    
    [self shadow:charBaseview];
    
}

-(void)shadow:(UIView *)subview
{
    subview.layer.masksToBounds = NO;
    subview.layer.shadowOffset = CGSizeMake(0, 0);
    subview.layer.shadowRadius = 1;
    subview.layer.shadowOpacity = 0.5;
    subview.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
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

#pragma mark SimpleBarChartDataSource

- (NSUInteger)numberOfBarsInBarChart:(SimpleBarChart *)barChart
{
    return _values.count;
}

- (CGFloat)barChart:(SimpleBarChart *)barChart valueForBarAtIndex:(NSUInteger)index
{
    return [[graph_value objectAtIndex:index] floatValue];
}

- (NSString *)barChart:(SimpleBarChart *)barChart textForBarAtIndex:(NSUInteger)index
{
    return [NSString stringWithFormat:@"%@",[graph_value objectAtIndex:index]];
}

- (NSString *)barChart:(SimpleBarChart *)barChart xLabelForBarAtIndex:(NSUInteger)index
{
    return [NSString stringWithFormat:@"%@",[_values objectAtIndex:index]];
}

- (UIColor *)barChart:(SimpleBarChart *)barChart colorForBarAtIndex:(NSUInteger)index
{
    return [UIColor colorWithRed:85.0/255.0f green:166.0/255.0f blue:199.0/255.0f alpha:1.0];
}


@end
