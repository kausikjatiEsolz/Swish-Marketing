//
//  ActiveCampaingController.m
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 13/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "ActiveCampaingController.h"
#import "App_Header.h"
#import "ActiveCampainCell.h"
#import "Json_Class.h"
#import "CampainDetailsController.h"

@interface ActiveCampaingController ()
{
    Json_Class *url_obj;
    NSUserDefaults *user_data;
    
    NSMutableArray *dataArray;
    
    NSString *next_Value;
}

@end

@implementation ActiveCampaingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    url_obj = [Json_Class new];
    
    App_Header *heade_view = [[App_Header alloc]init];
    
    user_data = [NSUserDefaults standardUserDefaults];
    
    dataArray = [NSMutableArray new];
    
    next_Value = @"0";
    
    NSString *titel = @"";
    
    if ([self.active_past isEqualToString:@"active"])
    {
        titel =@"ACTIVE AD CAMPAIGNS";
    }
    else
    {
         titel =@"PAST AD CAMPAIGNS";
    }
    [heade_view header_Class:titel head_object:heade_view view:headerbaseview controller:self Main_view:mainview ButtonImage:@"Back topbar"];
    
    
    [self shadow:base_view];
    
    
    [self url_data:next_Value];
    
    // Do any additional setup after loading the view.
}


-(void)url_data:(NSString *)nextvalue
{
    
    
    if (nextvalue.length>0)
    {
          NSString *url = @"";
        
        if ([self.active_past isEqualToString:@"active"])
        {
            url = [NSString stringWithFormat:@"%@Jsonapp_control/active_campaign?user_id=%@&user_type=%@&start_from=%@&perpage=10",App_Domain_Url,[user_data valueForKey:@"userId"],[user_data valueForKey:@"userType"],nextvalue];
        }
        else
        {
            url = [NSString stringWithFormat:@"%@Jsonapp_control/past_campaign?user_id=%@&user_type=%@&start_from=%@&perpage=10",App_Domain_Url,[user_data valueForKey:@"userId"],[user_data valueForKey:@"userType"],nextvalue];
        }
        
      
        NSLog(@"url--->%@",url);
        
        NSMutableURLRequest *requst = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:url]];
        
        [url_obj GlobalDict:requst Globalstr:@"array" Withblock:^(id result, NSError *error) {
           
            if (result)
            {
                NSString  *response = [NSString stringWithFormat:@"%@",[result valueForKey:@"response"]];
                NSLog(@"result--->%@",result);
                
                if ([response isEqualToString:@"1"])
                {
                    NSMutableArray *data;
                    
                    if ([self.active_past isEqualToString:@"active"])
                    {
                        
                        data = [[[result valueForKey:@"info"]valueForKey:@"active_campaign_info"]valueForKey:@"active_camp"];
                    }
                    else
                    {
                        
                        data = [[[result valueForKey:@"info"]valueForKey:@"past_campaign_info"]valueForKey:@"past_camp"];
                    }
                    
                   
                    
                    next_Value = [NSString stringWithFormat:@"%@",[result valueForKey:@"start_from"]];
                    
                    
                    [self insertDownloadedActions: data table:table_campaing];
                    
                    
                    
                    
                    //[self url_data:[result valueForKey:@"start_from"]];
                    
                    
                    if (data.count==0)
                    {
                        nodata_found.hidden = NO;
                        
                        table_campaing.hidden = YES;
                    }
                    
                    
                    
                }

            }
            else
            {
                
            }
            
            
            
            
        }];
        
        
        
    }
    
    else
    {
        NSLog(@"no data");
    }
    
    
    
    
}

-(void)insertDownloadedActions:(NSMutableArray *)dataToAdd table:(UITableView *)table
{
    // don't need this
    //__weak CurrentViewController *weakSelf = self;
    
    int64_t delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        
        // build the index paths for insertion
        // since you're adding to the end of datasource, the new rows will start at count
        NSMutableArray *indexPaths = [NSMutableArray array];
        NSInteger currentCount = dataArray.count;
        for (int i = 0; i < dataToAdd.count; i++) {
            [indexPaths addObject:[NSIndexPath indexPathForRow:currentCount+i inSection:0]];
        }
        
        // do the insertion
        [dataArray addObjectsFromArray:dataToAdd];
        
        // tell the table view to update (at all of the inserted index paths)
        
        // [table reloadData];
        [table beginUpdates];
        [table insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
        [table endUpdates];
    });
}

-(void)shadow:(UIView *)subview
{
    subview.layer.masksToBounds = NO;
    subview.layer.shadowOffset = CGSizeMake(0, 0);
    subview.layer.shadowRadius = 1;
    subview.layer.shadowOpacity = 0.5;
    subview.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActiveCampainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"activeCell"];
    
    cell.name.text = [NSString stringWithFormat:@"%@",[[dataArray objectAtIndex:indexPath.row] valueForKey:@"name"]];
    cell.click.text = [NSString stringWithFormat:@"%@",[[dataArray objectAtIndex:indexPath.row] valueForKey:@"clicks"]];
    
    if (indexPath.row == dataArray.count-1)
   {
        [self url_data:next_Value];
    }
    
    return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return table_headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return table_headerView.frame.size.height;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CampainDetailsController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"campdetails"];
    
    [self.navigationController pushViewController:obj animated:YES];
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

@end
