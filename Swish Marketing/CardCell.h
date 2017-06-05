//
//  CardCell.h
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 02/05/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIButton *select_btn;
@property (strong, nonatomic) IBOutlet UIImageView *cardtype_img;
@property (strong, nonatomic) IBOutlet UILabel *name_lbl;
@property (strong, nonatomic) IBOutlet UILabel *cardno_lbl;
@property (strong, nonatomic) IBOutlet UIView *cell_view;

@end
