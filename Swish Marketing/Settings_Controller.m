//
//  Settings_Controller.m
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 10/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "Settings_Controller.h"
#import "App_Header.h"

@interface Settings_Controller ()

@end

@implementation Settings_Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    App_Header *heade_view = [[App_Header alloc]init];
    
    [heade_view header_Class:@"NOTIFICATION SETTINGS" head_object:heade_view view:header_base controller:self Main_view:Main_view ButtonImage:@"Back topbar"];
    
    
    [self shadow:first_view];
    [self shadow:second_view];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)shadow:(UIView *)subview
{
    subview.layer.masksToBounds = NO;
    subview.layer.shadowOffset = CGSizeMake(0, 0);
    subview.layer.shadowRadius = 1;
    subview.layer.shadowOpacity = 0.5;
    subview.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
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
