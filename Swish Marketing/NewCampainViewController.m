//
//  NewCampainViewController.m
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 06/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "NewCampainViewController.h"
#import "StateCell.h"
#import "Json_Class.h"
#import "EnterLocationController.h"
#import "FinalAddressCell.h"
#import "GmapsDemoController.h"

@interface NewCampainViewController ()
{
    float upadte_y, spacing;
    
    
    NSMutableArray *selected_State,*table_DATA;
    App_Header *heade_view;
    
    
    UIButton *done_btn;
    
    
    CGRect date_viewFrame;
    
    
    
    UIButton *check_BTN;
    
    NSMutableArray *final_selectedState , *final_selected_address;
    
    
    
}



@end
@implementation NewCampainViewController
@synthesize selected_addressArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    heade_view = [[App_Header alloc]init];
    
    [heade_view header_Class:@"NEW CAMPAIGN" head_object:heade_view view:header_base controller:self Main_view:Main_view ButtonImage:@"hamburger menu"];
    
    
    final_selectedState = [NSMutableArray new];
    final_selected_address = [NSMutableArray new];
    
    [self shadow:newCampainview];
    
    spacing = address_lbl.frame.origin.y - line1_lbl.frame.origin.y-1;
    
    
    upadte_y = line_lbl.frame.origin.y + 1;
    
    
    date_viewFrame = date_view.frame;
  
    /// header Done Btn
    
    [done_btn removeFromSuperview];
    
    done_btn = [[UIButton alloc]initWithFrame:CGRectMake(heade_view.Alert_Btn.frame.origin.x-10, heade_view.Alert_Btn.frame.origin.y, heade_view.Alert_Btn.frame.size.width, heade_view.Alert_Btn.frame.size.height-5)];
    
    done_btn.backgroundColor = [UIColor whiteColor];
    done_btn.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
    [done_btn setTitle:@"Done" forState:UIControlStateNormal];
    [done_btn addTarget:self action:@selector(doneTap:) forControlEvents:UIControlEventTouchUpInside];
    [done_btn setTitleColor:[UIColor colorWithRed:85.0/255.0f green:166.0/255.0f blue:199.0/255.0f alpha:1.0] forState:UIControlStateNormal];
    
    done_btn.hidden = YES;
    
    [heade_view addSubview:done_btn];
    
    
    
    ///Location View Set////
    
    [self.view addSubview:location_view];
    location_view.frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20);
    location_view.hidden = YES;
    
    [self style:view1];
    [self style:view2];
    [self style:view3];
    
    ///STATE LISTING VIEW///
    
    
    [newCampainview addSubview:stateTable];
    stateTable.frame = CGRectMake(0, 0, newCampainview.frame.size.width, newCampainview.frame.size.height);
    stateTable.hidden = YES;
    
    selected_State = [NSMutableArray new];
    
    table_DATA = [NSMutableArray new];
    
    [self state_list];
    
//    for (int i=0; i<=10; i++)
//    {
//        [table_DATA addObject:[NSString stringWithFormat:@"%d",i]];
//    }
//    
    
    
    
    
    
    ///
    
     address_Table.hidden = YES;
    
    
    ///custom address
    
    selected_addressArray = [NSMutableArray new];
    
    
    date_pickerview.frame = CGRectMake(0, Main_view.frame.size.height, Main_view.frame.size.width, date_pickerview.frame.size.height);
    
    date_pickerview.hidden = YES;
    
    
}


