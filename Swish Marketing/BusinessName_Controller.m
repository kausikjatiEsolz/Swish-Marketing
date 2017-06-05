//
//  BusinessName_Controller.m
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 11/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "BusinessName_Controller.h"
#import "App_Header.h"

@interface BusinessName_Controller ()

@end

@implementation BusinessName_Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    App_Header *heade_view = [[App_Header alloc]init];
    
    [heade_view header_Class:@"SETTINGS" head_object:heade_view view:header_bassview  controller:self Main_view:mainview ButtonImage:@"Back topbar"];
    
    // Do any additional setup after loading the view.
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
