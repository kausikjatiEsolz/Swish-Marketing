//
//  CampainDetailsController.h
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 21/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CampainDetailsController : UIViewController
{
    __weak IBOutlet UIView *mainView;
    __weak IBOutlet UIView *header_baseview;
    
    __weak IBOutlet UIView *charBaseview;
    
    
    
}


@property (strong,nonatomic)NSString *campain_Id;

@end
