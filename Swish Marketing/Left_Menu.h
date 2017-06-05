//
//  Left_Menu.h
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 05/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol sideMenuDelegate <NSObject>

-(void)left_menu:(int)value;

@end


@interface Left_Menu : UIView <UITableViewDelegate,UITableViewDataSource>
{
      NSUserDefaults *user_info;
}
@property(assign) id <sideMenuDelegate> side_menuDelegate;

@property (weak, nonatomic) IBOutlet UITableView *side_menutable;
@property (strong,nonatomic)NSArray *business , *promoter ,*table_array;
@property (weak, nonatomic) IBOutlet UILabel *name_lbl;
@property (weak, nonatomic) IBOutlet UILabel *userType_lbl;
@property (weak, nonatomic) IBOutlet UIImageView *user_Image;



@end
