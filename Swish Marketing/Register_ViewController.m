//
//  Register_ViewController.m
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 31/03/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "Register_ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "PromoterRegister_ViewController.h"
#import "Json_Class.h"
#import "GMDCircleLoader.h"
#import "Login_ViewController.h"

@interface Register_ViewController ()
{
    float keybord_height;
    int step_no;
    
    
    Json_Class *url_Obj;
    
    UIView *polygonView;
    
    NSMutableArray *table_DATA;
}

@end

@implementation Register_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //down_back.hidden = YES;
    
    
    url_Obj = [Json_Class new];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:self.view.window];
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:self.view.window];
    
    
    //second step
    
    second_Step.hidden =YES;
    second_Step.frame = CGRectMake(self.view.frame.size.width, second_Step.frame.origin.y, self.view.frame.size.width, second_Step.frame.size.height);
    
    //third step
    
    third_step.hidden =YES;
    third_step.frame = CGRectMake(self.view.frame.size.width, third_step.frame.origin.y, self.view.frame.size.width, third_step.frame.size.height);
    
    
    business_btn.layer.borderWidth = 1.0f;
    business_btn.layer.borderColor = [[UIColor colorWithRed:(70/255.0) green:(149/255.0) blue:(187/255.0) alpha:1.0]CGColor];
    
    
    
    stateTable.clipsToBounds = YES;
    stateTable.layer.cornerRadius = 5;
    
    
    [self state_list];
    
}

-(void)state_list
{
    Json_Class *url_obj = [Json_Class new];
    
    NSString *url = [NSString stringWithFormat:@"%@Jsonapp_control/state_lists",App_Domain_Url];
    NSMutableURLRequest *reust = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [url_obj GlobalDict:reust Globalstr:@"array" Withblock:^(id result, NSError *error) {
        
        if (result)
        {
            NSString  *response = [NSString stringWithFormat:@"%@",[result valueForKey:@"response"]];
            NSLog(@"result--->%@",result);
            
            if ([response isEqualToString:@"1"])
            {
                
                table_DATA = [result valueForKey:@"info"];
                
                [stateTable reloadData];
                
            }
            
            
        }
        else
        {
            
        }
        
        
    }];
    
    
}

-(void)loader :(NSString *)loader_text
{
    
    [polygonView removeFromSuperview];
    polygonView = [[UIView alloc] initWithFrame: CGRectMake ( 0, 0, self.view.bounds.size.width,self.view.bounds.size.height )];
    polygonView.backgroundColor=[UIColor blackColor];
    polygonView.alpha=0.6f;
    [self.view addSubview:polygonView];
    [GMDCircleLoader setOnView:polygonView withTitle:loader_text animated:YES];
    
}



