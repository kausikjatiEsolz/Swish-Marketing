//
//  App_Header.h
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 05/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Left_Menu.h"

@protocol Headerdelegate<NSObject>

@optional

-(void)pushmethod:(UIButton *)sender;

@end

@interface App_Header : UIView<UIGestureRecognizerDelegate>
{
    Left_Menu     *side_menu;
    
    UIView *header_baseview , *Main_view;
    NSUserDefaults *user_info;
    
    CGPoint translation;

     BOOL remove;
    
}
@property(assign) id <Headerdelegate> headerdelegate;
@property (weak, nonatomic) IBOutlet UILabel *alert_count;

@property (weak, nonatomic) IBOutlet UIButton *menu_back_Btn;
@property (weak, nonatomic) IBOutlet UIButton *Alert_Btn;
@property (weak, nonatomic) IBOutlet UILabel *header_lbl;
@property (weak , nonatomic) UIViewController *controller_obj;
@property (nonatomic,strong) UIPanGestureRecognizer *pan;

-(void)header_Class:(NSString *)Lable_Text head_object:(App_Header *)view view:(UIView *)subview controller:(UIViewController *)viewcontroller Main_view:(UIView *)main_view ButtonImage:(NSString *)imageName;


@end
