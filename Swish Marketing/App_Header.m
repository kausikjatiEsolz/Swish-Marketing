//
//  App_Header.m
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 05/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "App_Header.h"
#import "Left_Menu.h"
#import "NewCampainViewController.h"
#import "Social_connectController.h"
#import "Login_ViewController.h"
#import "MainSettingsController.h"
#import "ChatController.h"
#import "BusinessName_Controller.h"
#import "Dashboard_Controller.h"
#import "ActiveCampaingController.h"
#import "ViewReviews_ViewController.h"
//#import "UIViewController+Header_controller.h"

@implementation App_Header
@synthesize headerdelegate,header_lbl,controller_obj,menu_back_Btn,pan,alert_count;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame
{
    
    
      self=[super initWithFrame:frame];
    
    if (self)
        {
            self=[[[NSBundle mainBundle] loadNibNamed:@"App_Header" owner:self options:nil]objectAtIndex:0];
        }
    
    user_info = [NSUserDefaults standardUserDefaults];
    
    
    float widthIs =  [alert_count.text boundingRectWithSize:alert_count.frame.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:alert_count.font } context:nil] .size.width;
    
    
    
    if (alert_count.text.length==1)
    {
         alert_count.frame = CGRectMake(alert_count.frame.origin.x, alert_count.frame.origin.y, widthIs+10, alert_count.frame.size.height);
    }
    
    else
    {
         alert_count.frame = CGRectMake(alert_count.frame.origin.x, alert_count.frame.origin.y, widthIs+10, alert_count.frame.size.height);
    
    }
        
    
        alert_count.clipsToBounds  = YES;
    
    
        alert_count.layer.cornerRadius = 10 ;
    
    
    
    return self;
    
    
}



- (IBAction)homeTapped:(UIButton *)sender
{
   // [headerdelegate pushmethod:sender];
    
    if (sender.tag == 0)
    {
        if ([sender.imageView.image isEqual:[UIImage imageNamed:@"hamburger menu"]])
        {
            
            
        side_menu.hidden=NO;
        
        [UIView animateWithDuration:.25f animations:^{
            
            
            if (side_menu.frame.origin.x<0)
            {
                side_menu.frame = CGRectMake(0, header_baseview.frame.origin.y, controller_obj.view.frame.size.width/1.3, controller_obj.view.frame.size.height-header_baseview.frame.origin.y);
                
                
                Main_view.frame = CGRectMake(controller_obj.view.frame.size.width/1.3, 0, controller_obj.view.frame.size.width, controller_obj.view.frame.size.height);
            }
            else
            {
                side_menu.frame = CGRectMake(-controller_obj.view.frame.size.width/1.3, header_baseview.frame.origin.y, controller_obj.view.frame.size.width/1.3, controller_obj.view.frame.size.height-header_baseview.frame.origin.y);
                
                
                Main_view.frame = CGRectMake(0, 0, controller_obj.view.frame.size.width, controller_obj.view.frame.size.height);
            }
            
            
            
            
        }completion:^(BOOL finished) {
            
            if (side_menu.frame.origin.x<0)
            {
                side_menu.hidden=YES
                ;
                
            }
            
        }];
            
     }
        
    else
    {
        [controller_obj.navigationController popViewControllerAnimated:YES];
    }
 
    }
    
    else if (sender.tag == 1)
    {
        NSLog(@"Alert Tap");
    }
    
    
}

-(void)header_Class:(NSString *)Lable_Text head_object:(App_Header *)view view:(UIView *)subview controller:(UIViewController *)viewcontroller Main_view:(UIView *)main_view ButtonImage:(NSString *)imageName
{
    
    /* APP Header Set up */
    
    header_lbl.text = Lable_Text;
    [menu_back_Btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    view.frame = CGRectMake(0, 0, subview.frame.size.width, subview.frame.size.height);
    [subview addSubview:view];
   // view.headerdelegate = viewcontroller;
    
    subview.layer.masksToBounds = NO;
    subview.layer.shadowOffset = CGSizeMake(1, 1);
    subview.layer.shadowRadius = 1;
    subview.layer.shadowOpacity = 0.5;
    subview.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    
    
    /* SideMenu Set up */
    
    if ([imageName isEqualToString:@"hamburger menu"])
    {
    
        
            side_menu = [Left_Menu new];
            side_menu.frame = CGRectMake(-viewcontroller.view.frame.size.width/1.3, subview.frame.origin.y,viewcontroller.view.frame.size.width/1.3, viewcontroller.view.frame.size.height-subview.frame.origin.y);
            side_menu.side_menuDelegate = self;
            side_menu.hidden = YES;
            [viewcontroller.view addSubview:side_menu];

        
        
       pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(move:)];
        [main_view addGestureRecognizer:pan];
        
       UIPanGestureRecognizer  *leftmenu = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(left_menuPan:)];
        
        [side_menu addGestureRecognizer:leftmenu];
        
        
        remove = true;
    }
    
    
    controller_obj = viewcontroller;
    header_baseview = subview;
    Main_view = main_view;
    
    
