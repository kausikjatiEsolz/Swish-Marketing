//
//  Initial_ViewController.h
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 31/03/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Initial_ViewController : UIViewController
{
    __weak IBOutlet UIButton *login_Btn;
    __weak IBOutlet UIButton *register_Btn;
    
}

- (IBAction)loginORregister:(UIButton *)sender;


@end
