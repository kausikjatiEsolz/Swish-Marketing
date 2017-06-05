//
//  Tutotial_ViewController.m
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 31/03/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "Tutotial_ViewController.h"
#import "Dashboard_Controller.h"

@interface Tutotial_ViewController ()<UIScrollViewDelegate>

@end

@implementation Tutotial_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
       
    
    
    scroll_view.pagingEnabled = YES;
    scroll_view.contentSize = CGSizeMake(self.view.frame.size.width*2, 0);
    scroll_view.delegate = self;
    
    
    ///Page 2 set
    
    UIImageView *image_2 = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width+first_image.frame.origin.x, first_image.frame.origin.y, first_image.frame.size.width, first_image.frame.size.height)];
    
    image_2.image = [UIImage imageNamed:@"Bitmap1"];
    
    [scroll_view addSubview:image_2];
    
    
    
    UIView *down_view2 = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width, first_downview.frame.origin.y, first_downview.frame.size.width, first_downview.frame.size.height)];
    
    [scroll_view addSubview:down_view2];
    
    down_view2.backgroundColor = first_downview.backgroundColor;
    
    
    CGRect first_lbl_frame = first_lbl1.frame;
    
    UILabel *second_lbl1 = [[UILabel alloc]initWithFrame:CGRectMake(first_lbl_frame.origin.x, first_lbl_frame.origin.y, first_lbl_frame.size.width, first_lbl_frame.size.height)];
    
    second_lbl1.font = first_lbl1.font;
    second_lbl1.textColor = first_lbl1.textColor;
    second_lbl1.text = @"PROMOTER";
    second_lbl1.textAlignment = NSTextAlignmentCenter;
    
    [down_view2 addSubview:second_lbl1];
    
    
    
    UILabel *second_lbl2 = [[UILabel alloc]initWithFrame:CGRectMake(first_lbl2.frame.origin.x, first_lbl2.frame.origin.y, first_lbl2.frame.size.width, first_lbl2.frame.size.height)];
    
    second_lbl2.font = first_lbl2.font;
    second_lbl2.textColor = first_lbl2.textColor;
    second_lbl2.text = first_lbl2.text;
    second_lbl2.textAlignment = NSTextAlignmentCenter;
    second_lbl2.numberOfLines = first_lbl2.numberOfLines;
    
    [down_view2 addSubview:second_lbl2];
    
    
    //page Control
    
    page_controll.numberOfPages = 2;
    page_controll.currentPage=0;

    
  
        
    
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    page_controll.currentPage=(scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width);
    
    
    
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x ==0)
    {
        [nextBtn setTitle:@"NEXT" forState:UIControlStateNormal];
    }
    else
    {
        [nextBtn setTitle:@"DONE" forState:UIControlStateNormal];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    if (![[[NSUserDefaults standardUserDefaults] valueForKey:@"Orientation"] isEqualToString:@"1"])
//    {
//        Tutotial_ViewController *obj  = [[UIStoryboard storyboardWithName:@"Land" bundle:nil] instantiateViewControllerWithIdentifier:@"tutorial"];
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


- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    
    NSLog(@"-->%ld",(long)toInterfaceOrientation);
    
    if (toInterfaceOrientation==1)
    {
        Tutotial_ViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorial"];
        
        obj.view.frame = self.view.frame;
        
        for (id obj in self.view.subviews)
        {
            [obj removeFromSuperview];
        }
        
        [self.view addSubview:obj.view];
        
        
    }else {
        
        
        Tutotial_ViewController *obj  = [[UIStoryboard storyboardWithName:@"Land" bundle:nil] instantiateViewControllerWithIdentifier:@"tutorial"];
        
        
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)skip:(UIButton *)sender {
    
    
    
    Dashboard_Controller *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"dashboard"];
    [self.navigationController pushViewController:obj animated:YES];
    
}

- (IBAction)next:(UIButton *)sender {
    
    
    [scroll_view setContentOffset:CGPointMake(self.view.frame.size.width, -20) animated:YES];
    
    
    
    if ([sender.titleLabel.text isEqualToString:@"DONE"])
    {
        Dashboard_Controller *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"dashboard"];
        [self.navigationController pushViewController:obj animated:YES];
    }
    
    
    [nextBtn setTitle:@"DONE" forState:UIControlStateNormal];
    
}
@end
