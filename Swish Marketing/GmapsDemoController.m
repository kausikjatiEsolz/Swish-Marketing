//
//  GmapsDemoController.m
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 13/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "GmapsDemoController.h"
#import "NewCampainViewController.h"
#import <stdlib.h>

@interface GmapsDemoController ()
//@property (nonatomic, strong) KMLParser *kmlParser;

@end

@implementation GmapsDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    //NewCampainViewController *obj = [self.navigationController.viewControllers lastObject];
    
    header_view.layer.masksToBounds = NO;
    header_view.layer.shadowOffset = CGSizeMake(1, 1);
    header_view.layer.shadowRadius = 1;
    header_view.layer.shadowOpacity = 0.5;
    header_view.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    
    
     GMSCoordinateBounds *bounds = [[GMSCoordinateBounds alloc] init];
   
    for (int i=0; i<self.lat_logArray.count; i++)
    {
        GMSCircle *geoFenceCircle = [[GMSCircle alloc] init];
        geoFenceCircle.radius = ([[[_lat_logArray objectAtIndex:i] valueForKey:@"radius"] intValue]*1.6)*1000; // Meters
        CLLocationCoordinate2D circleCenter = CLLocationCoordinate2DMake([[[_lat_logArray objectAtIndex:i] valueForKey:@"lat"] doubleValue], [[[_lat_logArray objectAtIndex:i] valueForKey:@"lon"] doubleValue]);
        geoFenceCircle.position = circleCenter; // Some CLLocationCoordinate2D position
        geoFenceCircle.fillColor = [[UIColor blackColor]colorWithAlphaComponent:.1f];
        geoFenceCircle.strokeWidth = 1;
        geoFenceCircle.strokeColor = [UIColor colorWithRed:85.0/255.0f green:166.0/255.0f blue:199.0/255.0f alpha:1.0];//[UIColor orangeColor];
        geoFenceCircle.map = self.gmap_View;
        
        
        
        ///marker
        
        //CLLocationCoordinate2D position = { [rsg.Latitude doubleValue], [rsg.Long    doubleValue] };
        GMSMarker *marker = [GMSMarker markerWithPosition:circleCenter];
        marker.title = [[_lat_logArray objectAtIndex:i] valueForKey:@"address"];
        
        marker.appearAnimation = YES;
        marker.flat = YES;
        marker.snippet = @"";
        marker.map = self.gmap_View;
        
        bounds = [bounds includingCoordinate:marker.position];
    }
    
    [self.gmap_View animateWithCameraUpdate:[GMSCameraUpdate fitBounds:bounds withPadding:30.0f]];
    
    
    NSString  *value = [self allCoordinatesVisibleWithLatitudes:self.lat_logArray];
    
    NSLog(@"val--->%@",value);
    
     // Add it to the map.
    
    
//    
//    GMSVisibleRegion visibleRegion = self.gmap_View.projection.visibleRegion;
//    GMSCoordinateBounds *bounds = [[GMSCoordinateBounds alloc] initWithRegion: visibleRegion];
//    
//    
//    CLLocationCoordinate2D northEast = bounds.northEast;
//    CLLocationCoordinate2D southWest = bounds.southWest;
//    
//    [self animateBoundsNorth:northEast.latitude West:northEast.longitude South:southWest.latitude East:southWest.longitude Padding:0];
   
    
    
//  [self.mapView animateToCameraPosition:[GMSCameraPosition cameraWithTarget:[GMSCameraPosition cameraWithTarget:self.mapView.camera.target zoom:zoom]]];
    
