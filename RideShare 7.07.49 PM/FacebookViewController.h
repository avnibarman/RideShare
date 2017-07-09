//
//  FacebookViewController.h
//  RideShare
//
//  Created by Avni Barman on 4/24/17.
//  abarman@usc.edu
//  Copyright © 2017 Avni Barman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "CollectionViewController.h"

@interface FacebookViewController : UIViewController <FBSDKLoginButtonDelegate>

//gets and returs the user information dictionary
-(NSDictionary *) getUserInformationDictionary;

@end
