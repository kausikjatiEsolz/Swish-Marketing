//
//  ProductpictureController.m
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 27/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "ProductpictureController.h"
#import "Json_Class.h"
#import "App_Header.h"
#import "UIImageView+WebCache.h"

@interface ProductpictureController ()<UICollectionViewDelegateFlowLayout>
{
    Json_Class *obj;
}

@end

@implementation ProductpictureController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    App_Header *heade_view = [[App_Header alloc]init];
    
    [heade_view header_Class:@"SETTINGS" head_object:heade_view view:header_base controller:self Main_view:main_view ButtonImage:@"Back topbar"];
    
    obj = [Json_Class new];
    
     NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@Jsonapp_control/profile_details?user_id=%@",App_Domain_Url,[[NSUserDefaults standardUserDefaults] valueForKey:@"userId"]]];
    NSMutableURLRequest *requst = [NSMutableURLRequest requestWithURL:url];
    
    ary = [NSMutableArray new];
    
    
    
    
    [obj GlobalDict:requst Globalstr:@"array" Withblock:^(id result, NSError *error) {
       
        
        
        NSMutableDictionary *dict1=[[NSMutableDictionary alloc]init];
        dict1=[result valueForKey:@"info"];
        NSMutableDictionary *dict2=[[NSMutableDictionary alloc]init];
        dict2=[dict1 valueForKey:@"business_info"];
       // ary=[[dict2 valueForKey:@"product_picture"]mutableCopy];
        
        for (int i=0; i<50; i++)
        {
            [ary addObjectsFromArray:[dict2 valueForKey:@"product_picture"]];
        }
        
        NSLog(@"JSon dict === %@",ary);
        
        [productCollection_view reloadData];

        
    }];
    
    
    
    
    
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    CGRect screenRect = [[UIScreen mainScreen] bounds];
//    
//    CGFloat screenWidth = screenRect.size.width;
//    
//    float cellWidth = screenWidth / 3.0;
//    //Replace the divisor with the column count requirement. Make sure to have it in float.
//    
//    CGSize size = CGSizeMake(cellWidth, cellWidth);
//    return size;
//}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return ary.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    
    CELL=[collectionView dequeueReusableCellWithReuseIdentifier:@"PicCell" forIndexPath:indexPath];
    
    
    
    NSString *myImage = [[ary objectAtIndex:indexPath.row]valueForKey:@"product_pic"];

    [CELL.product_image sd_setImageWithURL:[NSURL URLWithString:myImage]
         placeholderImage:[UIImage imageNamed:@""]];
    
    CELL.delete_button.tag = [indexPath row];
  
    
    
    
    [CELL.delete_button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    return CELL;
}

- (IBAction)click:(id)sender {
    
    
    UIButton *btn = (UIButton *) sender;
    UIAlertController *deleteAlert = [UIAlertController alertControllerWithTitle:@"Delete?" message:@"Are you sure you want to delete this image?" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        
        
        [productCollection_view performBatchUpdates:^{
            
            
            
            // Now delete the items from the collection view.
            
            
            NSLog(@"btn--->%lu",(long)btn.tag);
            
            [productCollection_view deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:btn.tag inSection:0]]];
            
            [ary removeObjectAtIndex:btn.tag];
            
            
        } completion:^(BOOL finished) {
            
            NSMutableArray *ary2=[[NSMutableArray alloc]init];
            
            for (int i=(int)btn.tag; i<ary.count; i++) {
                
                [ary2 addObject:[NSIndexPath indexPathForItem:i inSection:0]];
                
                
            }
            if (ary == nil || [ary count] == 0) {
                UILabel *label =  [[UILabel alloc] initWithFrame: CGRectMake(0, 0, 145, 200)];
                label.text = @"No Product Found";
                label.center = self.view.center;
                [self.view addSubview:label];
            }
            
            
            [productCollection_view reloadItemsAtIndexPaths:ary2];
            
            
        }];
        
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        
    }];
    
    [deleteAlert addAction:okAction];
    [deleteAlert addAction:cancelAction];
    [self presentViewController:deleteAlert animated:YES completion:nil];
    
    
    
    
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat height = self.view.frame.size.height;
    CGFloat width  = self.view.frame.size.width;
    // in case you you want the cell to be 40% of your controllers view
    return CGSizeMake(width*0.315,height*0.17);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
