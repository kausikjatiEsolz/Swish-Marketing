//
//  NewCampainViewController.h
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 06/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "App_Header.h"

@interface NewCampainViewController : UIViewController<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    __weak IBOutlet UIView *Main_view;
    __weak IBOutlet UIView *header_base;
    
    __weak IBOutlet UIButton *add_btn;
    __weak IBOutlet UIView *newCampainview;
    __weak IBOutlet UIScrollView *scroll_view;
    
    __weak IBOutlet UITextField *addres_filed;
    __weak IBOutlet UILabel *address_lbl;
    __weak IBOutlet UILabel *line_lbl;
    __weak IBOutlet UIView *date_view;
    
    __weak IBOutlet UILabel *line1_lbl;
    
    
    
    __weak IBOutlet UIButton *nextBtn;
    
    __weak IBOutlet UIVisualEffectView *location_view;
    __weak IBOutlet UIView *view1;
    __weak IBOutlet UIView *view2;
    __weak IBOutlet UIView *view3;
    
    //
    
    IBOutlet UIView *footer_view;
    __weak IBOutlet UITableView *address_Table;
    
    
    __weak IBOutlet UITextField *campaign_Name;
    
    ///
    __weak IBOutlet UITableView *stateTable;
    __weak IBOutlet UIView *date_pickerview;
    
    __weak IBOutlet UILabel *start_date_lbl;
    __weak IBOutlet UILabel *end_datelbl;
    
    __weak IBOutlet UIDatePicker *date_picker;
    
}
- (IBAction)Address_Add:(UIButton *)sender;


- (IBAction)location_btnTap:(UIButton *)sender;

- (IBAction)view_onGmap:(UIButton *)sender;

@property(strong,nonatomic)NSMutableArray *selected_addressArray;

- (IBAction)date_OK_Cancel:(UIButton *)sender;
- (IBAction)end_date:(UIButton *)sender;
- (IBAction)start_date:(UIButton *)sender;



@end
