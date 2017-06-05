//
//  Social_connectController.h
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 06/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Social_connectController : UIViewController
{
    __weak IBOutlet UIView *facebook;
    __weak IBOutlet UIView *twitter;
    __weak IBOutlet UIView *instagram;
    
}
- (IBAction)facebook_login:(UIButton *)sender;
- (IBAction)twitter:(UIButton *)sender;
- (IBAction)instagram_login:(UIButton *)sender;

@end
