//
//  FinalAddressCell.h
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 04/05/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FinalAddressCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *tick_image;
@property (weak, nonatomic) IBOutlet UILabel *state_name;
@property (weak, nonatomic) IBOutlet UIButton *tick_btn;
@property (weak, nonatomic) IBOutlet UILabel *miles;

@end