-(void)style:(UIView *)view
{
    view.clipsToBounds =YES;
    view.layer.cornerRadius = 10;
    view.layer.borderWidth = 1;
    view.layer.borderColor = [[UIColor lightGrayColor]CGColor];
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

//-(void)left_menu:(int)value
//{
//    NSLog(@"leftmenu--->%d",value);
//    
//    
//}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == stateTable)
    {
        StateCell *cell = [tableView dequeueReusableCellWithIdentifier:@"state_cell"];
        
        
        cell.state_name.text = [[table_DATA objectAtIndex:indexPath.row] valueForKey:@"name"];
        
        if ([selected_State containsObject:[table_DATA objectAtIndex:indexPath.row]])
        {
            cell.tick_image.image = [UIImage imageNamed:@"Tick"];
        }
        else
        {
            cell.tick_image.image = [UIImage imageNamed:@"Oval 3 Copy 2"];
        }
        
        
        return cell;
        
    }
    else if (tableView==address_Table)
    {
       /* static NSString *cellID=@"CellID";
        
        UITableViewCell *myCell=[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if(myCell==nil)
        {
            
            myCell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            
        }
        
        myCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return myCell;
        
       */
        
        FinalAddressCell *cell_new = [tableView dequeueReusableCellWithIdentifier:@"address_final"];
        
        
        cell_new.tick_btn.tag =indexPath.row;
        
        
        
        
        
        
        if (tableView.tag==0)
        {
            cell_new.state_name.text = [[selected_State objectAtIndex:indexPath.row] valueForKey:@"name"];
            
            if ([final_selectedState containsObject:[selected_State objectAtIndex:indexPath.row]])
            {
                cell_new.tick_image.image = [UIImage imageNamed:@"Tick"];
            }
            else
            {
                cell_new.tick_image.image = [UIImage imageNamed:@"Oval 3 Copy 2"];
            }
            
            
            [cell_new.tick_btn addTarget:self action:@selector(stateBTN:) forControlEvents:UIControlEventTouchUpInside];
           
            cell_new.miles.hidden= YES;
            
        }
        else
        {
             cell_new.state_name.text = [[selected_addressArray objectAtIndex:indexPath.row] valueForKey:@"address"];
            
            
            cell_new.miles.hidden= NO;
            
            cell_new.miles.text = [NSString stringWithFormat:@"Radius\n%@",[[selected_addressArray objectAtIndex:indexPath.row] valueForKey:@"radius"]];
            
            if ([final_selected_address containsObject:[selected_addressArray objectAtIndex:indexPath.row]])
            {
                cell_new.tick_image.image = [UIImage imageNamed:@"Tick"];
            }
            else
            {
                cell_new.tick_image.image = [UIImage imageNamed:@"Oval 3 Copy 2"];
            }
            
            [cell_new.tick_btn addTarget:self action:@selector(addressBTN:) forControlEvents:UIControlEventTouchUpInside];
        }
        
       
        
        
        
        
        return cell_new;
        
    }
    
    
    return nil;
}


-(void)stateBTN:(UIButton *)sender
{
    if ([final_selectedState containsObject:[selected_State objectAtIndex:sender.tag]])
    {
        [final_selectedState removeObject:[selected_State objectAtIndex:sender.tag]];
        
    }
    else
    {
        [final_selectedState addObject:[selected_State objectAtIndex:sender.tag]];
        
        
    }
    
    
    
    
    
    NSIndexPath* index_path = [NSIndexPath indexPathForRow:sender.tag inSection:0];
    
    [address_Table beginUpdates];
    [address_Table reloadRowsAtIndexPaths:@[index_path] withRowAnimation:UITableViewRowAnimationFade];
    [address_Table endUpdates];
}

