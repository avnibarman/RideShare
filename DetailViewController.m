//
//  DetailViewController.m
//  LAtourist
//
//  Created by Avni Barman on 4/5/17.
//  abarman@usc.edu
//  Copyright © 2017 Avni Barman. All rights reserved.
//

#import "DetailViewController.h"

static NSDictionary *ride;
static NSDictionary *user;
static NSString *aCity;
static NSString *bCity;
@interface DetailViewController ()
@end

@implementation DetailViewController

-(void) setMyRide:(NSDictionary *)dictionary withUser:(NSDictionary *)userDictionary{
    //gets the ride and user dictionary of that index path the detail controller is on
    ride = dictionary;
    user = userDictionary;
    
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    //sets the labels of the start and end location from the dictionary
    aCity = [ride objectForKey:@"aCity"];
    bCity = [ride objectForKey:@"bCity"];
    self.userName.text = [ride objectForKey:@"user"];
    self.aCityDetailLabel.text = aCity;
    self.bCityDetailLabel.text = bCity;
    
    //sets the depart and return date and time
    NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
    [dateformate setDateFormat:@"MMMM, dd HH:mm a"];
    self.departDetailLabel.text = @"Depart at ";
    self.departDetailLabel.text = [_departDetailLabel.text stringByAppendingString:[dateformate stringFromDate:[ride objectForKey:@"depart"]]];

    self.returnDetailLabel.text = @"Return at ";
    self.returnDetailLabel.text = [_returnDetailLabel.text stringByAppendingString:[dateformate stringFromDate:[ride objectForKey:@"return"]]];
    
    //sets the labels for the user profile data
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[user objectForKey:@"profilePicture"]]];
    self.userImageDetail.image = [UIImage imageWithData:imageData];
    self.carLabel.text = [ride objectForKey:@"car"];

    //gets the longtitude/latitude coordinates for both the start and end location
    double latitude1 = [[ride objectForKey:@"lat1"] doubleValue];
    double longitude1 = [[ride objectForKey:@"lng1"] doubleValue];
    double latitude2 = [[ride objectForKey:@"lat2"] doubleValue];
    double longitude2 = [[ride objectForKey:@"lng2"] doubleValue];
    
    
    //aView map code
    self.aView.camera = [GMSCameraPosition cameraWithLatitude:latitude1 longitude:longitude1 zoom:6];
    self.aView.myLocationEnabled = YES;
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(latitude1, longitude1);
    marker.title = aCity;
    marker.map = self.aView;
    
    //bView map code
    self.bView.camera = [GMSCameraPosition cameraWithLatitude:latitude2 longitude:longitude2 zoom:6];
    self.bView.myLocationEnabled = YES;
    GMSMarker *marker2 = [[GMSMarker alloc] init];
    marker2.position = CLLocationCoordinate2DMake(latitude2, longitude2);
    marker2.title = bCity;
    marker2.map = self.bView;
    
    
 }


- (IBAction)backButton:(id)sender {
 [self dismissViewControllerAnimated:YES completion:nil];
}



@end