//    NSString *restorationId = [controller_obj valueForKey:@"storyboardIdentifier"];
//    
//    [user_info setObject:restorationId forKey:@"current_controller"];
    
    
    
    
}

-(void)left_menuPan:(UIPanGestureRecognizer*)recognizer {
 
    translation = [recognizer translationInView:side_menu];
    CGPoint vel = [recognizer velocityInView:side_menu];
    
    
    
    CGRect recognizerFrame = recognizer.view.frame;
    recognizerFrame.origin.x += translation.x;
    recognizerFrame.origin.y += translation.y;
    
    
    if (translation.x<=0)
    {
       // NSLog(@"working");
        
        
        
        side_menu.frame = CGRectMake(translation.x, side_menu.frame.origin.y, side_menu.frame.size.width, side_menu.frame.size.height);
        
        Main_view.frame=CGRectMake(translation.x+side_menu.frame.size.width, 0, Main_view.frame.size.width, Main_view.frame.size.height);
        
        
       
    
    }
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        
        //NSLog(@"UIGestureRecognizerStateEnded");
        
        
        if (vel.x < 0)
        {
            [UIView animateWithDuration:.25f animations:^{
                side_menu.frame = CGRectMake(-controller_obj.view.frame.size.width/1.3, header_baseview.frame.origin.y, controller_obj.view.frame.size.width/1.3, controller_obj.view.frame.size.height-header_baseview.frame.origin.y);
                
                
                Main_view.frame = CGRectMake(0, 0, controller_obj.view.frame.size.width, controller_obj.view.frame.size.height);
                
            }completion:^(BOOL finished) {
                
                
                side_menu.hidden =YES;
                
            }];
        }
        else
        {
            [UIView animateWithDuration:.25f animations:^{
                side_menu.frame = CGRectMake(0, header_baseview.frame.origin.y, controller_obj.view.frame.size.width/1.3, controller_obj.view.frame.size.height-header_baseview.frame.origin.y);
                
                
                Main_view.frame = CGRectMake(controller_obj.view.frame.size.width/1.3, 0, controller_obj.view.frame.size.width, controller_obj.view.frame.size.height);
                
            }];
        }
        
        
        
        
        
    }
    
    
        //[recognizer setTranslation:CGPointMake(0, 0) inView:side_menu];

    
    
}