-(void)addressBTN:(UIButton *)sender
{
    if ([final_selected_address containsObject:[selected_addressArray objectAtIndex:sender.tag]])
    {
        [final_selected_address removeObject:[selected_addressArray objectAtIndex:sender.tag]];
        
    }
    else
    {
        [final_selected_address addObject:[selected_addressArray objectAtIndex:sender.tag]];
        
        
    }
    
    
    
    
    
    NSIndexPath* index_path = [NSIndexPath indexPathForRow:sender.tag inSection:0];
    
    [address_Table beginUpdates];
    [address_Table reloadRowsAtIndexPaths:@[index_path] withRowAnimation:UITableViewRowAnimationFade];
    [address_Table endUpdates];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
   /*
    if (tableView==address_Table)
    {
        
        for (UILabel *obj  in cell.subviews)
        {
            [obj removeFromSuperview];
        }
        
        UILabel *address = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
       
        if (tableView.tag==0)
        {
            address.text = [[selected_State objectAtIndex:indexPath.row] valueForKey:@"name"];
        }
        else
        {
            address.text = [selected_addressArray objectAtIndex:indexPath.row];
        }
        
        
        address.font = addres_filed.font;
        
        address.textColor = addres_filed.textColor;
        
        [cell addSubview:address];
        
        
        
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, cell.frame.size.height-1,cell.frame.size.width , 1)];
        
        line.backgroundColor = line_lbl.backgroundColor;;
        
        
        [cell addSubview:line];
        
        
    }
    */
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == stateTable)
    {
        
    
    if ([selected_State containsObject:[table_DATA objectAtIndex:indexPath.row]])
    {
        [selected_State removeObject:[table_DATA objectAtIndex:indexPath.row]];

    }
    else
    {
        [selected_State addObject:[table_DATA objectAtIndex:indexPath.row]];
        
        
    }
    
        
        NSLog(@"selected_State-->%@",selected_State);
        
        
    NSIndexPath* index_path = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
        
    [tableView beginUpdates];
    [tableView reloadRowsAtIndexPaths:@[index_path] withRowAnimation:UITableViewRowAnimationFade];
    [tableView endUpdates];
        
    }
    
    else if (tableView==address_Table)
    {
        if (tableView.tag==0)
        {
            
            stateTable.hidden = NO;
            
            done_btn.hidden = NO;
            heade_view.Alert_Btn.hidden = YES;
            heade_view.alert_count.hidden = YES;
            
            nextBtn.hidden = YES;
            
            
            
          
            
        }
        else
        {
            
            EnterLocationController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"enterlocation"];
            
            
            [self presentViewController:obj animated:YES completion:nil];
            
            
            
            
        }
        
        
    }
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == stateTable)
    {
        return 50;
    }
    if (tableView==address_Table)
    {
        return 60;
    }
    
    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == stateTable)
    {
        return table_DATA.count;
    }
    if (tableView==address_Table)
    {
        if (tableView.tag==0)
        {
            return selected_State.count;
        }
        else
        {
            return selected_addressArray.count;
        }
        
    }
    
    
    return 0;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField== addres_filed)
    {
        [campaign_Name resignFirstResponder];
        
        location_view.hidden=NO;
        return NO;
    }
    
    return YES;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
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


-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"getAddress" object:nil];
    
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getAddress:) name:@"getAddress" object:nil];
    
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    if (selected_State.count>0 || selected_addressArray.count>0)
    {
        [address_Table reloadData];
        
        address_Table.frame = CGRectMake(address_Table.frame.origin.x, addres_filed.frame.origin.y, address_Table.frame.size.width, address_Table.contentSize.height);
        
        date_view.frame = CGRectMake(date_view.frame.origin.x, address_Table.frame.origin.y+address_Table.frame.size.height+ spacing, date_view.frame.size.width, date_view.frame.size.height);
        
        
        
        scroll_view.contentSize = CGSizeMake(scroll_view.frame.size.width, date_view.frame.origin.y+date_view.frame.size.height + 25);
    }
    
   
}


-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (tableView==address_Table)
    {
        if (tableView.tag!=0)
        {
            return footer_view;
        }
        
        
        return nil;
    }
    
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (tableView==address_Table)
    {
        if (tableView.tag!=0)
        {
            return footer_view.frame.size.height;
        }
        
        
        return 0;
    }

    return 0;
}

//-(void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section
//{
//    if (tableView==address_Table)
//    {
//        if (tableView.tag!=1)
//        {
//            footer_view.frame = CGRectMake(0, 0, tableView.frame.size.width, footer_view.frame.size.height);
//            
//        }
//    }
//
//}


