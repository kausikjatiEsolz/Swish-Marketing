//
//  EnterLocationController.h
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 24/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnterLocationController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    __weak IBOutlet UIView *header_view;
    __weak IBOutlet UITableView *location_table;
    
    __weak IBOutlet UITextField *location_textfield;
    
    IBOutlet UIButton *cross;
    
    IBOutlet UITextField *radius_Text;
    IBOutlet UIView *radus_View;
    
}
- (IBAction)cross:(UIButton *)sender;
- (IBAction)back:(UIButton *)sender;
@end