- (void)keyboardWillShow:(NSNotification *)n
{
    if (keybord_height==0)
    {
        //  NSDictionary* userInfo = [n userInfo];
        
        // get the size of the keyboard
        CGSize keyboardSize = [[[n userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
        
        //Given size may not account for screen rotation
        keybord_height= MIN(keyboardSize.height,keyboardSize.width);
        
        
        [UIView animateWithDuration:.3f animations:^{
            
            
            down_view.frame = CGRectMake(0, self.view.frame.size.height-down_view.frame.size.height-keybord_height, self.view.frame.size.width, down_view.frame.size.height);
            
        }];
        //scroll.contentSize =CGSizeMake(scroll.contentSize.width, keybord_height*2.5);
        
        
        
    }
    
    
    // scroll.contentSize = CGSizeMake(0, scroll.contentSize.height);
    
    
    
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    if (textField==state_textfield)
    {
        
        state_view.hidden= NO;
        
        [UIView animateWithDuration:.3f animations:^{
            
            
            state_view.alpha = 1;
            
        }];
        
//        [UIView animateWithDuration:.3f animations:^{
//            
//            
//            second_Step.frame = CGRectMake(0, second_Step.frame.origin.y-textField.frame.size.height-down_view.frame.size.height, self.view.frame.size.width, second_Step.frame.size.height);
//            
//        }];
        
        return NO;
        
        
    }
    
    
    return YES;
}

- (void)keyboardWillHide:(NSNotification *)n
{
    
    
    //    scroll.contentSize =CGSizeMake(scroll_size, 0);
    //    [scroll setContentOffset:CGPointMake(scroll.contentOffset.x, 0) animated:YES];
    
    [UIView animateWithDuration:.3f animations:^{
        
        
        down_view.frame = CGRectMake(0, self.view.frame.size.height-down_view.frame.size.height, self.view.frame.size.width, down_view.frame.size.height);
        
        
        second_Step.frame = CGRectMake(0, first_view.frame.origin.y, self.view.frame.size.width, second_Step.frame.size.height);
        
    }];
    
    keybord_height=0;
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
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
-(NSString *)TarminateWhiteSpace:(NSString *)Str
{
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmed = [Str stringByTrimmingCharactersInSet:whitespace];
    return trimmed;
}

-(BOOL)Emailtest:(NSString *)Email
{
    
    NSString *emailRegex = @"^[_A-Za-z0-9-+]+(\\.[_A-Za-z0-9-+]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z‌​]{2,4})$";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    NSRange aRange;
    
    if([emailTest evaluateWithObject:Email]) {
        
        aRange = [Email rangeOfString:@"." options:NSBackwardsSearch range:NSMakeRange(0, [Email length])];
        
        NSInteger indexOfDot = aRange.location;
        
        //NSLog(@"aRange.location:%d - %d",aRange.location, indexOfDot);
        
        if(aRange.location != NSNotFound) {
            
            NSString *topLevelDomain = [Email substringFromIndex:indexOfDot];
            
            topLevelDomain = [topLevelDomain lowercaseString];
            
            //NSLog(@"topleveldomains:%@",topLevelDomain);
            
            NSSet *TLD;
            
            TLD = [NSSet setWithObjects:@".aero", @".asia", @".biz", @".cat", @".com", @".coop", @".edu", @".gov", @".info", @".int", @".jobs", @".mil", @".mobi", @".museum", @".name", @".net", @".org", @".pro", @".tel", @".travel", @".ac", @".ad", @".ae", @".af", @".ag", @".ai", @".al", @".am", @".an", @".ao", @".aq", @".ar", @".as", @".at", @".au", @".aw", @".ax", @".az", @".ba", @".bb", @".bd", @".be", @".bf", @".bg", @".bh", @".bi", @".bj", @".bm", @".bn", @".bo", @".br", @".bs", @".bt", @".bv", @".bw", @".by", @".bz", @".ca", @".cc", @".cd", @".cf", @".cg", @".ch", @".ci", @".ck", @".cl", @".cm", @".cn", @".co", @".cr", @".cu", @".cv", @".cx", @".cy", @".cz", @".de", @".dj", @".dk", @".dm", @".do", @".dz", @".ec", @".ee", @".eg", @".er", @".es", @".et", @".eu", @".fi", @".fj", @".fk", @".fm", @".fo", @".fr", @".ga", @".gb", @".gd", @".ge", @".gf", @".gg", @".gh", @".gi", @".gl", @".gm", @".gn", @".gp", @".gq", @".gr", @".gs", @".gt", @".gu", @".gw", @".gy", @".hk", @".hm", @".hn", @".hr", @".ht", @".hu", @".id", @".ie", @" No", @".il", @".im", @".in", @".io", @".iq", @".ir", @".is", @".it", @".je", @".jm", @".jo", @".jp", @".ke", @".kg", @".kh", @".ki", @".km", @".kn", @".kp", @".kr", @".kw", @".ky", @".kz", @".la", @".lb", @".lc", @".li", @".lk", @".lr", @".ls", @".lt", @".lu", @".lv", @".ly", @".ma", @".mc", @".md", @".me", @".mg", @".mh", @".mk", @".ml", @".mm", @".mn", @".mo", @".mp", @".mq", @".mr", @".ms", @".mt", @".mu", @".mv", @".mw", @".mx", @".my", @".mz", @".na", @".nc", @".ne", @".nf", @".ng", @".ni", @".nl", @".no", @".np", @".nr", @".nu", @".nz", @".om", @".pa", @".pe", @".pf", @".pg", @".ph", @".pk", @".pl", @".pm", @".pn", @".pr", @".ps", @".pt", @".pw", @".py", @".qa", @".re", @".ro", @".rs", @".ru", @".rw", @".sa", @".sb", @".sc", @".sd", @".se", @".sg", @".sh", @".si", @".sj", @".sk", @".sl", @".sm", @".sn", @".so", @".sr", @".st", @".su", @".sv", @".sy", @".sz", @".tc", @".td", @".tf", @".tg", @".th", @".tj", @".tk", @".tl", @".tm", @".tn", @".to", @".tp", @".tr", @".tt", @".tv", @".tw", @".tz", @".ua", @".ug", @".uk", @".us", @".uy", @".uz", @".va", @".vc", @".ve", @".vg", @".vi", @".vn", @".vu", @".wf", @".ws", @".ye", @".yt", @".za", @".zm", @".zw", nil];
            
            if(topLevelDomain != nil && ([TLD containsObject:topLevelDomain])) {
                
                //NSLog(@"TLD contains topLevelDomain:%@",topLevelDomain);
                
                return false;
                
            }
            
            /*else {
             
             NSLog(@"TLD DOEST NOT contains topLevelDomain:%@",topLevelDomain);
             
             }*/
            
        }
    }
    return true;
}

- (IBAction)new_Action:(UIButton *)sender {
    
    
    
    
    if ([sender.titleLabel.text isEqualToString:@"NEXT"])
    {
        
        
        
        if (second_Step.hidden==YES)
        {
            if ([self TarminateWhiteSpace:compant_field.text].length==0) {
                
                compant_field.text=@"";
                compant_field.placeholder = @"Please enter Complany name";
                
            }
            else if ([self TarminateWhiteSpace:name_field.text].length == 0)
            {
                name_field.text=@"";
                name_field.placeholder = @"Please enter Name";
            }
            else if ([self Emailtest:email_field.text]==true)
            {
                email_field.text=@"";
                email_field.placeholder = @"Please enter Email Id";
            }
            else if ([self TarminateWhiteSpace:password_field.text].length<6)
            {
                password_field.text=@"";
                password_field.placeholder = @"Please enter six digit Password";
            }
            else
            {
                second_Step.hidden =NO;
                step_no = 2;
                
                [UIView animateWithDuration:.3f animations:^{
                    
                    
                    second_Step.frame = CGRectMake(0, second_Step.frame.origin.y, self.view.frame.size.width, second_Step.frame.size.height);
                    
                }];
                
            }
        }
        
        
        else if (third_step.hidden==YES)
        {
            
            
            if ([self TarminateWhiteSpace:address_1.text].length==0)
            {
                address_1.text=@"";
                address_1.placeholder = @"Please enter Address";
            }
            else if ([self TarminateWhiteSpace:adress2.text].length==0)
            {
                adress2.text=@"";
                adress2.placeholder =@"Please enter Address";
            }
            else if ([self TarminateWhiteSpace:city_textfield.text].length==0)
            {
                city_textfield.text=@"";
                city_textfield.placeholder = @"Please enter City";
            }
            else if ([self TarminateWhiteSpace:zip_field.text].length==0)
            {
                zip_field.text=@"";
                zip_field.placeholder = @"Please enter Zip";
            }
            else if ([self TarminateWhiteSpace:state_textfield.text].length==0)
            {
                state_textfield.text=@"";
                state_textfield.placeholder = @"Please select State";
            }
            
            else
            {
                
                
                
                third_step.hidden =NO;
                step_no = 3;
                
                refferal_code.autocorrectionType = UITextAutocorrectionTypeNo;
                [UIView animateWithDuration:.3f animations:^{
                    
                    
                    third_step.frame = CGRectMake(0, third_step.frame.origin.y, self.view.frame.size.width, second_Step.frame.size.height);
                    
                }];
                
                
                [sender setTitle:@"REGISTER" forState:UIControlStateNormal];
                
            }
            
            
        }
    }
    else
    {
        
        [self loader:@"Please Wait..."];
        
        NSString *urlstr= [NSString stringWithFormat:@"%@App_control/register_login",App_Domain_Url];
        
        urlstr=[urlstr stringByRemovingPercentEncoding];
        
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        
        [request setURL:[NSURL URLWithString:urlstr]];
        
        [request setHTTPMethod:@"POST"];
        
        NSString *postData = [NSString stringWithFormat:@"email=%@&password=%@&user_type=1&business_name=%@&user_name=%@&address=%@&address1=%@&city_name=%@&state_id=%@&zip_code=%@",email_field.text,password_field.text,compant_field.text,name_field.text,address_1.text,adress2.text,city_textfield.text,state_textfield.text,zip_field.text];
        
        
        
        
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        
        [request setHTTPBody:[postData dataUsingEncoding:NSUTF8StringEncoding]];
        
        [url_Obj GlobalDict:request Globalstr:@"array" Withblock:^(id result, NSError *error)
         {
             
             NSLog(@"result--->%@",result);
             
             [self loader_hide];
             
             
             if (result)
             {
                 NSString  *response = [NSString stringWithFormat:@"%@",[result valueForKey:@"response"]];
                 
                 
                 if ([response isEqualToString:@"1"])
                 {
                     
                     
                     UIAlertController * alert = [UIAlertController
                                                  alertControllerWithTitle:nil
                                                  message:[result valueForKey:@"message"]
                                                  preferredStyle:UIAlertControllerStyleAlert];
                     
                     //Add Buttons
                     
                     UIAlertAction* yesButton = [UIAlertAction
                                                 actionWithTitle:@"OK"
                                                 style:UIAlertActionStyleDefault
                                                 handler:^(UIAlertAction * action) {
                                                     //Handle your yes please button action here
                                                     
                                                     
                                                     Login_ViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"loginPage"];
                                                     [self.navigationController pushViewController:obj animated:YES];
                                                     
                                                 }];
                     
                     
                     //Add your buttons to alert controller
                     
                     [alert addAction:yesButton];
                     
                     [self presentViewController:alert animated:YES completion:nil];
                     
                     
                     
                 }
                 else
                 {
                     UIAlertController * alert = [UIAlertController
                                                  alertControllerWithTitle:nil
                                                  message:[result valueForKey:@"message"]
                                                  preferredStyle:UIAlertControllerStyleAlert];
                     
                     //Add Buttons
                     
                     UIAlertAction* yesButton = [UIAlertAction
                                                 actionWithTitle:@"OK"
                                                 style:UIAlertActionStyleDefault
                                                 handler:^(UIAlertAction * action) {
                                                     //Handle your yes please button action here
                                                     
                                                     
                                                     
                                                     
                                                 }];
                     
                     
                     //Add your buttons to alert controller
                     
                     [alert addAction:yesButton];
                     
                     [self presentViewController:alert animated:YES completion:nil];
                 }
                 
             }
             else
             {
                 UIAlertController * alert = [UIAlertController
                                              alertControllerWithTitle:nil
                                              message:error.localizedDescription
                                              preferredStyle:UIAlertControllerStyleAlert];
                 
                 //Add Buttons
                 
                 UIAlertAction* yesButton = [UIAlertAction
                                             actionWithTitle:@"OK"
                                             style:UIAlertActionStyleDefault
                                             handler:^(UIAlertAction * action) {
                                                 //Handle your yes please button action here
                                                 
                                                 
                                                 
                                                 
                                             }];
                 
                 
                 //Add your buttons to alert controller
                 
                 [alert addAction:yesButton];
                 
                 [self presentViewController:alert animated:YES completion:nil];
             }
             
             
             
             
         }];
        
    }
    
    
    
    
    
    
    
}







-(void)loader_hide
{
    [UIView animateWithDuration:.3 animations:^{
        
        
        polygonView.alpha = 0;
        
    }completion:^(BOOL finished) {
        
        
        [polygonView removeFromSuperview];
        
    }];
}


- (IBAction)down_back:(UIButton *)sender {
    
    //down_back.hidden = YES;
    
    [next_Btn setTitle:@"NEXT" forState:UIControlStateNormal];
    
    if (step_no==2)
    {
        step_no = 1;
        
        [UIView animateWithDuration:.3f animations:^{
            
            
            second_Step.frame = CGRectMake(self.view.frame.size.width, second_Step.frame.origin.y, self.view.frame.size.width, second_Step.frame.size.height);
            
        }completion:^(BOOL finished) {
            
            
            second_Step.hidden =YES;
            
        }];
    }
    else if (step_no==3)
    {
        step_no = 2;
        
        [UIView animateWithDuration:.3f animations:^{
            
            
            third_step.frame = CGRectMake(self.view.frame.size.width, third_step.frame.origin.y, self.view.frame.size.width, third_step.frame.size.height);
            
        }completion:^(BOOL finished) {
            
            
            third_step.hidden =YES;
            
        }];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    
    
    
}

- (IBAction)promoter_action:(UIButton *)sender {
    
    
    NSLog(@"controller --->%@",self.navigationController.viewControllers);
    
    PromoterRegister_ViewController *obj_class;
    
    for (UIViewController *obj in self.navigationController.viewControllers)
    {
        if ([obj isKindOfClass:[PromoterRegister_ViewController class]])
        {
            
            obj_class = (PromoterRegister_ViewController *)obj;
            
            break;
        }
    }
    
    
    if (obj_class==nil)
    {
        obj_class = [self.storyboard instantiateViewControllerWithIdentifier:@"promoter"];
        [self.navigationController pushViewController:obj_class animated:NO];
    }
    else
    {
        
        [self.navigationController popToViewController:obj_class animated:NO];
        
    }
    
    
    
}


#pragma tableview DataSource and Delegate


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 40)];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    
    lbl.textColor = promoter.titleLabel.textColor;
    lbl.font = promoter.titleLabel.font;
    lbl.textAlignment = NSTextAlignmentCenter;
    
    lbl.text = @"Select State";
    
    
    [view addSubview:lbl];
    
    
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == stateTable)
    {
        static NSString *cellID=@"CellID";
        
        UITableViewCell *myCell=[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if(myCell==nil)
        {
            
            myCell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            
        }
        
        myCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return myCell;
        
    }
    
    
    return nil;
    
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView==stateTable)
    {
        
        for (UILabel *obj  in cell.subviews)
        {
            [obj removeFromSuperview];
        }
        
        UILabel *address = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, cell.frame.size.width-20, cell.frame.size.height)];
        
        
        address.text = [[table_DATA objectAtIndex:indexPath.row] valueForKey:@"name"];
        
        
        
        address.font = address_1.font;
        
        address.textColor = address_1.textColor;
        
        [cell addSubview:address];
        
        
        
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, cell.frame.size.height-1,cell.frame.size.width , 1)];
        
        line.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:.5f];
        
        
        [cell addSubview:line];
        
        
    }
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == stateTable)
    {
        
        state_textfield.text = [[table_DATA objectAtIndex:indexPath.row] valueForKey:@"name"];
        
        [UIView animateWithDuration:.3f animations:^{
            
            
            state_view.alpha = 0;
            
        }completion:^(BOOL finished) {
            
            state_view.hidden= YES;
            
        }];
    }
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == stateTable)
    {
        return 50;
    }
    
    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == stateTable)
    {
        return table_DATA.count;
    }
    return 0;
}


- (IBAction)business:(UIButton *)sender {
    
    //    promoter.layer.borderWidth = 1.0f;
    //    promoter.layer.borderColor = [[UIColor clearColor] CGColor];
    //    promoter.backgroundColor = [UIColor whiteColor];
    //
    //
    //    sender.layer.borderWidth = 1.0f;
    //    sender.layer.borderColor = [[UIColor colorWithRed:(70/255.0) green:(149/255.0) blue:(187/255.0) alpha:1.0]CGColor];
    //    sender.backgroundColor = [UIColor clearColor];
    
    
    
    
    
    
}
@end
