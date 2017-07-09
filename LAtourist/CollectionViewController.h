//
//  CollectionViewController.h
//  LAtourist
//
//  Created by Avni Barman on 4/7/17.
//  abarman@usc.edu
//  Copyright © 2017 Avni Barman. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "CollectionViewCell.h"
#include "RideModel.h"
#include "DetailViewController.h"
#include "FacebookViewController.h"
#import "UserModel.h"

@interface CollectionViewController : UICollectionViewController
@property (nonatomic, strong) RideModel *rideModel;

@property(strong, nonatomic) UserModel *userModel;
@property (strong, nonatomic) NSDictionary *user;

@end
