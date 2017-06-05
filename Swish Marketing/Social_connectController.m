//
//  Social_connectController.m
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 06/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "Social_connectController.h"
#import <TwitterKit/TwitterKit.h>
#import "InstagramController.h"
#import "Json_Class.h"
#import "FacebookController.h"

@interface Social_connectController ()
{
    Json_Class *obj_url;
}

@property(nonatomic,strong) InstagramController *instagramHandler ;

@end

@implementation Social_connectController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self shadow:facebook];
    [self shadow:twitter];
    [self shadow:instagram];
    
    obj_url = [Json_Class new];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)shadow:(UIView *)view
{
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:view.bounds];
    view.layer.masksToBounds = NO;
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowOffset = CGSizeMake(.5, .5);
    view.layer.shadowOpacity = 0.2f;
    view.layer.shadowPath = shadowPath.CGPath;
}

-(void)popAnimation:(UIView *)view
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation
                                      animationWithKeyPath:@"transform"];
    
    CATransform3D scale1 = CATransform3DMakeScale(0.5, 0.5, 1);
    CATransform3D scale2 = CATransform3DMakeScale(1.2, 1.2, 1);
    CATransform3D scale3 = CATransform3DMakeScale(0.9, 0.9, 1);
    CATransform3D scale4 = CATransform3DMakeScale(1.0, 1.0, 1);
    
    NSArray *frameValues = [NSArray arrayWithObjects:
                            [NSValue valueWithCATransform3D:scale1],
                            [NSValue valueWithCATransform3D:scale2],
                            [NSValue valueWithCATransform3D:scale3],
                            [NSValue valueWithCATransform3D:scale4],
                            nil];
    [animation setValues:frameValues];
    
    NSArray *frameTimes = [NSArray arrayWithObjects:
                           [NSNumber numberWithFloat:0.0],
                           [NSNumber numberWithFloat:0.5],
                           [NSNumber numberWithFloat:0.9],
                           [NSNumber numberWithFloat:1.0],
                           nil];
    [animation setKeyTimes:frameTimes];
    
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.duration = .2;
    
    
    [view.layer addAnimation:animation forKey:@"popup"];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)facebook_login:(UIButton *)sender {
    
    [self popAnimation:facebook];
    
    
    FacebookController *fb_login = [FacebookController new];
    
    [fb_login facebook_login:self completionHandler:^(NSDictionary *userProfileInformation) {
        
        
        NSLog(@"userProfileInformation--->%@",userProfileInformation);
        
        NSString *frnd_count = [NSString stringWithFormat:@"%@",[[[userProfileInformation valueForKey:@"friends"] valueForKey:@"summary"] valueForKey:@"total_count"]];
        NSString *fb_id = [NSString stringWithFormat:@"%@",[userProfileInformation valueForKey:@"id"]];
        
        [self social_Login:@"Jsonapp_control/become_promoter_fb" social_id:fb_id frnd_count:frnd_count social_name:@"fb"];
        
        
    } failureHandler:^(NSDictionary *errorDetail) {
        
        
        
        
        
        
    }];
        
     
        
    
    
    
    
/*
    FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
    [loginManager logInWithReadPermissions:@[@"public_profile", @"email"  ,@"read_custom_friendlists" ,  @"user_friends"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        //TODO: process error or result.
        if (error)
        {
            NSLog(@"Process error");
           
        }
        
     else {
            if ([FBSDKAccessToken currentAccessToken])
            {
                NSLog(@"Token is available : %@",[[FBSDKAccessToken currentAccessToken]tokenString]);
                //NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
                //[parameters setValue:@"id,name,email,first_name,last_name,picture.type(large)" forKey:@"fields"];
                [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"first_name, last_name, picture.type(large), email, name, id, gender , birthday , friendlists , age_range, friends"}]
                 startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                     if (!error) {
                         
                         
                         NSLog(@"result--->%@",result);
                         
                         
//                         summary
//                         total_count
                         
                         NSString *frnd_count = [NSString stringWithFormat:@"%@",[[[result valueForKey:@"friends"] valueForKey:@"summary"] valueForKey:@"total_count"]];
                         NSString *fb_id = [NSString stringWithFormat:@"%@",[result valueForKey:@"id"]];
                         
                         [self social_Login:@"Jsonapp_control/become_promoter_fb" social_id:fb_id frnd_count:frnd_count social_name:@"fb"];
                         
                     }
                     else
                     {
                         NSLog(@"error-->%@",error.localizedDescription);
                     }
                 }];
            }
         
     }
        
    }];
 
 
 */
    
    
}




