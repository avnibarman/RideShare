//
//  CollectionViewController.m
//  LAtourist
//
//  Created by Avni Barman on 4/7/17.
//  abarman@usc.edu
//  Copyright © 2017 Avni Barman. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()

@property (nonatomic, strong) NSIndexPath *indexPath;
@property (strong, nonatomic) DetailViewController *vc;
@property (strong, nonatomic) FacebookViewController *fc;
@property (strong, nonatomic) NSDictionary *userDictionary;
@property NSInteger selectedIndex;
@end

@implementation CollectionViewController


-(void) viewDidLoad {
    
    [super viewDidLoad];
    _userModel = [UserModel sharedModel];
    _rideModel = [RideModel sharedModel];
    _userDictionary = [_userModel getDictionary];
    
    

}

- (void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:animated];
    
    //reloads the data in the collection view
    [self.collectionView reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    //#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of items
    NSLog(@"number of items in model: %lu", (unsigned long)self.rideModel.totalRides);
    return self.rideModel.totalRides;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //gets the cell
    CollectionViewCell *cell =(CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"MainCell" forIndexPath:indexPath];
    
    // Configure the cell
    NSDictionary *ride = [self.rideModel rideFromIndex:indexPath.row];
    //NSLog(@"%@", ride);
    cell.detailButton.tag = indexPath.row;
    //NSDictionary *userInformation = [_fc getUserInformationDictionary];
    [cell setsUpCell:ride withUser:_userDictionary];
    
    return cell;
}

- (IBAction)detailButtonDidTapped:(UIButton *)sender {
    
    self.selectedIndex = sender.tag;
    
    //goes to the detail controller
    [self performSegueWithIdentifier:@"detailpage" sender:nil];
    
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    //goes to the detail controller
    if ([segue.identifier isEqualToString:@"detailpage"]) {

        _vc = [[DetailViewController alloc] init];
        
        NSDictionary *rideDict = [_rideModel rideFromIndex:self.selectedIndex];
        
        //sends the ride we are on to the detail controller
        [_vc setMyRide:rideDict withUser:_userDictionary];
    }
    
}

@end
