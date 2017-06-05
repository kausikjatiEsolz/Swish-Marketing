//
//  Initial_ViewController.m
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 31/03/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "Initial_ViewController.h"
#import "Login_ViewController.h"
#import "Register_ViewController.h"

@interface Initial_ViewController ()

@end

@implementation Initial_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
//    [self.navigationController.interactivePopGestureRecognizer setEnabled:YES];
    
    
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:login_Btn.bounds];
    login_Btn.layer.masksToBounds = NO;
    login_Btn.layer.shadowColor = [UIColor blackColor].CGColor;
    login_Btn.layer.shadowOffset = CGSizeMake(.5, .5);
    login_Btn.layer.shadowOpacity = 0.2f;
    login_Btn.layer.shadowPath = shadowPath.CGPath;
    
    UIBezierPath *shadowPath_1 = [UIBezierPath bezierPathWithRect:register_Btn.bounds];
    register_Btn.layer.masksToBounds = NO;
    register_Btn.layer.shadowColor = [UIColor blackColor].CGColor;
    register_Btn.layer.shadowOffset = CGSizeMake(.5, .5);
    register_Btn.layer.shadowOpacity = 0.2f;
    register_Btn.layer.shadowPath = shadowPath_1.CGPath;

    
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    if (![[[NSUserDefaults standardUserDefaults] valueForKey:@"Orientation"] isEqualToString:@"1"] )
//    {
//        Initial_ViewController *obj  = [[UIStoryboard storyboardWithName:@"Land" bundle:nil] instantiateViewControllerWithIdentifier:@"test"];
//        
//        
//        obj.view.frame = self.view.frame;
//        
//        for (id obj in self.view.subviews)
//        {
//            [obj removeFromSuperview];
//        }
//        
//        [self.view addSubview:obj.view];
//        
//    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    
    NSLog(@"-->%ld",(long)toInterfaceOrientation);
    
    if (toInterfaceOrientation==1)
    {
        Initial_ViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"initail"];
     
        obj.view.frame = self.view.frame;
        
        for (id obj in self.view.subviews)
        {
            [obj removeFromSuperview];
        }
        
        [self.view addSubview:obj.view];
        
        
    }else {
        
        
       Initial_ViewController *obj  = [[UIStoryboard storyboardWithName:@"Land" bundle:nil] instantiateViewControllerWithIdentifier:@"test"];
        
        
        obj.view.frame = self.view.frame;
        
        for (id obj in self.view.subviews)
        {
            [obj removeFromSuperview];
        }
        
        [self.view addSubview:obj.view];
        
        
        
        
        
        
        //NSLog(@"%@",controller);
        
    }
    
    
    [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%ld",toInterfaceOrientation] forKey:@"Orientation"];
    
    
    //[self viewDidLoad];

}
- (IBAction)loginORregister:(UIButton *)sender {
    
    if (sender.tag==0)
    {
        Login_ViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"loginPage"];
        [self.navigationController pushViewController:obj animated:YES];
    }
    else
    {
        Register_ViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"business"];
        [self.navigationController pushViewController:obj animated:YES];
        
    }
    
}
@end