-(void)social_Login:(NSString *)url social_id:(NSString *)social_id frnd_count:(NSString *)count social_name:(NSString *)name
{
    NSString *urlstr= [NSString stringWithFormat:@"%@%@",App_Domain_Url,url];
    
    urlstr=[urlstr stringByRemovingPercentEncoding];
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
    [request setURL:[NSURL URLWithString:urlstr]];
    
    [request setHTTPMethod:@"POST"];
    
    NSString *postData=@"" ;
    
    if ([name isEqualToString:@"fb"])
    {
        
        
        postData = [NSString stringWithFormat:@"user_id=%@&fb_id=%@&fb_friend_count=%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"userId"],social_id,count];
        
        
    }
    else if ([name isEqualToString:@"twitter"])
    {
        postData = [NSString stringWithFormat:@"user_id=%@&twitter_id=%@&twitter_count_friend=%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"userId"],social_id,count];
    }
    else
    {
        NSArray *data = [count componentsSeparatedByString:@","];
        
        postData = [NSString stringWithFormat:@"user_id=%@&instagram_id=%@&instagram_count_follower=%@&instagram_count_followed_by=%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"userId"],social_id,[data objectAtIndex:0],[data objectAtIndex:1]];
    }
    
   
    
    
    
    
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [request setHTTPBody:[postData dataUsingEncoding:NSUTF8StringEncoding]];
    
    [obj_url GlobalDict:request Globalstr:@"array" Withblock:^(id result, NSError *error)
     {
         
         if (result)
         {
             NSString  *response = [NSString stringWithFormat:@"%@",[result valueForKey:@"response"]];
             NSLog(@"result--->%@",result);
             
             if ([response isEqualToString:@"1"])
             {
                 
//                 if (<#condition#>) {
//                     <#statements#>
//                 }
                 
             }
             else
             {
                 
             }
             
         }
         else
         {
             
         }
         
         
         
         
     }];
}


- (IBAction)twitter:(UIButton *)sender {
    
    
    
  // [[[Twitter sharedInstance] sessionStore] logOutUserID:USERID];
    
     [self popAnimation:twitter];
    
    [[Twitter sharedInstance] logInWithCompletion:^
     (TWTRSession *session, NSError *error) {
         if (session) {
             NSLog(@"%@", [session userID]);
             NSLog(@"%@", [session userName]);
             NSLog(@"%@", [session authToken]);
             NSLog(@"%@", [session authTokenSecret]);
             
             
             
             
             
             
             
             if (session) {
                 
                 TWTRAPIClient *client = [TWTRAPIClient clientWithCurrentUser];
                 
                 NSURLRequest *request = [client URLRequestWithMethod:@"GET" URL:@"https://api.twitter.com/1.1/account/verify_credentials.json" parameters:@{@"include_email": [session authToken], @"skip_status": @"true" , @"email_ID" : @"true"} error:nil];
                 
                 [client sendTwitterRequest:request completion:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                     
                     
                     id result=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                     
                     NSLog(@"result--->%@",result);
                     
                     
                     [self social_Login:@"Jsonapp_control/become_promoter_twitter" social_id:[result valueForKey:@"id_str"] frnd_count:[result valueForKey:@"friends_count"] social_name:@"twitter"];
                     
                     
                 }];
              
              
                 
                 
             }
                   
                   
                   
                   
                   
         } else {
             NSLog(@"Error: %@", [error localizedDescription]);
         }
     }];
    
    
}

- (IBAction)instagram_login:(UIButton *)sender {
    
     [self popAnimation:instagram];
    
    
    
    _instagramHandler = [InstagramController new];
    [_instagramHandler loginWithInstagramWithParsentViewController:self completionHandler:^(NSDictionary *userProfileInformation) {
        
        
        NSLog(@"%@",userProfileInformation);
        
        NSString *loginStr = [NSString stringWithFormat:@"https://api.instagram.com/v1/users/%@/?access_token=%@",[[userProfileInformation valueForKey:@"user"] valueForKey:@"id"],[userProfileInformation valueForKey:@"access_token"]];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:loginStr]];
        
        [obj_url GlobalDict:request Globalstr:@"array" Withblock:^(id result, NSError *error) {
           
            if (result)
            {
                NSLog(@"result--->%@",result);
                
                
                NSString *fnd_count = [NSString stringWithFormat:@"%@,%@",[[result valueForKey:@"counts"] valueForKey:@"follows"],[[result valueForKey:@"counts"] valueForKey:@"followed_by"]];
                
                 [self social_Login:@"Jsonapp_control/become_promoter_instagram" social_id:[[result valueForKey:@"data"] valueForKey:@"id"] frnd_count:fnd_count social_name:@"instagram"];
                
                
                
            }
            
            
            
            
        }];
        
        
        
        
        
        
        
        
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
        
    } failureHandler:^(NSDictionary *errorDetail) {
        NSLog(@"Error - \n %@",errorDetail);
    }];
    
}
@end
