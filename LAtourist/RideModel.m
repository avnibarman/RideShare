//
//  RideModel.m
//  LAtourist
//
//  Created by Avni Barman on 4/22/17.
//  abarman@usc.edu
//  Copyright © 2017 Avni Barman. All rights reserved.
//

#import "RideModel.h"
@interface RideModel()

@property (nonatomic, strong) NSMutableArray *rides;
@property (strong, nonatomic) NSString *filepath;

@end

@implementation RideModel

static NSString *const kPlist = @"data.plist";

- (instancetype) init{
    
    self = [super init];
    
    if(self){
        //creates a file and filepath for the plist to save rides to
        NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        _filepath = [NSString stringWithFormat:@"%@/%@", path, kPlist];
        //NSLog(@"file path for data is %@", _filepath);
        NSMutableArray *arrOfDictionaries = [[NSMutableArray alloc] initWithContentsOfFile:_filepath];
        
        //if the plist file has rides already
        if (arrOfDictionaries.count>0){
            _rides = [[NSMutableArray alloc] init];
            
            for(int i=0; i<arrOfDictionaries.count; i++){
                NSMutableDictionary *dict = arrOfDictionaries[i];
                [self.rides addObject:dict];
            }
            
        }else{
            
        //if the plist does not already have rides, create two
            NSDate* date = [NSDate date];
            NSDate* date2 = [NSDate date];
            NSNumber *l1 = [NSNumber numberWithDouble:34.052235];
            NSNumber *l2 = [NSNumber numberWithDouble:-118.243683];
            NSNumber *s1 = [NSNumber numberWithDouble:37.733795];
            NSNumber *s2 = [NSNumber numberWithDouble:-122.446747];
            
            NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Los Angeles",@"aCity", @"San Francisco", @"bCity", date, @"depart", date2, @"return", @"Avni Barman", @"user", @"BMW i3", @"car", l1, @"lat1",l2, @"lng1", s1, @"lat2",s2, @"lng2", nil];
            NSMutableDictionary *dict2 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Los Angeles",@"aCity", @"San Francisco", @"bCity", date, @"depart", date2, @"return", @"Avni Barman", @"user", @"BMW i3", @"car", l1, @"lat1",l2, @"lng1", s1, @"lat2",s2, @"lng2", nil];
            
            //insert these two rides created to the rides array
            _rides = [[NSMutableArray alloc] init];
            [_rides insertObject:dict atIndex:0];
            [_rides insertObject:dict2 atIndex:1];
        }
        
        //save all data to the plist
        [self save];
    }
    return self;
    
}

// Creating the model
+ (instancetype) sharedModel{
    
    static RideModel *_sharedModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedModel = [[RideModel alloc] init];
    });
    
    return _sharedModel;
    
}

// Inserting a ride
- (void) insertWithStart: (NSString *) start
                DepartAt: (NSDate *) departDate
                     End: (NSString *) end
                ReturnAt: (NSDate *) returnDate
                    lat1: (NSNumber *) lat1
                    lng1: (NSNumber *) lng1
                    lat2: (NSNumber *) lat2
                    lng2: (NSNumber *) lng2
{
    //creates a dictionary object with the parameters
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:start,@"aCity", end, @"bCity", departDate, @"depart", returnDate, @"return", @"Avni Barman", @"user", @"BMW i3", @"car", lat1, @"lat1",lng1, @"lng1", lat2, @"lat2",lng2, @"lng2", nil];
    
    //adds it to the rides array
    [_rides addObject:dict];
    
    //saves it to the plist
    [self save];
    
}

-(NSUInteger) totalRides{
    //returns the size of the rides array
    return self.rides.count;
}

-(void) setObject: (NSNumber *) number atKey: (NSString *) key atLocation: (NSUInteger) index{
    //gets an object at that index and sets it to the parameters
    [[_rides objectAtIndex:index] setObject:number forKey:key];
    
}

-(void) save{
    //creates an array of dictionaries
    NSMutableArray *dictArray = [[NSMutableArray alloc] init];
    
    //gets all the rides and saves it to that array^
    for(int i=0; i < self.rides.count; i++){
        NSDictionary *dict = [self.rides objectAtIndex:i];
        [dictArray addObject:dict];
        
    }
    
    //writes this array of rides to the file at the filepath found
    [dictArray writeToFile:self.filepath atomically:YES];
}

-(NSDictionary *) rideFromIndex: (NSUInteger) location {
    //gets a ride from a certain index
    return [self.rides objectAtIndex:location];
}

-(NSMutableArray *) getDictionary {
    //returns the array of dictionaries (rides)
    return self.rides;
}




@end
