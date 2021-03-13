//
//  ViewController.m
//  SearchForAirTickets
//
//  Created by Alexandr Evtodiy on 27.02.2021.
//

#define IdentifierForAnnotationView @"MarkerIdentifier"

#import "MainViewController.h"
#import "LocationService.h"


@interface MainViewController () 
@property (nonatomic,strong) LocationService *locationService;
@property (nonatomic,strong) MKMapView *mapView;
- (void)updateCurrentLocation:(NSNotification *)notification;
- (void)addressFromLocation:(CLLocation *)location;
@end

@implementation MainViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self config];
    self.locationService = [[LocationService alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateCurrentLocation:) name:kLocationServiceDidUpdateCurrentLocation object:nil];
}

#pragma mark - Configure Controls
- (void) config {
    [self configView];
    [self configMapView];
    [self configPointsAnnotationForMapView];
}

- (void) configView {
    self.view.backgroundColor = [UIColor redColor];
}

- (void) configMapView {
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    [self.mapView registerClass:[MKMarkerAnnotationView class] forAnnotationViewWithReuseIdentifier:IdentifierForAnnotationView];
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    [self.view addSubview:self.mapView];
}

- (void) configPointsAnnotationForMapView {
    
    MKPointAnnotation *firstPointAnnotation = [[MKPointAnnotation alloc] init];
    firstPointAnnotation.title = @"Баня";
    firstPointAnnotation.subtitle = @"Мужская";
    firstPointAnnotation.coordinate = CLLocationCoordinate2DMake(40.594627, -122.405838);
    [self.mapView addAnnotation:firstPointAnnotation];
    
    MKPointAnnotation *secondPointAnnotation = [[MKPointAnnotation alloc] init];
    secondPointAnnotation.title = @"Стриптиз";
    secondPointAnnotation.subtitle = @"Женский";
    secondPointAnnotation.coordinate = CLLocationCoordinate2DMake(39.529899, -119.813385);
    [self.mapView addAnnotation:secondPointAnnotation];
    
}

#pragma mark - Config View For Annotation
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKMarkerAnnotationView *annotationView = (MKMarkerAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:IdentifierForAnnotationView forAnnotation:annotation];
    annotationView.canShowCallout = YES;
    annotationView.calloutOffset = CGPointMake(-5.0, 5.0);
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    annotationView.annotation = annotation;
    return annotationView;
}

#pragma mark - Private
- (void)addressFromLocation:(CLLocation *)location {
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
       
        if ([placemarks count] > 0) {
            for (MKPlacemark *placemark in placemarks) {
                NSLog(@"%@", placemark.locality);
                self.title = placemark.locality;
            }
        }
        
    }];
}

#pragma mark - Notification

- (void)updateCurrentLocation:(NSNotification *)notification {
    CLLocation *currentLocation = notification.object;
    
    [self addressFromLocation:currentLocation];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(currentLocation.coordinate, 1000000, 1000000);
    [self.mapView setRegion: region animated: YES];
}


@end
