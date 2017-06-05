//
//  Crad_detailsController.h
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 02/05/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardCell.h"

@interface Crad_detailsController : UIViewController
{
    __weak IBOutlet UIView *main_view;
    __weak IBOutlet UIView *header_base;
     NSMutableArray *lbl1_array,*lbl2_array,*img_array,*img_array2,*main_array;
    IBOutlet UITableView *settings_table;
    CardCell *CELL;
}
@property (strong, nonatomic) IBOutlet UIView *headerview;
@property (strong, nonatomic) IBOutlet UIView *footerview;


@end
