//
//  ViewReviews_ViewController.h
//  Promoter_List
//
//  Created by Kausik_Jati on 27/04/17.
//  Copyright © 2017 Kausik_Jati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewReviews_ViewController : UIViewController
{
    NSMutableArray *api_array,*aboutme_array,*byme_array,*ary1,*ary2,*ary3,*ary4;
    UIFont *text_font;
    IBOutlet UITableView *viewreview_table;
    IBOutlet UILabel *btn_lbl1;
    IBOutlet UIView *btn_view;

    __weak IBOutlet UIView *header_base;
    __weak IBOutlet UIView *main_view;


}
@property (strong, nonatomic) IBOutlet UIButton *aboutme;
@property (strong, nonatomic) IBOutlet UIButton *byme;

@end
