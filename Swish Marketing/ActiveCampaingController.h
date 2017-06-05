//
//  ActiveCampaingController.h
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 13/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActiveCampaingController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    __weak IBOutlet UIView *mainview;
    __weak IBOutlet UIView *headerbaseview;
    
    
    IBOutlet UIView *table_headerView;
    
    __weak IBOutlet UIView *base_view;
    
    
    __weak IBOutlet UILabel *nodata_found;
    __weak IBOutlet UITableView *table_campaing;
    
}

@property(nonatomic,strong)NSString *active_past;

@end
