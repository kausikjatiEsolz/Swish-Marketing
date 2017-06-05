//
//  EnterLocationController.m
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 24/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "EnterLocationController.h"
#import "Json_Class.h"

@interface EnterLocationController ()<UITextFieldDelegate>
{
    NSMutableArray *Arraytable;
    
    NSString *location_lat,*location_long;
}

@end

@implementation EnterLocationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    header_view.layer.masksToBounds = NO;
    header_view.layer.shadowOffset = CGSizeMake(1, 1);
    header_view.layer.shadowRadius = 1;
    header_view.layer.shadowOpacity = 0.5;
    header_view.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    
    
    [location_textfield becomeFirstResponder];
    
    
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = @[[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                            [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                            ];
    [numberToolbar sizeToFit];
    radius_Text.inputAccessoryView = numberToolbar;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)cancelNumberPad
{
    [radius_Text resignFirstResponder];
}



-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField==location_textfield)
    {
          [textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    
   
    
    return  YES;
}

-(void)textFieldDidChange:(UITextField *)thetextfield
{
    
    radus_View.hidden = YES;
    
    
    
    if (thetextfield.text.length==0)
    {
        location_table.hidden = YES;
        
    }
    else
    {
        cross.hidden = NO;
        location_table.hidden = NO;
        
        //        NSString *urlString=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/geocode/json?address=%@&key=AIzaSyAsdkm0gt7PAsMO7uUFH-BnYOwclf0KsZI",[txtLocation text]];
        NSString *urlString=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/autocomplete/json?input=%@&key=AIzaSyCdkS0XUBrn9NOaqv-Hgk_jH9X58ccpgDU",[thetextfield text]];
        NSString* encodedUrl = [urlString stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
        NSURL *url = [NSURL URLWithString:encodedUrl];
        //--------------- GET Method-----------  //
        NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate:self delegateQueue: [NSOperationQueue mainQueue]];
        NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithURL:url
                                                        completionHandler:^(NSData *data1, NSURLResponse *response, NSError *error) {
                                                            if(error == nil)
                                                            {
                                                                
                                                                NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data1 options:kNilOptions error:&error];
                                                                
                                                                
                                                                if ([[dictionary valueForKey:@"status"] isEqualToString:@"OK"])
                                                                {
                                                                    
                                                                   NSDictionary  *data = dictionary;
                                                                   
                                                                    //choosenLocationData=[data valueForKey:@"results"];
                                                                    
                                                                    //NSLog(@"data %@",data);
                                                                    
                                                                    Arraytable=[data valueForKey:@"predictions"];
                                                                    
                                                                    Arraytable = [Arraytable valueForKey:@"description"];
                                                                    
                                                                    
                                                                    NSLog(@"ARRA ====%@",Arraytable);
                                                                    
                                                                    [location_table reloadData];
                                                                    
                                                                    
                                                                }
                                                                else if ([[dictionary valueForKey:@"status"] isEqualToString:@"ZERO_RESULTS"])
                                                                {
                                                                    
                                                                    
                                                                }
                                                                else
                                                                {
//                                                                    UIAlertView *alart = [[UIAlertView alloc]initWithTitle:[data valueForKey:@"status"] message:@"Invalid Search." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                                                                    [alart show];
                                                                   
                                                                    
                                                                }
                                                                
                                                            }
                                                            [location_table reloadData];
                                                        }];
        
        [dataTask resume];
        
        
        
        
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID=@"CellID";
    
    UITableViewCell *myCell=[tableView dequeueReusableCellWithIdentifier:cellID];
    
    if(myCell==nil)
    {
        
        myCell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }
    
    myCell.backgroundColor = [UIColor clearColor];
    
    
   // myCell.textLabel.text = [Arraytable objectAtIndex:indexPath.row];
    
    //NSLog(@"business-->%@",business);
    
    
    return myCell;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    for (UILabel *obj in cell.subviews)
    {
        [obj removeFromSuperview];
    }
    
    
    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, cell.frame.size.height)];
    
    lbl.font = [UIFont fontWithName:@"Helvetica" size:14];
    
    lbl.numberOfLines =2;
    
    lbl.textColor = [UIColor lightGrayColor];
    
    lbl.text =  [Arraytable objectAtIndex:indexPath.row];
    
    [cell addSubview:lbl];
    
    
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, cell.frame.size.height-1, tableView.frame.size.width, 1)];
    
    line.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:.5f];
    [cell addSubview:line];
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return Arraytable.count ;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    location_textfield.text = [Arraytable objectAtIndex:indexPath.row];
    
    Json_Class *globalobj = [Json_Class new];
    
    NSString *urlStr=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/geocode/json?address=%@",[Arraytable objectAtIndex:indexPath.row]];
    
    urlStr=[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest  *rqust = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    
    [globalobj GlobalDict:rqust Globalstr:@"array" Withblock:^(id result, NSError *error) {
        
       NSArray   *choosenLocationData=[result valueForKey:@"results"];
        if (choosenLocationData.count>0)
        {
            NSLog(@"resul--->%@",[choosenLocationData objectAtIndex:0]);
            
             location_lat=[[[[choosenLocationData objectAtIndex:0] valueForKey:@"geometry"] valueForKey:@"location"] valueForKey:@"lat"];
             location_long=[[[[choosenLocationData objectAtIndex:0] valueForKey:@"geometry"] valueForKey:@"location"] valueForKey:@"lng"];
            
        }
        
    }];
    
     location_table.hidden = YES;
    radus_View.hidden = NO;
    
    [radius_Text becomeFirstResponder];
    
    
//     [self dismissViewControllerAnimated:YES completion:^{
//         
//         
//          [[NSNotificationCenter defaultCenter] postNotificationName:@"getAddress" object:[Arraytable objectAtIndex:indexPath.row]];
//         
//     }];
    
   
    
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)done:(UIButton *)sender {
    
    
    if (location_textfield.text.length>0 && radius_Text.text.length>0)
    {
        NSMutableDictionary *dic = [NSMutableDictionary new];
        
        [dic setObject:location_textfield.text forKey:@"address"];
        [dic setObject:radius_Text.text forKey:@"radius"];
        [dic setObject:location_lat forKey:@"lat"];
        [dic setObject:location_long forKey:@"lon"];
        
        
        
        [self dismissViewControllerAnimated:YES completion:^{
            
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"getAddress" object:dic];
            
        }];
    }
    else
    {
        
        [self dismissViewControllerAnimated:YES completion:^{
            
            
            
            
        }];
    }
    
    
    
}

- (IBAction)cross:(UIButton *)sender {
    
    location_textfield.text = @"";
    
     cross.hidden = YES;
    
}

- (IBAction)back:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
