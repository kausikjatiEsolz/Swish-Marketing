//
//  MainSettingsController.h
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 19/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainSettingsController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    __weak IBOutlet UITableView *setting_Table;
    
    __weak IBOutlet UIView *notification_view;
    
    __weak IBOutlet UIView *connectSocialmedia;
    
    __weak IBOutlet UIView *header_base;
    
    __weak IBOutlet UIView *main_view;
    
    
}

@end
