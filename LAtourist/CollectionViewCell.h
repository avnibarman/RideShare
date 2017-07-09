//
//  CollectionViewCell.h
//  LAtourist
//
//  Created by Avni Barman on 4/4/17.
//  abarman@usc.edu
//  Copyright © 2017 Avni Barman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewController.h"

@interface CollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *aCityLabel;
@property (weak, nonatomic) IBOutlet UILabel *bCityLabel;
@property (weak, nonatomic) IBOutlet UILabel *departLabel;
@property (weak, nonatomic) IBOutlet UILabel *returnLabel;
@property (weak, nonatomic) IBOutlet UIButton *joinNowButton;
@property (weak, nonatomic) IBOutlet UIButton *detailButton;
@property (strong, nonatomic) UICollectionViewController *controller;

//sets up the custom collection view cell with the right data
-(void) setsUpCell: (NSDictionary *)dict withUser: (NSDictionary *) userDict;

@end