-(void)move:(UIPanGestureRecognizer*)recognizer {
  
//    CGPoint location = [recognizer locationInView:Main_view];
//    CGRect someRect = CGRectMake(0, 0, Main_view.frame.size.width/8, Main_view.frame.size.height);
    
    translation = [recognizer translationInView:Main_view];
    CGPoint vel = [recognizer velocityInView:Main_view];
    
    
  
    CGRect recognizerFrame = recognizer.view.frame;
    recognizerFrame.origin.x += translation.x;
    recognizerFrame.origin.y += translation.y;
    
    
    

    if (recognizer.state == UIGestureRecognizerStateBegan) {
        
        
        side_menu.hidden =NO;
    }
    
//   if (CGRectContainsPoint(someRect, location))
//   {
    
    
    
   if (recognizerFrame.origin.x <= controller_obj.view.frame.size.width/1.3   && recognizerFrame.origin.x>0)
   {
       
       //NSLog(@"in---Second");
   
    Main_view.frame=CGRectMake(recognizerFrame.origin.x, 0, Main_view.frame.size.width, Main_view.frame.size.height);
    
    side_menu.frame = CGRectMake(recognizerFrame.origin.x-side_menu.frame.size.width, side_menu.frame.origin.y, side_menu.frame.size.width, side_menu.frame.size.height);
       
       
  
    
    
    
    
    
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        
        NSLog(@"UIGestureRecognizerStateEnded");
        
        
        if (vel.x > 0)
        {
            // user dragged towards the right
            
            if (Main_view.frame.origin.x>=60)
            {
                [UIView animateWithDuration:.25f animations:^{
                    side_menu.frame = CGRectMake(0, header_baseview.frame.origin.y, controller_obj.view.frame.size.width/1.3, controller_obj.view.frame.size.height-header_baseview.frame.origin.y);
                    
                    
                    Main_view.frame = CGRectMake(controller_obj.view.frame.size.width/1.3, 0, controller_obj.view.frame.size.width, controller_obj.view.frame.size.height);
                    
                }];
            }
            else
            {
                [UIView animateWithDuration:.25f animations:^{
                    side_menu.frame = CGRectMake(-controller_obj.view.frame.size.width/1.3, header_baseview.frame.origin.y, controller_obj.view.frame.size.width/1.3, controller_obj.view.frame.size.height-header_baseview.frame.origin.y);
                    
                    
                    Main_view.frame = CGRectMake(0, 0, controller_obj.view.frame.size.width, controller_obj.view.frame.size.height);
                    
                }completion:^(BOOL finished) {
                    
                    
                    side_menu.hidden =YES;
                    
                }];
            }
            
            
            
            
            
        }
        else
        {
            // user dragged towards the left
            
            
            [UIView animateWithDuration:.25f animations:^{
                side_menu.frame = CGRectMake(-controller_obj.view.frame.size.width/1.3, header_baseview.frame.origin.y, controller_obj.view.frame.size.width/1.3, controller_obj.view.frame.size.height-header_baseview.frame.origin.y);
                
                
                Main_view.frame = CGRectMake(0, 0, controller_obj.view.frame.size.width, controller_obj.view.frame.size.height);
                
            }completion:^(BOOL finished) {
               
                
                 side_menu.hidden =YES;
                
            }];
                
            
            
        }
        
    }
       
        
        
    }
    
    
    
    [recognizer setTranslation:CGPointMake(0, 0) inView:Main_view];
        
       
  // }
    

}




