//
//  Login_ViewController.m
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 31/03/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "Login_ViewController.h"
#import "Tutotial_ViewController.h"
#import "Register_ViewController.h"
#import "Json_Class.h"

@interface Login_ViewController ()
{
    NSUserDefaults *user_Info;
    Json_Class *url_obj;
}

@end

@implementation Login_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    url_obj = [Json_Class new];
    
    
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:login_Btn.bounds];
    login_Btn.layer.masksToBounds = NO;
    login_Btn.layer.shadowColor = [UIColor blackColor].CGColor;
    login_Btn.layer.shadowOffset = CGSizeMake(.5, .5);
    login_Btn.layer.shadowOpacity = 0.2f;
    login_Btn.layer.shadowPath = shadowPath.CGPath;
    
    UIBezierPath *shadowPath_1 = [UIBezierPath bezierPathWithRect:register_Btn.bounds];
    register_Btn.layer.masksToBounds = NO;
    register_Btn.layer.shadowColor = [UIColor blackColor].CGColor;
    register_Btn.layer.shadowOffset = CGSizeMake(.5, .5);
    register_Btn.layer.shadowOpacity = 0.2f;
    register_Btn.layer.shadowPath = shadowPath_1.CGPath;
    
    
    user_Info = [NSUserDefaults standardUserDefaults];
    
   
    
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    if (![[[NSUserDefaults standardUserDefaults] valueForKey:@"Orientation"] isEqualToString:@"1"] )
//    {
//        Login_ViewController *obj  = [[UIStoryboard storyboardWithName:@"Land" bundle:nil] instantiateViewControllerWithIdentifier:@"loginPage"];
//        
//        
//        obj.view.frame = self.view.frame;
//        
//        for (id obj in self.view.subviews)
//        {
//            [obj removeFromSuperview];
//        }
//        
//        [self.view addSubview:obj.view];
//        
//    }
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


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    
    return YES;
}

- (IBAction)Login_Action:(UIButton *)sender {
    
    if (email_filed.text.length==0)
    {
        email_filed.text = @"";
        email_filed.placeholder = @"Please Enter Email Id";
    }
    else if (password_field.text.length==0)
    {
        password_field.text =@"" ;
        password_field.placeholder = @"Please Type Password";
    }
    else
    {
        if ([sender.titleLabel.text isEqualToString:@"LOGIN"])
        {
            
          [sender setTitle:@"PLESAE WAIT..." forState:UIControlStateNormal];
        
        NSString *urlstr= [NSString stringWithFormat:@"%@App_control/site_login",App_Domain_Url];
        
        urlstr=[urlstr stringByRemovingPercentEncoding];
        
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        
        [request setURL:[NSURL URLWithString:urlstr]];
        
        [request setHTTPMethod:@"POST"];
        
        NSString *postData = [NSString stringWithFormat:@"user_email=%@&password=%@",email_filed.text,password_field.text];
        
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        
        [request setHTTPBody:[postData dataUsingEncoding:NSUTF8StringEncoding]];
        
        [url_obj GlobalDict:request Globalstr:@"array" Withblock:^(id result, NSError *error) {
           
            if (result)
            {
                NSString  *response = [NSString stringWithFormat:@"%@",[result valueForKey:@"response"]];
                NSLog(@"result--->%@",result);
                
                if ([response isEqualToString:@"1"])
                {
                    
                     [user_Info setValue:[[result valueForKey:@"info_array"] valueForKey:@"user_type"] forKey:@"userType"];
                     [user_Info setValue:[[result valueForKey:@"info_array"] valueForKey:@"user_id"] forKey:@"userId"];
                    
                    
                   [user_Info setValue:[[result valueForKey:@"info_array"] valueForKey:@"user_business_image"] forKey:@"user_business_image"];
                    
                    [user_Info setValue:[[result valueForKey:@"info_array"] valueForKey:@"user_promoter_image"] forKey:@"user_promoter_image"];
                    
                     [user_Info setValue:[[result valueForKey:@"info_array"] valueForKey:@"user_name"] forKey:@"user_name"];
                    
                    
                    if ([[[result valueForKey:@"info_array"] valueForKey:@"user_business_type"] isEqualToString:@"Y"] && [[[result valueForKey:@"info_array"] valueForKey:@"user_promoter_type"] isEqualToString:@"Y"])
                    {
                        [user_Info setValue:@"BOTH" forKey:@"register_Type"];
                    }
                    else if ([[[result valueForKey:@"info_array"] valueForKey:@"user_business_type"] isEqualToString:@"Y"])
                    {
                        [user_Info setValue:@"B" forKey:@"register_Type"];
                        
                        
                    }
                    else if ([[[result valueForKey:@"info_array"] valueForKey:@"user_promoter_type"] isEqualToString:@"Y"])
                    {
                        [user_Info setValue:@"P" forKey:@"register_Type"];
                    }
                    
                    
                 
    
                    Tutotial_ViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorial"];
                    [self.navigationController pushViewController:obj animated:YES];
                    
                    
                    
                }
                else
                {
                    [sender setTitle:@"LOGIN" forState:UIControlStateNormal];
                }
                
            }
            else
            {
                  [sender setTitle:@"LOGIN" forState:UIControlStateNormal];
            }
        
            
            
            
        }];
        
        }
        
        else
        {
            
        }
        
       
    }
    
//
    
    
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    
    NSLog(@"-->%ld",(long)toInterfaceOrientation);
    
    if (toInterfaceOrientation==1)
    {
        Login_ViewController *obj = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"loginPage"];
        
        obj.view.frame = self.view.frame;
        
        for (id obj in self.view.subviews)
        {
            [obj removeFromSuperview];
        }
        
        [self.view addSubview:obj.view];
        
        
    }else {
        
        
        Login_ViewController *obj  = [[UIStoryboard storyboardWithName:@"Land" bundle:nil] instantiateViewControllerWithIdentifier:@"loginPage"];
        
        
        obj.view.frame = self.view.frame;
        
        for (id obj in self.view.subviews)
        {
            [obj removeFromSuperview];
        }
        
        [self.view addSubview:obj.view];
        
        
        
        
        
        
        //NSLog(@"%@",controller);
        
    }
    
     [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%ld",toInterfaceOrientation] forKey:@"Orientation"];
    
    //[self viewDidLoad];
    
}





- (IBAction)Register:(UIButton *)sender {
    
    Register_ViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"business"];
    [self.navigationController pushViewController:obj animated:YES];
    
}
@end
