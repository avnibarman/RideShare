//
//  RideModel.h
//  LAtourist
//
//  Created by Avni Barman on 4/22/17.
//  abarman@usc.edu
//  Copyright © 2017 Avni Barman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RideModel : NSObject

- (instancetype) init;

// Creating the model
+ (instancetype) sharedModel;

//inserts a ride
- (void) insertWithStart: (NSString *) start
                DepartAt: (NSDate *) departDate
                     End: (NSString *) end
                ReturnAt: (NSDate *) returnDate
                    lat1: (NSNumber *) lat1
                    lng1: (NSNumber *) lng1
                    lat2: (NSNumber *) lat2
                    lng2: (NSNumber *) lng2;

//gets a ride from a certain index
-(NSDictionary *) rideFromIndex: (NSUInteger) location;

//gets the total number of rides
-(NSUInteger) totalRides;

//saves and updates the rides to the plist
-(void) save;

//sets a ride at a certain location to a specified object and key
-(void) setObject: (NSNumber *) number atKey: (NSString *) key atLocation: (NSUInteger) index;

//gets the ride Array
-(NSMutableArray *) getDictionary;

@end
