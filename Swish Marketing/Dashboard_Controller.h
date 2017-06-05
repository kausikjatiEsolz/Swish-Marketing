//
//  Dashboard_Controller.h
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 05/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "App_Header.h"
#import "Left_Menu.h"

@interface Dashboard_Controller : UIViewController
{
    __weak IBOutlet UIView *header_baseview;
    __weak IBOutlet UIView *Main_view;
    
    
    __weak IBOutlet UIScrollView *scroll;
    
    __weak IBOutlet UIView *active_campaingView;
    __weak IBOutlet UIView *past_CampaingView;
    __weak IBOutlet UIView *video_view;
    
    
    __weak IBOutlet UILabel *count1;
    
    
    __weak IBOutlet UILabel *active_lbl1;
    __weak IBOutlet UILabel *active_click1;
   
    __weak IBOutlet UILabel *active_lbl2;
    __weak IBOutlet UILabel *active_click2;
    
    __weak IBOutlet UILabel *active_nocmpFound;
    
    
    
    __weak IBOutlet UILabel *count2;
    
    __weak IBOutlet UILabel *past_lbl1;
    __weak IBOutlet UILabel *past_click1;
    
    __weak IBOutlet UILabel *past_lbl2;
    __weak IBOutlet UILabel *past_click2;
    __weak IBOutlet UILabel *past_nocampFound;
    
    
    __weak IBOutlet UILabel *active_linelast;
    __weak IBOutlet UIButton *active_More;
    
    __weak IBOutlet UILabel *past_linelast;
    __weak IBOutlet UIButton *pastmore;
    
    
}

- (IBAction)activeMore:(UIButton *)sender;
- (IBAction)pastMore:(UIButton *)sender ;



@end
