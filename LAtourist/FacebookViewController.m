//
//  FacebookViewController.m
//  RideShare
//
//  Created by Avni Barman on 4/24/17.
//  abarman@usc.edu
//  Copyright © 2017 Avni Barman. All rights reserved.
//

#import "FacebookViewController.h"
#include "UserProfileViewController.h"

@interface FacebookViewController ()
@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *url;
//@property (strong, nonatomic) UserProfileViewController *controller;
@property (strong, nonatomic) CollectionViewController *controller;
@property (strong, nonatomic) NSDictionary *userInformation;
@end

@implementation FacebookViewController 
- (void) viewDidAppear:(BOOL)animated{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    if ([FBSDKAccessToken currentAccessToken]){
        // User is logged in, saves all of user information into a user plist
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"id, name, first_name, last_name, picture.type(large)"}]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error)
             {
                 _name = [NSString stringWithFormat:@"%@ %@", result[@"first_name"], result[@"last_name"]];
        
                 _url = result[@"picture"][@"data"][@"url"];
                 
                 NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
                 
                 NSString *filepath = [NSString stringWithFormat:@"%@/%@", path, @"user.plist"];
                 
                 _userInformation = [[NSDictionary alloc] initWithObjectsAndKeys:_name, @"name",_url, @"profilePicture", nil];
                 
                 [_userInformation writeToFile:filepath atomically:YES];
             }
             else
             {
                 NSLog(@"error : %@",error);
                 
             }
         }];

        //goes to the first screen after logged in
        CollectionViewController *myViewController = [storyboard instantiateViewControllerWithIdentifier:@"firstScreen"];
        
        [self presentViewController:myViewController animated:YES completion:nil];
    }
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    
    // Places the login button in the center bottom of the screen
    float X_Co = (self.view.frame.size.width - loginButton.frame.size.width)/2;
    float Y_Co = 480;
    [loginButton setFrame:CGRectMake(X_Co, Y_Co, loginButton.frame.size.width, loginButton.frame.size.height)];
    loginButton.delegate = self;
    [self.view addSubview:loginButton];
    
}

-(NSDictionary *) getUserInformationDictionary {
    
    return _userInformation;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    
    //starts the app with the tab view controller if user is already logged in
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITableViewController *myViewController = [storyboard instantiateViewControllerWithIdentifier:@"firstScreen"];

    [self presentViewController:myViewController animated:YES completion:nil];
    
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
}


@end
