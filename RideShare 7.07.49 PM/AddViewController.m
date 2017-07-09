//
//  AddViewController.m
//  Flashcards
//
//  Created by Avni Barman on 3/22/17.
//  abarman@usc.edu
//  Copyright © 2017 Avni Barman. All rights reserved.
//
#import "RideModel.h"
#import "AddViewController.h"

@interface AddViewController ()

@property (weak, nonatomic) IBOutlet UITextField *startLocationTextField;
@property (weak, nonatomic) IBOutlet UITextField *endLocationTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerStart;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerEnd;
@property (strong, nonatomic) NSNumber *lat1;
@property (strong, nonatomic) NSNumber *lng1;
@property (strong, nonatomic) NSNumber *lat2;
@property (strong, nonatomic) NSNumber *lng2;

@property(strong, nonatomic) RideModel *model;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [RideModel sharedModel];
    
    //set the first text field to the first responder
    [self.startLocationTextField becomeFirstResponder];
    
    //sets the date pickers to the current time and day
    NSDate *now = [NSDate date];
    [self.datePickerStart setDate:now animated:NO];
    [self.datePickerEnd setDate:now animated:NO];
    
}

-(void) loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error{
}

-(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
}

- (BOOL) textField:(UITextField *) textField shouldChangeCharactersInRange:(NSRange)range replacementString:(nonnull NSString *)string{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonDidPressed:(id)sender {
    
    //get the user's start and end location
    NSString *start = self.startLocationTextField.text;
    NSString *end = self.endLocationTextField.text;
    
    
    //get the longitude and latitude coordinates of both the start and end location and save it to the ride model
    //dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *YOUR_KEY = @"AIzaSyA9nkVOc3ZhMdTYvxxBRywoGTtd-47g1Ds";
        
        NSString *query = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/geocode/json?address=%@&key=%@", start, YOUR_KEY];
        //NSLog(@"%@", query);
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:[query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
        
        NSError *error;
        NSURLResponse *response;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        NSNumber *la1;
        NSNumber *ln1;
        NSNumber *la2;
        NSNumber *ln2;
        if (httpResponse.statusCode != 200 || error || ![data length]) {
            NSLog(@"Error fetching auto complete results: %@", error);
        } else {
            // parse the json and do something with the result
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSArray *results = json[@"results"];
            NSDictionary *geometry = results[0][@"geometry"];
            NSDictionary *loc = geometry[@"location"];
            la1 = loc[@"lat"];
            ln1 = loc[@"lng"];
        }
        
        NSString *query2 = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/geocode/json?address=%@&key=%@", end, YOUR_KEY];
    
        NSURLRequest *request2 = [[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:[query2 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
        
        NSError *error2;
        NSURLResponse *response2;
        NSData *data2 = [NSURLConnection sendSynchronousRequest:request2 returningResponse:&response2 error:&error2];
        NSHTTPURLResponse *httpResponse2 = (NSHTTPURLResponse *) response2;
        
        if (httpResponse2.statusCode != 200 || error2 || ![data2 length]) {
            NSLog(@"Error fetching auto complete results: %@", error2);
        } else {
            // parse the json and do something with the result
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data2 options:0 error:&error2];
            NSArray *results = json[@"results"];
            NSDictionary *geometry = results[0][@"geometry"];
            NSDictionary *loc = geometry[@"location"];
            la2 = loc[@"lat"];
            ln2 = loc[@"lng"];
            
        }

        
            [self.model insertWithStart:start DepartAt:[self.datePickerStart date] End:end ReturnAt:[self.datePickerEnd date]lat1:la1 lng1:ln1 lat2:la2 lng2:ln2];
        
    //});

    
    

    //take the user back to the search results
    [self.tabBarController setSelectedIndex:0];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    
    //let the user exit out of the text fields
    if(touch.phase == UITouchPhaseBegan) {
        [self.startLocationTextField resignFirstResponder];
        [self.endLocationTextField resignFirstResponder];
    }
}

@end