-(void)left_menu:(int)value
{
    NSLog(@"leftmenu--->%d",value);
   
   
    
    if ([[user_info valueForKey:@"userType"] isEqualToString:@"B"])
    {
        if (value!=4)
        {
             [self close_SideMenu];
        }
        
        
        if (value == 0)
          {
              if (![[[controller_obj.navigationController viewControllers] lastObject] isKindOfClass:[Dashboard_Controller class]])
              {
                  
                  Dashboard_Controller *obj = [controller_obj.storyboard instantiateViewControllerWithIdentifier:@"dashboard"];
                  
                  [controller_obj.navigationController pushViewController:obj animated:YES];
              }
          }
        
        
        else if (value == 1)
        {
            
            
            if (![[[controller_obj.navigationController viewControllers] lastObject] isKindOfClass:[NewCampainViewController class]])
            {
                
                NewCampainViewController *obj = [controller_obj.storyboard instantiateViewControllerWithIdentifier:@"newcamp"];
                
                [controller_obj.navigationController pushViewController:obj animated:YES];
            }
            
           
            
        }
        else if (value == 2)
        {
            
            
            ActiveCampaingController *obj = [controller_obj.storyboard instantiateViewControllerWithIdentifier:@"active"];
            obj.active_past = @"active";
            [controller_obj.navigationController pushViewController:obj animated:YES];
            

            
        }
        else if (value == 3)
        {
            
            ActiveCampaingController *obj = [controller_obj.storyboard instantiateViewControllerWithIdentifier:@"active"];
            obj.active_past = @"past";
            [controller_obj.navigationController pushViewController:obj animated:YES];
            
        }

        
       

        else if (value == 4)
        {
            if (![[[controller_obj.navigationController viewControllers] lastObject] isKindOfClass:[Dashboard_Controller class]])
            {
                
                  [user_info setValue:@"P" forKey:@"userType"];
                
                Dashboard_Controller *obj = [controller_obj.storyboard instantiateViewControllerWithIdentifier:@"dashboard"];
                
                [controller_obj.navigationController pushViewController:obj animated:YES];
            }
            
            else
            {
            
            
            if ([[user_info valueForKey:@"register_Type"]isEqualToString:@"B"])
            {
                Social_connectController *obj = [controller_obj.storyboard instantiateViewControllerWithIdentifier:@"social"];
                
                [controller_obj.navigationController pushViewController:obj animated:YES];
            }
            else if ([[user_info valueForKey:@"register_Type"]isEqualToString:@"P"])
            {
                NSLog(@"enter Company Name");
                
                
                BusinessName_Controller *obj = [controller_obj.storyboard instantiateViewControllerWithIdentifier:@"bname"];
                
                [controller_obj.navigationController pushViewController:obj animated:YES];
                
                
            }
            else
            {
                
            
            
            
            [UIView animateWithDuration:.25f animations:^{
                side_menu.frame = CGRectMake(-controller_obj.view.frame.size.width/1.3, header_baseview.frame.origin.y, controller_obj.view.frame.size.width/1.3, controller_obj.view.frame.size.height-header_baseview.frame.origin.y);
                
                
                Main_view.frame = CGRectMake(0, 0, controller_obj.view.frame.size.width, controller_obj.view.frame.size.height);
                
            }completion:^(BOOL finished) {
                
                [side_menu removeFromSuperview];
                
                [side_menu.side_menutable reloadData];
                
                [user_info setValue:@"P" forKey:@"userType"];
                
                
                [controller_obj viewDidLoad];
                
            }];
            
            
            
            }
                
            }
        }
        
        else if (value==6)
        {
            
            
            ViewReviews_ViewController *obj = [controller_obj.storyboard instantiateViewControllerWithIdentifier:@"review"];
            
            [controller_obj.navigationController pushViewController:obj animated:YES];
            
        }
        
        else if (value == 7)
        {
            MainSettingsController *obj = [controller_obj.storyboard instantiateViewControllerWithIdentifier:@"mainsetting"];
            [controller_obj.navigationController pushViewController:obj animated:YES];
        }
        else if (value == 8)
        {
            ChatController *obj = [controller_obj.storyboard instantiateViewControllerWithIdentifier:@"chat"];
            [controller_obj.navigationController pushViewController:obj animated:YES];
        }

        
        else if (value == 9)
        {
            UIAlertController *alertController = [UIAlertController
                                                  alertControllerWithTitle:@"Log Out"
                                                  message:@"Are you sure you want to log out?"
                                                  preferredStyle:UIAlertControllerStyleAlert];
            
            
            
            UIAlertAction *cancelAction = [UIAlertAction
                                           actionWithTitle:@"Cancel"
                                           style:UIAlertActionStyleCancel
                                           handler:^(UIAlertAction *action)
                                           {
                                               
                                           }];
            
            UIAlertAction *okAction = [UIAlertAction
                                       actionWithTitle:@"LogOut"
                                       style:UIAlertActionStyleDestructive
                                       handler:^(UIAlertAction *action)
                                       {
                                           [self logout];
                                           
                                           
                                       }];
            
            [alertController addAction:cancelAction];
            [alertController addAction:okAction];
            
            [controller_obj presentViewController:alertController animated:YES completion:nil];
        }

    }
    else
    {
        
        if (value!=3)
        {
            [self close_SideMenu];
        }
        
         if (value == 1)
        {
            
            
            ActiveCampaingController *obj = [controller_obj.storyboard instantiateViewControllerWithIdentifier:@"active"];
            obj.active_past = @"active";
            [controller_obj.navigationController pushViewController:obj animated:YES];
            
            
            
        }
        else if (value == 2)
        {
            
            ActiveCampaingController *obj = [controller_obj.storyboard instantiateViewControllerWithIdentifier:@"active"];
            obj.active_past = @"past";
            [controller_obj.navigationController pushViewController:obj animated:YES];
            
        }
        
       
        
       else if (value == 3)
        {
            if (![[[controller_obj.navigationController viewControllers] lastObject] isKindOfClass:[Dashboard_Controller class]])
            {
                
                  [user_info setValue:@"B" forKey:@"userType"];
                
                Dashboard_Controller *obj = [controller_obj.storyboard instantiateViewControllerWithIdentifier:@"dashboard"];
                
                [controller_obj.navigationController pushViewController:obj animated:YES];
            }
            
            
            else
                
            {
            
            
            if ([[user_info valueForKey:@"register_Type"]isEqualToString:@"B"])
            {
                NSLog(@"enter Socila");
            }
            else if ([[user_info valueForKey:@"register_Type"]isEqualToString:@"P"])
            {
                NSLog(@"enter Company Name");
            }
            else
            {
                
            
            
            [UIView animateWithDuration:.25f animations:^{
                side_menu.frame = CGRectMake(-controller_obj.view.frame.size.width/1.3, header_baseview.frame.origin.y, controller_obj.view.frame.size.width/1.3, controller_obj.view.frame.size.height-header_baseview.frame.origin.y);
                
                
                Main_view.frame = CGRectMake(0, 0, controller_obj.view.frame.size.width, controller_obj.view.frame.size.height);
                
            }completion:^(BOOL finished) {
                
                [side_menu removeFromSuperview];
                
                [side_menu.side_menutable reloadData];
                
                [user_info setValue:@"B" forKey:@"userType"];
                
                
                [controller_obj viewDidLoad];
                
            }];
            
            
            
            }
        }
            
            
        }
        
        
        
        
        else if (value==5)
        {
            
            
            ViewReviews_ViewController *obj = [controller_obj.storyboard instantiateViewControllerWithIdentifier:@"review"];
            
            [controller_obj.navigationController pushViewController:obj animated:YES];
            
        }
        else  if (value == 6)
        {
            MainSettingsController *obj = [controller_obj.storyboard instantiateViewControllerWithIdentifier:@"mainsetting"];
            [controller_obj.navigationController pushViewController:obj animated:YES];
        }
        
        else if (value == 7)
        {
            ChatController *obj = [controller_obj.storyboard instantiateViewControllerWithIdentifier:@"chat"];
            [controller_obj.navigationController pushViewController:obj animated:YES];
        }
        
        else if (value==9)
        {
            UIAlertController *alertController = [UIAlertController
                                                  alertControllerWithTitle:@"Log Out"
                                                  message:@"Are you sure you want to log out?"
                                                  preferredStyle:UIAlertControllerStyleAlert];
            
            
            
            UIAlertAction *cancelAction = [UIAlertAction
                                           actionWithTitle:@"Cancel"
                                           style:UIAlertActionStyleCancel
                                           handler:^(UIAlertAction *action)
                                           {
                                               
                                           }];
            
            UIAlertAction *okAction = [UIAlertAction
                                       actionWithTitle:@"LogOut"
                                       style:UIAlertActionStyleDestructive
                                       handler:^(UIAlertAction *action)
                                       {
                                           [self logout];
                                           
                                           
                                       }];
            
            [alertController addAction:cancelAction];
            [alertController addAction:okAction];
        }
        
    }
    
    
    
}

