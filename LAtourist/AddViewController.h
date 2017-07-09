//
//  AddViewController.h
//  Flashcards
//
//  Created by Avni Barman on 3/22/17.
//  abarman@usc.edu
//  Copyright © 2017 Avni Barman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface AddViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate, FBSDKLoginButtonDelegate>

@end