//    GMSMutablePath *path = [GMSMutablePath path];
//    [path addCoordinate:CLLocationCoordinate2DMake(37.36, -122.0)];
//    [path addCoordinate:CLLocationCoordinate2DMake(37.45, -122.0)];
//    [path addCoordinate:CLLocationCoordinate2DMake(37.45, -122.2)];
//    [path addCoordinate:CLLocationCoordinate2DMake(37.36, -122.2)];
//    [path addCoordinate:CLLocationCoordinate2DMake(37.36, -122.0)];
//    
//    GMSPolyline *polyline = [GMSPolyline polylineWithPath:path];
//    polyline.strokeColor = [UIColor redColor];
//    polyline.strokeWidth = 10.f;
//    polyline.geodesic = YES;
//    
//    polyline.map = self.gmap_View;
   
   
    
   /*
    CLLocationCoordinate2D southWest = CLLocationCoordinate2DMake(40.712216,-74.22655);
    CLLocationCoordinate2D northEast = CLLocationCoordinate2DMake(40.773941,-74.12544);
    GMSCoordinateBounds *overlayBounds = [[GMSCoordinateBounds alloc] initWithCoordinate:southWest
                                                                              coordinate:northEast];
    
    // Image from http://www.lib.utexas.edu/maps/historical/newark_nj_1922.jpg
    UIImage *icon = [UIImage imageNamed:@"newark_nj_1922"];
    GMSGroundOverlay *overlay =
    [GMSGroundOverlay groundOverlayWithBounds:overlayBounds icon:icon];
    overlay.bearing = 0;
    overlay.map = self.gmap_View;
    
    GMSCameraPosition *newCameraPosition = [GMSCameraPosition cameraWithTarget:southWest zoom:15];
    [self.gmap_View animateToCameraPosition:newCameraPosition];

    
    */
    
    /*
    
    // Locate the path to the route.kml file in the application's bundle
    // and parse it with the KMLParser.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"India" ofType:@"kml"];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.kmlParser = [[KMLParser alloc] initWithURL:url];
    [self.kmlParser parseKML];
    
    // Add all of the MKOverlay objects parsed from the KML file to the map.
    NSArray *overlays = [self.kmlParser overlays];
    [self.map addOverlays:overlays];
    
    // Add all of the MKAnnotation objects parsed from the KML file to the map.
    NSArray *annotations = [self.kmlParser points];
    [self.map addAnnotations:annotations];
    
    // Walk the list of overlays and annotations and create a MKMapRect that
    // bounds all of them and store it into flyTo.
    MKMapRect flyTo = MKMapRectNull;
    for (id <MKOverlay> overlay in overlays) {
        if (MKMapRectIsNull(flyTo)) {
            flyTo = [overlay boundingMapRect];
        } else {
            flyTo = MKMapRectUnion(flyTo, [overlay boundingMapRect]);
        }
    }
    
    for (id <MKAnnotation> annotation in annotations) {
        MKMapPoint annotationPoint = MKMapPointForCoordinate(annotation.coordinate);
        MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0, 0);
        if (MKMapRectIsNull(flyTo)) {
            flyTo = pointRect;
        } else {
            flyTo = MKMapRectUnion(flyTo, pointRect);
        }
    }
    
    // Position the map so that all overlays and annotations are visible on screen.
    self.map.visibleMapRect = flyTo;
    
    
    */
    
}

//- (void)mapView:(GMSMapView *)mapView didChangeCameraPosition:(GMSCameraPosition *)position
//{
//    GMSVisibleRegion visibleRegion = mapView.projection.visibleRegion;
//    GMSCoordinateBounds *bounds = [[GMSCoordinateBounds alloc] initWithRegion: visibleRegion];
//    
//   // bounds.southWest
//    
//    
//    
//    
//    
//    CLLocationCoordinate2D northEast = bounds.northEast;
//    CLLocationCoordinate2D southWest = bounds.southWest;
//    
//    NSLog(@"northEast Lat %f \n northEast Lat-----%f",northEast.latitude, northEast.longitude);
//    NSLog(@"southWest Lat %f \n southWest Lat-----%f",southWest.latitude, southWest.longitude);
//    
//    
//    
//    
//}
//

        
        
        
        
        
        
        
        
        //        CLLocationCoordinate2D positionnew = { [latnew doubleValue],[longnew doubleValue ] };
        //
        //        NSLog(@"latitudenew%f",positionnew.latitude);


-(void) animateBoundsNorth:(CGFloat)north West:(CGFloat)west South:(CGFloat)south East:(CGFloat)east Padding:(int)padding {
    
    CGFloat northRad = north * M_PI / 180.0;
    CGFloat northProj = logf(tanf(M_PI_4 + northRad/2.0));
    CGFloat southRad = south * M_PI / 180.0;
    CGFloat southProj = logf(tanf(M_PI_4 + southRad/2.0));
    CGFloat topRad = 85.0 * M_PI / 180.0;
    CGFloat topProj = logf(tanf(M_PI_4 + topRad/2.0));
    CGFloat zoomLat = log2f((self.gmap_View.bounds.size.height - padding * 2) * 2 * topProj /(northProj - southProj)) - 8;
    CGFloat zoomLon = log2f((self.gmap_View.bounds.size.width - padding * 2) * 360/(east - west)) - 8;
    
    GMSCameraUpdate *update = [GMSCameraUpdate setTarget:CLLocationCoordinate2DMake((north+south)/2.0, (west+east)/2.0) zoom:MIN(zoomLat, zoomLon)];
    
    
    [self.gmap_View animateWithCameraUpdate:update];
    
    
}

- (NSString *)allCoordinatesVisibleWithLatitudes:(NSArray *)arrayOfLatitudes
{
    CLLocationCoordinate2D coordinate;
    for(int i=0;i<arrayOfLatitudes.count;i++)
    {
        coordinate = CLLocationCoordinate2DMake([[[arrayOfLatitudes objectAtIndex:i] valueForKey:@"lat"] doubleValue], [[[arrayOfLatitudes objectAtIndex:i] valueForKey:@"lon"] doubleValue]);
        if(![self.gmap_View.projection containsCoordinate:coordinate])
        {
            return @"NO";
        }
    }
    return @"YES";
}


/*
#pragma mark MKMapViewDelegate

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    return [self.kmlParser rendererForOverlay:overlay];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    return [self.kmlParser viewForAnnotation:annotation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
*/
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)viewDidDisappear:(BOOL)animated
{
    _gmap_View.mapType = kGMSTypeTerrain;
}


- (IBAction)back:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
    }];
    
    
}
@end