-(void)close_SideMenu
{
    
    [UIView animateWithDuration:.25f animations:^{
        
        
        side_menu.frame = CGRectMake(-controller_obj.view.frame.size.width/1.3, header_baseview.frame.origin.y, controller_obj.view.frame.size.width/1.3, controller_obj.view.frame.size.height-header_baseview.frame.origin.y);
        
        
        Main_view.frame = CGRectMake(0, 0, controller_obj.view.frame.size.width, controller_obj.view.frame.size.height);
        
    }];
    
   
}


-(void)logout
{
    Login_ViewController *obj = [controller_obj.storyboard instantiateViewControllerWithIdentifier:@"loginPage"];
    [controller_obj.navigationController pushViewController:obj animated:YES];
}


- (void)willMoveToWindow:(UIWindow *)newWindow {
    
       if (newWindow == nil) {
        // Will be removed from window, similar to -viewDidUnload.
        // Unsubscribe from any notifications here.
        
        
       
        
        //[self removeFromSuperview];
        
         
//            
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                
//                NSLog(@"Will be removed from window--->%@",[controller_obj.navigationController.viewControllers lastObject]);
//               
//
//                UIViewController *obj = [controller_obj.navigationController.viewControllers lastObject];
//                
//                if ([obj.check isEqualToString:@"back"])
//                {
//                     [side_menu removeFromSuperview];
//                }
//                
//                
//                
//            });
//            
        
        
        
       
        
        
    }
}


@end
