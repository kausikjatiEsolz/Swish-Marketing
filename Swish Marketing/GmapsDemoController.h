//
//  GmapsDemoController.h
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 13/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
//#import <MapKit/MapKit.h>

@interface GmapsDemoController : UIViewController<GMSMapViewDelegate>
{
    __weak IBOutlet UIView *header_view;
    
}
@property (weak, nonatomic) IBOutlet GMSMapView *gmap_View;
//@property (nonatomic, weak) IBOutlet MKMapView *map;

@property (strong,nonatomic)NSMutableArray *lat_logArray;
- (IBAction)back:(UIButton *)sender;

@end
