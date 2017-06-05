//
//  ProductpictureController.h
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 27/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductPicCell.h"

@interface ProductpictureController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
   
    __weak IBOutlet UIView *main_view;
    __weak IBOutlet UIView *header_base;
    IBOutlet UICollectionView *productCollection_view;
    NSMutableArray *ary,*ary1;
    ProductPicCell *CELL;
    
    NSString *previoustag;
    
    
}
@end
