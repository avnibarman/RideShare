//
//  DetailViewController.h
//  LAtourist
//
//  Created by Avni Barman on 4/5/17.
//  abarman@usc.edu
//  Copyright © 2017 Avni Barman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>


@interface DetailViewController : UIViewController  <GMSMapViewDelegate>

@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *carLabel;
@property (weak, nonatomic) IBOutlet UILabel *aCityDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *bCityDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *departDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *returnDetailLabel;

@property (weak, nonatomic) IBOutlet UIImageView *userImageDetail;

@property (weak, nonatomic) IBOutlet GMSMapView *aView;

@property (weak, nonatomic) IBOutlet GMSMapView *bView;


- (void) setMyRide: (NSDictionary *) dictionary withUser: (NSDictionary *) userDictionary;
@end
