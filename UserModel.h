//
//  RideModel.h
//  LAtourist
//
//  Created by Avni Barman on 4/22/17.
//  abarman@usc.edu
//  Copyright © 2017 Avni Barman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

- (instancetype) init;

// Creating the model
+ (instancetype) sharedModel;

//returns the dictionary of the contents of the user logged in from Facebook's API
-(NSDictionary *) getDictionary;

@end
