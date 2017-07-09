//
//  UserProfileViewController.m
//  RideShare
//
//  Created by Avni Barman on 4/25/17.
//  abarman@usc.edu
//  Copyright © 2017 Avni Barman. All rights reserved.
//

#import "UserProfileViewController.h"


@interface UserProfileViewController ()

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSDictionary *dictionary;
@property (strong, nonatomic) NSMutableArray *rideArray;
@property (strong, nonatomic) NSString *car;


@end

@implementation UserProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _userModel = [UserModel sharedModel];
    _rideModel = [RideModel sharedModel];
    
    //get the dictionary of users and rides
    _dictionary = [self.userModel getDictionary];
    _rideArray = [self.rideModel getDictionary];
    
    //use those dictionaries^ to set the car and name and image of the driver
    _car = [[_rideArray objectAtIndex:0] objectForKey:@"car"];
    _name = [_dictionary objectForKey:@"name"];
    _url = [_dictionary objectForKey:@"profilePicture"];
    
    NSLog(@"url is %@", _url);
    
    //set the labels
    self.nameLabel.text = self.name;
    self.carLabel.text = _car;
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:_url]];
    self.urlImage.image = [UIImage imageWithData:imageData];
    
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    // Place Facebook Login Button in the center bottom of the screen
    float X_Co = (self.view.frame.size.width - loginButton.frame.size.width)/2;
    float Y_Co = 480;
    [loginButton setFrame:CGRectMake(X_Co, Y_Co, loginButton.frame.size.width, loginButton.frame.size.height)];
    loginButton.delegate = self;
    [self.view addSubview:loginButton];
    

}

-(void) loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    
    //if user logs out, go to the log in page
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FacebookViewController *myViewController = [storyboard instantiateViewControllerWithIdentifier:@"mainpage"];
    
    [self presentViewController:myViewController animated:YES completion:nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
