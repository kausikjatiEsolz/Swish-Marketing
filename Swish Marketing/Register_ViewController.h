//
//  Register_ViewController.h
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 31/03/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Register_ViewController : UIViewController<UITextFieldDelegate>
{
    __weak IBOutlet UIButton *down_back;
    __weak IBOutlet UIView *down_view;
    __weak IBOutlet UIView *second_Step;
    __weak IBOutlet UIView *first_view;
    __weak IBOutlet UIView *third_step;
    __weak IBOutlet UIButton *promoter;
    __weak IBOutlet UIButton *next_Btn;
    
    __weak IBOutlet UIButton *business_btn;
    
    
    //First Step
    
    __weak IBOutlet UITextField *compant_field;
    __weak IBOutlet UITextField *name_field;
    __weak IBOutlet UITextField *email_field;
    __weak IBOutlet UITextField *password_field;
    
    
    ///Second Step
    
    __weak IBOutlet UITextField *address_1;
    __weak IBOutlet UITextField *adress2;
    __weak IBOutlet UITextField *city_textfield;
    __weak IBOutlet UITextField *zip_field;
    __weak IBOutlet UITextField *state_textfield;
    
    
    
    //Third Step
    
    __weak IBOutlet UITextField *refferal_code;
    
    
    
    __weak IBOutlet UIView *state_view;
    __weak IBOutlet UITableView *stateTable;
    
    
}
- (IBAction)new_Action:(UIButton *)sender;
- (IBAction)down_back:(UIButton *)sender;
- (IBAction)promoter_action:(UIButton *)sender;
- (IBAction)business:(UIButton *)sender;


@end
