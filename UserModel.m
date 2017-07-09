//
//  UserModel.m
//  RideShare
//
//  Created by Avni Barman on 4/26/17.
//  Copyright © 2017 Avni Barman. All rights reserved.
//

#import "UserModel.h"
@interface UserModel()

@property (nonatomic, strong) NSDictionary *users;
@property (strong, nonatomic) NSString *filepath;

@end

@implementation UserModel
static NSString *const kPlist = @"user.plist";

- (instancetype) init{
    
    self = [super init];
    
    if(self){
        //creates an array that initializes its content from the user plist
        NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        _filepath = [NSString stringWithFormat:@"%@/%@", path, kPlist];
        //NSLog(@"%@", _filepath);
        NSDictionary *arr = [[NSDictionary alloc] initWithContentsOfFile:_filepath];
        _users = arr;
        
    }
        return self;
        
}

+ (instancetype) sharedModel{
    
    static UserModel *_sharedModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedModel = [[UserModel alloc] init];
    });
    
    return _sharedModel;
    
}

-(NSDictionary *) getDictionary {
    //gets the dictionary of the user's information
    return _users;
}

@end
