//
//  Dashboard_Controller.m
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 05/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "Dashboard_Controller.h"
#import "AppDelegate.h"
#import "Json_Class.h"
#import "ActiveCampaingController.h"

@interface Dashboard_Controller ()
{
    Left_Menu *side_menu;
    
    NSUserDefaults *user_info;
    
    Json_Class *url_obj;
    
    App_Header *heade_view;
    
}

@end

@implementation Dashboard_Controller

- (void)viewDidLoad {
    [super viewDidLoad];
   
    user_info = [NSUserDefaults standardUserDefaults];
    
    
    
    NSMutableArray *navigationArray = [[NSMutableArray alloc] initWithArray: self.navigationController.viewControllers];
    
   // NSArray *array = navigationArray;
    
   //  [navigationArray removeAllObjects];    // This is just for remove all view controller from navigation stack.
//    [navigationArray removeObjectAtIndex: 2];  // You can pass your index here
   // self.navigationController.viewControllers = navigationArray;
    
    NSMutableArray *nav= [NSMutableArray new];
    
    NSLog(@"stack--->%@",navigationArray);
    
    for (int i=0; i<navigationArray.count; i++)
    {
      
        if (![[navigationArray objectAtIndex:i] isEqual:self.navigationController.visibleViewController])
        {
            
            [nav addObject:[navigationArray objectAtIndex:i]];
            
        }
       
    }
    
    [navigationArray removeObjectsInArray:nav];
    
     NSLog(@"stack2nd--->%@",navigationArray);
    
    self.navigationController.viewControllers = navigationArray;
    
    NSLog(@"stacklast--->%@",self.navigationController.viewControllers);
    
    
    
     heade_view = [[App_Header alloc]init];
   
    [heade_view header_Class:@"DASHBOARD" head_object:heade_view view:header_baseview controller:self Main_view:Main_view ButtonImage:@"hamburger menu"];
    
    
    url_obj = [Json_Class new];
    
    scroll.contentSize = CGSizeMake(self.view.frame.size.width, video_view.frame.origin.y+video_view.frame.size.height+15);
    
    [self shadow:active_campaingView];
    [self shadow:past_CampaingView];
    [self shadow:video_view];
    
    
    [self url_data];
    
   
}



-(void)url_data
{
    NSString *url = [NSString stringWithFormat:@"%@Jsonapp_control/dashboard_details?user_id=%@",App_Domain_Url,[user_info valueForKey:@"userId"]];
    
    
    NSMutableURLRequest *requst = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [url_obj GlobalDict:requst Globalstr:@"array" Withblock:^(id result, NSError *error) {
       
        if (result)
        {
            NSString  *response = [NSString stringWithFormat:@"%@",[result valueForKey:@"response"]];
           
            
            if ([response isEqualToString:@"1"])
            {
                
             NSLog(@"result--->%@",result);
                
                if ([[user_info valueForKey:@"userType"]isEqualToString:@"B"])
                {
                    
                   // NSLog(@"if");
                    
                    count1.text = [NSString stringWithFormat:@"%@",[[result valueForKey:@"info"] valueForKey:@"business_count_activecamp"]];
                    
                    count2.text = [NSString stringWithFormat:@"%@",[[result valueForKey:@"info"] valueForKey:@"business_count_pastcamp"]];
                    
                    
                    if ([[[[result valueForKey:@"info"] valueForKey:@"business_dashboard_info"] valueForKey:@"active_camp"]isKindOfClass:[NSArray class]] )
                    {
                        
                        active_linelast.hidden = NO;
                        active_More.hidden = NO;
                        
                        NSArray *data_Array =[[[result valueForKey:@"info"] valueForKey:@"business_dashboard_info"] valueForKey:@"active_camp"];
                        
                        
                        if (data_Array.count==0)
                        {
                            for (id obj in active_campaingView.subviews)
                            {
                                if([obj isKindOfClass:[UILabel class]])
                                {
                                    UILabel *lbl = (UILabel *)obj;
                                    
                                    if (lbl.tag!=108)
                                    {
                                        lbl.hidden = YES;
                                    
                                    }
                                    
                                    
                                    
                                }
                                else if ([obj isKindOfClass:[UIButton class]])
                                {
                                    UIButton *btn = (UIButton *)obj;
                                    
                                    btn.hidden = YES;
                                }
                            }
                            
                            
                            active_nocmpFound.hidden = NO;
                        }
                        
                        else if (data_Array.count==1)
                        {
                            active_lbl1.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:0]valueForKey:@"name"]];
                            
                            active_click1.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:0]valueForKey:@"clicks"]];
                            
                            
                            active_linelast.hidden = YES;
                            active_More.hidden = YES;
                            
                            
                        }
                        else if (data_Array.count>1)
                            
                        {
                            active_lbl1.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:0]valueForKey:@"name"]];
                            
                            active_click1.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:0]valueForKey:@"clicks"]];
                            
                            
                            active_lbl2.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:1]valueForKey:@"name"]];
                            
                            active_click2.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:1]valueForKey:@"clicks"]];
                            
                        }
                        
                        
                        
                        
                       
                        
                        
                        
                        
