//
//  CollectionViewCell.m
//  LAtourist
//
//  Created by Avni Barman on 4/4/17.
//  abarman@usc.edu
//  Copyright © 2017 Avni Barman. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell


-(void) setsUpCell: (NSDictionary *)dict withUser: (NSDictionary *) userDict{
    //sets the label of the start location
    _aCityLabel.text = [dict objectForKey:@"aCity"];
    _bCityLabel.text = [dict objectForKey:@"bCity"];
    
    //sets the label for the depart day/time
    NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
    [dateformate setDateFormat:@"MMMM, dd HH:mm a"];
    _departLabel.text = @"Depart at ";
    _departLabel.text = [_departLabel.text stringByAppendingString:[dateformate stringFromDate:[dict objectForKey:@"depart"]]];
    
    //sets the label for the return day/time
    _returnLabel.text = @"Return at ";
   _returnLabel.text = [_returnLabel.text stringByAppendingString:[dateformate stringFromDate:[dict objectForKey:@"return"]]];
    
    //sets the ride poster's profile picture
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[userDict objectForKey:@"profilePicture"]]];
    _userImage.image = [UIImage imageWithData:imageData];
    
}

/*
- (IBAction)joinNowButtonPressed:(id)sender {
    
    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:@"Clear all values"message:@"Are you sure you want to clear all values?" preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle: @"Clear All" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    
    [alertViewController addAction:destructiveAction];
    
    [alertViewController addAction:cancelAction];

}*/

@end