-(void)getAddress:(NSNotification *)notify
{
    NSLog(@"get--->%@",notify.object);
    
    address_Table.hidden = NO;
    
    [selected_addressArray addObject:notify.object];
    [final_selected_address addObject:notify.object];
    
    
    [address_Table reloadData];
    
    address_Table.frame = CGRectMake(address_Table.frame.origin.x, addres_filed.frame.origin.y, address_Table.frame.size.width, address_Table.contentSize.height);
    
    date_view.frame = CGRectMake(date_view.frame.origin.x, address_Table.frame.origin.y+address_Table.frame.size.height+ spacing, date_view.frame.size.width, date_view.frame.size.height);
    
    
    
    scroll_view.contentSize = CGSizeMake(scroll_view.frame.size.width, date_view.frame.origin.y+date_view.frame.size.height + 25);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Address_Add:(UIButton *)sender {
    
    location_view.hidden = NO;
    
//    if (![view1.backgroundColor isEqual:[UIColor whiteColor]])
//    {
//        location_view.hidden = NO;
//    }
//    else if (![view2.backgroundColor isEqual:[UIColor whiteColor]])
//    {
//        location_view.hidden = NO;
//    }
//
//    if (![view2.backgroundColor isEqual:[UIColor whiteColor]])
//    {
//        location_view.hidden = NO;
//        
//       
//    }

    
    
   /*
    
    UILabel *addre_lbl = [[UILabel alloc]initWithFrame:CGRectMake(address_lbl.frame.origin.x, upadte_y+spacing, address_lbl.frame.size.width, address_lbl.frame.size.height)];
    
    upadte_y = addre_lbl.frame.size.height+addre_lbl.frame.origin.y;
    
    
    addre_lbl.font = address_lbl.font;
    addre_lbl.text = address_lbl.text;
    addre_lbl.textColor = address_lbl.textColor;
    
    
    
    [scroll_view addSubview:addre_lbl];
    
    
    
    add_btn.frame = CGRectMake(add_btn.frame.origin.x, (addre_lbl.frame.origin.y+addre_lbl.frame.size.height) -add_btn.frame.size.height/2 - addre_lbl.frame.size.height/2, add_btn.frame.size.width, add_btn.frame.size.height);
    
    
    
    UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(addres_filed.frame.origin.x, upadte_y, addres_filed.frame.size.width, addres_filed.frame.size.height)];
    
    text.placeholder  = addres_filed.placeholder;
    text.font = addres_filed.font;
    text.backgroundColor = [UIColor clearColor];
    
    [scroll_view addSubview:text];
    
    
   
    
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(line_lbl.frame.origin.x, text.frame.origin.y+text.frame.size.height -2, line_lbl.frame.size.width, line_lbl.frame.size.height)];
    

    line.backgroundColor = line_lbl.backgroundColor ;
    
    [scroll_view addSubview:line];
    
    
    
    
    
    
    
    
    upadte_y = text.frame.size.height+text.frame.origin.y;
    
    
    
    
    date_view.frame = CGRectMake(date_view.frame.origin.x, upadte_y+spacing, date_view.frame.size.width, date_view.frame.size.height);
    
    
    
    scroll_view.contentSize = CGSizeMake(scroll_view.frame.size.width, date_view.frame.origin.y+date_view.frame.size.height + 25);
    
    
    
    */
    
    
    
    
    
    
    
    
}


-(void)doneTap:(UIButton *)sender
{
     nextBtn.hidden=NO;
    done_btn.hidden = YES;
    heade_view.Alert_Btn.hidden = NO;
    heade_view.alert_count.hidden = NO;
    
    stateTable.hidden  =YES;
    
    final_selectedState = [selected_State mutableCopy];
    address_Table.tag = 0;
    
    address_Table.allowsMultipleSelectionDuringEditing = NO;

    
   
    
    
    if (selected_State.count>0)
    {
        
        [address_Table reloadData];
        
        address_Table.hidden = NO;
    
    address_Table.frame = CGRectMake(address_Table.frame.origin.x, addres_filed.frame.origin.y, address_Table.frame.size.width, address_Table.contentSize.height);
    
    date_view.frame = CGRectMake(date_view.frame.origin.x, address_Table.frame.origin.y+address_Table.frame.size.height+ spacing, date_view.frame.size.width, date_view.frame.size.height);
    
    
    
    scroll_view.contentSize = CGSizeMake(scroll_view.frame.size.width, date_view.frame.origin.y+date_view.frame.size.height + 25);
        
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    
    if (tableView==address_Table)
    {
        if (tableView.tag==1)
        {
            return YES;
        }
        return NO;
    }
    return NO;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView==address_Table)
    {
        if (tableView.tag==1)
        {
            if (editingStyle == UITableViewCellEditingStyleDelete) {
                //add code here for when you hit delete
                
                [address_Table beginUpdates];
                
                [selected_addressArray removeObjectAtIndex:indexPath.row];
                [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                
                [address_Table endUpdates];
            
            
                address_Table.frame = CGRectMake(address_Table.frame.origin.x, address_Table.frame.origin.y, address_Table.frame.size.width, address_Table.contentSize.height);
                
                date_view.frame = CGRectMake(date_view.frame.origin.x, address_Table.frame.origin.y+address_Table.frame.size.height+ spacing, date_view.frame.size.width, date_view.frame.size.height);
                
                
                
                scroll_view.contentSize = CGSizeMake(scroll_view.frame.size.width, date_view.frame.origin.y+date_view.frame.size.height + 25);
                
                
                if (selected_addressArray.count==0)
                {
                    address_Table.hidden=YES;
                    
                     date_view.frame = date_viewFrame;
                }
                
            
            }
        }
    }
    
    
}


-(void)update_view:(UIView *)view_obj
{
    
    
    view_obj.backgroundColor = [UIColor whiteColor];
    
    for (id new_obj in view_obj.subviews)
    {
        if([new_obj isKindOfClass:[UIImageView class]])
        {
            UIImageView *local_imageView = (UIImageView *)new_obj;
            
            local_imageView.image = [UIImage imageNamed:@"Oval 3 Copy 2"];
            
        }
        else if ([new_obj isKindOfClass:[UILabel class]])
        {
            UILabel *local_lbl = (UILabel *)new_obj;
            
            local_lbl.textColor = [UIColor colorWithRed:85.0/255.0f green:166.0/255.0f blue:199.0/255.0f alpha:1.0];

        }
    }
}



- (IBAction)location_btnTap:(UIButton *)sender {
    
    
    location_view.hidden=YES;
    
    
    
    if (sender.tag==0)
    {
        
        address_Table.hidden = YES;
        
        date_view.frame = date_viewFrame;
        
        add_btn.hidden = NO;
        
         addres_filed.text = @"US";
        
        sender.superview.backgroundColor = [UIColor colorWithRed:85.0/255.0f green:166.0/255.0f blue:199.0/255.0f alpha:1.0];
        
        for (id new_obj in sender.superview.subviews)
        {
            if([new_obj isKindOfClass:[UIImageView class]])
            {
                UIImageView *local_imageView = (UIImageView *)new_obj;
                
                local_imageView.image = [UIImage imageNamed:@"radio-on-button"];
            }
            else if ([new_obj isKindOfClass:[UILabel class]])
            {
                UILabel *local_lbl = (UILabel *)new_obj;
                
                local_lbl.textColor = [UIColor whiteColor];
            }
        }
        
        [self update_view:view2];
         [self update_view:view3];
        
         scroll_view.contentSize = CGSizeMake(scroll_view.frame.size.width, date_view.frame.origin.y+date_view.frame.size.height + 25);
        
        
        
        
    }
    else if (sender.tag==1)
    {
        add_btn.hidden = NO;
        
        done_btn.hidden = NO;
        heade_view.Alert_Btn.hidden = YES;
        heade_view.alert_count.hidden = YES;
        
        nextBtn.hidden=YES;
        
        
        sender.superview.backgroundColor = [UIColor colorWithRed:85.0/255.0f green:166.0/255.0f blue:199.0/255.0f alpha:1.0];
        
        for (id new_obj in sender.superview.subviews)
        {
            if([new_obj isKindOfClass:[UIImageView class]])
            {
                UIImageView *local_imageView = (UIImageView *)new_obj;
                
                local_imageView.image = [UIImage imageNamed:@"radio-on-button"];
            }
            else if ([new_obj isKindOfClass:[UILabel class]])
            {
                UILabel *local_lbl = (UILabel *)new_obj;
                
                local_lbl.textColor = [UIColor whiteColor];
            }
        }
        
        [self update_view:view1];
        [self update_view:view3];
        
        
        
        stateTable.hidden = NO;
        
        
        
        
    }
    else if (sender.tag==2)
    {
     
        
        if (selected_addressArray.count>0)
        {
            address_Table.hidden = NO;

            
        }
        else
        {
            address_Table.hidden = YES;

        }
        
        address_Table.tag = 1;
        
        [address_Table reloadData];
        
        address_Table.allowsMultipleSelectionDuringEditing = NO;
        
        
        date_view.frame = date_viewFrame;
        
        add_btn.hidden = NO;
        
        addres_filed.text =@"";
        
        sender.superview.backgroundColor = [UIColor colorWithRed:85.0/255.0f green:166.0/255.0f blue:199.0/255.0f alpha:1.0];
        
        for (id new_obj in sender.superview.subviews)
        {
            if([new_obj isKindOfClass:[UIImageView class]])
            {
                UIImageView *local_imageView = (UIImageView *)new_obj;
                
                local_imageView.image = [UIImage imageNamed:@"radio-on-button"];
            }
            else if ([new_obj isKindOfClass:[UILabel class]])
            {
                UILabel *local_lbl = (UILabel *)new_obj;
                
                local_lbl.textColor = [UIColor whiteColor];
            }
        }
        
        [self update_view:view1];
        [self update_view:view2];
        
        
         scroll_view.contentSize = CGSizeMake(scroll_view.frame.size.width, date_view.frame.origin.y+date_view.frame.size.height + 25);
        
        
        EnterLocationController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"enterlocation"];
        
        
        [self presentViewController:obj animated:YES completion:nil];
        
    }
    
}

- (IBAction)view_onGmap:(UIButton *)sender {
    
    
    
    
    GmapsDemoController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"maps"];
    
    obj.lat_logArray = [selected_addressArray mutableCopy];
    
    [self presentViewController:obj animated:YES completion:nil];
    
    
    
}
- (IBAction)date_OK_Cancel:(UIButton *)sender {
    
    if (check_BTN.tag == 0)
    {
        if ([sender.titleLabel.text isEqualToString:@"OK"])
        {
                NSDateFormatter *df = [[NSDateFormatter alloc] init];
                [df setDateFormat:@"dd-MM-yyyy"];
                start_date_lbl.text = [NSString stringWithFormat:@"%@",[df stringFromDate:date_picker.date]];
            
            
            end_datelbl.text = @"End Date";

        }
        else
        {
            
        }
        
    }
    else
    {
        if ([sender.titleLabel.text isEqualToString:@"OK"])
        {
            NSDateFormatter *df = [[NSDateFormatter alloc] init];
            [df setDateFormat:@"dd-MM-yyyy"];
            end_datelbl.text = [NSString stringWithFormat:@"%@",[df stringFromDate:date_picker.date]];
            
            
            
            
        }
    }
    
    
    [self date_pickerHidden];
    
    
}

