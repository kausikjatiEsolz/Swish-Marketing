//
//  Login_ViewController.h
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 31/03/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Login_ViewController : UIViewController <UITextFieldDelegate>
{
    __weak IBOutlet UIButton *login_Btn;
    __weak IBOutlet UIButton *register_Btn;
    
    __weak IBOutlet UITextField *email_filed;
    __weak IBOutlet UITextField *password_field;
    
    
}

- (IBAction)Login_Action:(UIButton *)sender;
- (IBAction)Register:(UIButton *)sender;



@end
