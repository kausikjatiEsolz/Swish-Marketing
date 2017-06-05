//
//  PromoterRegister_ViewController.h
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 04/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PromoterRegister_ViewController : UIViewController
{
    __weak IBOutlet UIView *down_view;
    __weak IBOutlet UIButton *promoter;
    __weak IBOutlet UIView *first_view;
    __weak IBOutlet UIView *second_Step;
    __weak IBOutlet UIView *third_step;
    __weak IBOutlet UIButton *down_back;
    __weak IBOutlet UIButton *next_Btn;
   
    
    //Step 1
    
    __weak IBOutlet UIImageView *profile_image;
    __weak IBOutlet UITextField *emaild_field;
    __weak IBOutlet UITextField *name_field;
    __weak IBOutlet UITextField *password;
    __weak IBOutlet UITextField *social_number;
    
    ///Second Step
    
    __weak IBOutlet UITextField *address_1;
    __weak IBOutlet UITextField *adress2;
    __weak IBOutlet UITextField *city_textfield;
    __weak IBOutlet UITextField *zip_field;
    __weak IBOutlet UITextField *state_textfield;
    
    
    //Third Step
    
    __weak IBOutlet UITextField *refferal_code;

     IBOutlet UIView *header_state;
    __weak IBOutlet UIView *state_view;
    __weak IBOutlet UITableView *stateTable;
    __weak IBOutlet UIView *photo_view;
}
- (IBAction)business:(UIButton *)sender;
- (IBAction)new_Action:(UIButton *)sender;
- (IBAction)down_back:(UIButton *)sender;
- (IBAction)upload_Image:(UIButton *)sender;
- (IBAction)takePhoto:(UIButton *)sender;

@end
