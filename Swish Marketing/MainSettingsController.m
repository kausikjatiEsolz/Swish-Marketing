//
//  MainSettingsController.m
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 19/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "MainSettingsController.h"
#import "SettingsCell.h"
#import "App_Header.h"
#import "Settings_Controller.h"
#import "ProductpictureController.h"
#import "Crad_detailsController.h"

@interface MainSettingsController ()
{
    NSArray *setting_Data;
    
    NSString *indexCheck;
}

@end

@implementation MainSettingsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    indexCheck = @"";
    
    App_Header *heade_view = [[App_Header alloc]init];
    
    [heade_view header_Class:@"SETTINGS" head_object:heade_view view:header_base controller:self Main_view:main_view ButtonImage:@"Back topbar"];
    
    
    
    setting_Data = [[NSArray alloc]initWithObjects:@"EDIT PROFILE",@"STORED PAYMENT METHOD",@"UPLOAD PRODUCT PICTURES",@"UPLOAD STORE PICTURES",@"UPLOAD OTHER MEDIA", nil];
    
    [setting_Table reloadData];
    
    
    setting_Table.frame = CGRectMake(setting_Table.frame.origin.x, header_base.frame.origin.y+header_base.frame.size.height+10, setting_Table.frame.size.width, setting_Table.contentSize.height);
    
    
    notification_view.frame  = CGRectMake(notification_view.frame.origin.x, setting_Table.frame.origin.y+setting_Table.frame.size.height+8, notification_view.frame.size.width, notification_view.frame.size.height);
    
    
    connectSocialmedia.frame = CGRectMake(connectSocialmedia.frame.origin.x, notification_view.frame.origin.y+notification_view.frame.size.height+18, connectSocialmedia.frame.size.width, connectSocialmedia.frame.size.height);
    
    
    [self shadow:(UIView *)setting_Table];
    [self shadow:notification_view];
    [self shadow:connectSocialmedia];
    
    
    
    
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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SettingsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"settingsCell"];
    
    cell.name.text = [setting_Data objectAtIndex:indexPath.row];
    
    
    if ([[NSString stringWithFormat:@"%lu",indexPath.row] isEqualToString:indexCheck])
    {
        cell.name.textColor = [UIColor colorWithRed:85.0/255.0f green:166.0/255.0f blue:199.0/255.0f alpha:1.0];
        
        cell.arrow_image.image = [UIImage imageNamed:@"Right arrow1"];
    }
    else
    {
        cell.name.textColor = [UIColor blackColor];
         cell.arrow_image.image = [UIImage imageNamed:@"forword topbar"];
    }
    
    if (setting_Data.count-1==indexPath.row)
    {
        cell.LINE.hidden=YES;
    }
    else
    {
         cell.LINE.hidden=NO;
    }
    
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return setting_Data.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    NSIndexPath* index_pathPrevious = [NSIndexPath indexPathForRow:[indexCheck integerValue] inSection:0];
    indexCheck = [NSString stringWithFormat:@"%lu",indexPath.row];
    
    [tableView beginUpdates];
    [tableView reloadRowsAtIndexPaths:@[indexPath,index_pathPrevious] withRowAnimation:UITableViewRowAnimationFade];
    [tableView endUpdates];

    
    if (indexPath.row==1)
    {
        Crad_detailsController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"card_details"];
        
        [self.navigationController pushViewController:obj animated:YES];
    }
    
    else if (indexPath.row==2)
    {
        ProductpictureController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"productpic"];
        
        [self.navigationController pushViewController:obj animated:YES];
    }
    
    
}


-(IBAction)notification:(id)sender
{
    Settings_Controller *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"setting"];
    [self.navigationController pushViewController:obj animated:YES];
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