- (IBAction)end_date:(UIButton *)sender {
    
     [campaign_Name resignFirstResponder];
    
    check_BTN = sender;
    [self date_pickerShow];
    
    date_picker.minimumDate =[[self date_limit:start_date_lbl.text] dateByAddingTimeInterval:(24*60*60)*5] ;
    
    date_picker.maximumDate =[[self date_limit:start_date_lbl.text] dateByAddingTimeInterval:(24*60*60)*25] ;
    
}

- (IBAction)start_date:(UIButton *)sender {
    
     [campaign_Name resignFirstResponder];
    
    check_BTN = sender;
    
    [self date_pickerShow];
    
    
    date_picker.maximumDate = [self date_limit:@"01-01-2050"];
    
    date_picker.minimumDate =[NSDate date] ;
    
    
    
    
}


-(void)date_pickerShow
{
    date_pickerview.hidden = NO;
    
    [UIView animateWithDuration:.3f animations:^{
       
        
        date_pickerview.frame = CGRectMake(0, Main_view.frame.size.height-date_pickerview.frame.size.height, Main_view.frame.size.width, date_pickerview.frame.size.height);
        
        
        
    }];
}



-(void)date_pickerHidden
{
    [UIView animateWithDuration:.3f animations:^{
        
        
        date_pickerview.frame = CGRectMake(0, Main_view.frame.size.height, Main_view.frame.size.width, date_pickerview.frame.size.height);
        
        
        
    }completion:^(BOOL finished) {
        
        date_pickerview.hidden = YES;
        
    }];
}

-(NSDate *)date_limit:(NSString *)date_string
{
    NSString *finalDate = date_string;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyy"];
    NSDate *date = [dateFormatter dateFromString:finalDate];
    
    return date;
}

@end
