//
//  ViewController.m
//  06-FindMyLocation
//
//  Created by 君の神様 on 16/4/20.
//  Copyright © 2016年 Rex. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLGeocoder *geoCoder;

@end

@implementation ViewController

- (CLLocationManager *)locationManager {
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
    }
    return _locationManager;
}

- (CLGeocoder *)geoCoder {
    if (!_geoCoder) {
        _geoCoder = [[CLGeocoder alloc] init];
    }
    return _geoCoder;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (IBAction)loactionButtonClicked:(UIButton *)sender {
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager requestAlwaysAuthorization];
    [self.locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    self.locationLabel.text = [NSString stringWithFormat:@"Error while updating location %@",error.localizedDescription];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    [self.geoCoder reverseGeocodeLocation:manager.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error != nil) {
            self.locationLabel.text = [NSString stringWithFormat:@"Reverse geocoder failed with error %@",error.localizedDescription];
            return;
        }
        if ([placemarks count] > 0) {
            CLPlacemark *pm = placemarks[0];
            [self displayLocationInfo:pm];
        } else {
            self.locationLabel.text = @"Problem with the data received from geocoder";
        }
    }];
}

- (void)displayLocationInfo:(CLPlacemark *)placemark {
    CLPlacemark *containsPlacemark = placemark;
    if (containsPlacemark) {
        [self.locationManager stopUpdatingLocation];
        NSString *locality = (containsPlacemark.locality != nil)? containsPlacemark.locality : @"";
        NSString *postalCode = (containsPlacemark.postalCode != nil)? containsPlacemark.postalCode : @"";
        NSString *administrativeArea = (containsPlacemark.administrativeArea != nil)? containsPlacemark.administrativeArea :@"";
        NSString *country = (containsPlacemark.country != nil)? containsPlacemark.country : @"";
        self.locationLabel.text = [NSString stringWithFormat:@"%@%@%@%@",country,postalCode,administrativeArea,locality];
    }
}

@end
