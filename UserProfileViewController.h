//
//  UserProfileViewController.h
//  RideShare
//
//  Created by Avni Barman on 4/25/17.
//  abarman@usc.edu
//  Copyright © 2017 Avni Barman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "FacebookViewController.h"
#import "RideModel.h"

@interface UserProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) UserModel *userModel;
@property (nonatomic, strong) RideModel *rideModel;
@property (weak, nonatomic) IBOutlet UILabel *carLabel;

@property (weak, nonatomic) IBOutlet UIImageView *urlImage;

@end
