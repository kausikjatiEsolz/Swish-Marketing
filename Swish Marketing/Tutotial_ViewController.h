//
//  Tutotial_ViewController.h
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 31/03/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tutotial_ViewController : UIViewController
{
    __weak IBOutlet UIImageView *first_image;
    __weak IBOutlet UIView *first_downview;
    __weak IBOutlet UIScrollView *scroll_view;
    
    __weak IBOutlet UILabel *first_lbl1;
    __weak IBOutlet UILabel *first_lbl2;
    __weak IBOutlet UIPageControl *page_controll;
    
    __weak IBOutlet UIButton *nextBtn;
    
}

- (IBAction)skip:(UIButton *)sender;
- (IBAction)next:(UIButton *)sender;





@end