//                        "user_id":"48",
//                        "name":"test",
//                        "estimated_view":3450,
//                        "clicks":50,
                        
                        
                    }
                    
                    if ([[[[result valueForKey:@"info"] valueForKey:@"business_dashboard_info"] valueForKey:@"past_camp"]isKindOfClass:[NSArray class]] )
                    {
                        NSArray *data_Array =[[[result valueForKey:@"info"] valueForKey:@"business_dashboard_info"] valueForKey:@"past_camp"];
                        
                        
                        past_linelast.hidden = NO;
                        pastmore.hidden = NO;
                        
                        if (data_Array.count==0)
                        {
                            for (id obj in past_CampaingView.subviews)
                            {
                                if([obj isKindOfClass:[UILabel class]])
                                {
                                    UILabel *lbl = (UILabel *)obj;
                                    
                                    if (lbl.tag!=108)
                                    {
                                        lbl.hidden = YES;
                                    }
                                    
                                }
                                else if ([obj isKindOfClass:[UIButton class]])
                                {
                                    UIButton *btn = (UIButton *)obj;
                                    
                                    btn.hidden = YES;
                                }
                            }
                            
                            
                            past_nocampFound.hidden = NO;
                        }
                        
                       else if (data_Array.count==1)
                        {
                            past_lbl1.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:0]valueForKey:@"name"]];
                            
                            past_click1.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:0]valueForKey:@"clicks"]];
                            
                            past_linelast.hidden = YES;
                            pastmore.hidden = YES;
                            
                        }
                        else if (data_Array.count>1)
                            
                        {
                            past_lbl1.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:0]valueForKey:@"name"]];
                            
                            past_click1.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:0]valueForKey:@"clicks"]];
                            
                            
                            past_lbl2.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:1]valueForKey:@"name"]];
                            
                            past_click2.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:1]valueForKey:@"clicks"]];
                        }
                        
                       
                        
                        
                        
                    }
                    
                    
                }
                else
                {
                     //NSLog(@"else");
                    
                    
                    count1.text = [NSString stringWithFormat:@"%@",[[result valueForKey:@"info"] valueForKey:@"promoter_count_activecamp"]];
                    
                    count2.text = [NSString stringWithFormat:@"%@",[[result valueForKey:@"info"] valueForKey:@"promoter_count_pastcamp"]];
                    
                    
                    if ([[[[result valueForKey:@"info"] valueForKey:@"promoter_dashboard_info"] valueForKey:@"active_camp"]isKindOfClass:[NSArray class]] )
                    {
                        
                        active_linelast.hidden = NO;
                        active_More.hidden = NO;
                        
                        
                        NSArray *data_Array =[[[result valueForKey:@"info"] valueForKey:@"promoter_dashboard_info"] valueForKey:@"active_camp"];
                        
                        
                        if (data_Array.count==0)
                        {
                            for (id obj in active_campaingView.subviews)
                            {
                                if([obj isKindOfClass:[UILabel class]])
                                {
                                    UILabel *lbl = (UILabel *)obj;
                                    
                                    if (lbl.tag!=108)
                                    {
                                        lbl.hidden = YES;
                                    }
                                    
                                }
                                else if ([obj isKindOfClass:[UIButton class]])
                                {
                                    UIButton *btn = (UIButton *)obj;
                                    
                                    btn.hidden = YES;
                                }
                            }
                            
                            
                            active_nocmpFound.hidden = NO;
                        }
                        
                      else  if (data_Array.count==1)
                        {
                            active_lbl1.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:0]valueForKey:@"name"]];
                            
                            active_click1.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:0]valueForKey:@"clicks"]];
                            
                            
                            active_linelast.hidden = YES;
                            active_More.hidden = YES;
                            
                        }
                        else if (data_Array.count>1)
                            
                        {
                        
                        active_lbl1.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:0]valueForKey:@"name"]];
                        
                        active_click1.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:0]valueForKey:@"clicks"]];
                        
                        
                        active_lbl2.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:1]valueForKey:@"name"]];
                        
                        active_click2.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:1]valueForKey:@"clicks"]];
                        
                        
                        }
                        
                        //                        "user_id":"48",
                        //                        "name":"test",
                        //                        "estimated_view":3450,
                        //                        "clicks":50,
                        
                        
                    }
                    
                    if ([[[[result valueForKey:@"info"] valueForKey:@"promoter_dashboard_info"] valueForKey:@"past_camp"]isKindOfClass:[NSArray class]] )
                    {
                        past_linelast.hidden = YES;
                        pastmore.hidden = YES;
                        
                        NSArray *data_Array =[[[result valueForKey:@"info"] valueForKey:@"promoter_dashboard_info"] valueForKey:@"past_camp"];
                        
                        if (data_Array.count==0)
                        {
                            for (id obj in past_CampaingView.subviews)
                            {
                                if([obj isKindOfClass:[UILabel class]])
                                {
                                    UILabel *lbl = (UILabel *)obj;
                                    
                                    if (lbl.tag!=108)
                                    {
                                        lbl.hidden = YES;
                                    }
                                    
                                }
                                else if ([obj isKindOfClass:[UIButton class]])
                                {
                                    UIButton *btn = (UIButton *)obj;
                                    
                                    btn.hidden = YES;
                                }
                            }
                            
                            
                            past_nocampFound.hidden = NO;
                        }
                       else if (data_Array.count==1)
                        {
                            past_lbl1.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:0]valueForKey:@"name"]];
                            
                            past_click1.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:0]valueForKey:@"clicks"]];
                            
                            
                            
                            past_linelast.hidden = YES;
                            pastmore.hidden = YES;
                        }
                        else if (data_Array.count>1)
                            
                        {
                        
                        past_lbl1.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:0]valueForKey:@"name"]];
                        
                        past_click1.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:0]valueForKey:@"clicks"]];
                        
                        
                        past_lbl2.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:1]valueForKey:@"name"]];
                        
                        past_click2.text = [NSString stringWithFormat:@"%@",[[data_Array objectAtIndex:1]valueForKey:@"clicks"]];
                            
                        }
                    }

                    
                }
                
                
            }
            
            
        }
        else
        {
            
        }
        
        
        
        
        
    }];
    
    
    
    
    
    
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

- (IBAction)activeMore:(UIButton *)sender {
    
    
    ActiveCampaingController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"active"];
    obj.active_past = @"active";
    [self.navigationController pushViewController:obj animated:YES];
    
}
- (IBAction)pastMore:(UIButton *)sender {
    
    
    ActiveCampaingController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"active"];
    obj.active_past = @"past";
    [self.navigationController pushViewController:obj animated:YES];
    
}
@end
