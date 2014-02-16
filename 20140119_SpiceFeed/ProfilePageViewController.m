//
//  ProfilePageViewController.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 1/19/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "ProfilePageViewController.h"

@interface ProfilePageViewController ()

@end

@implementation ProfilePageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width,
                                             self.scrollView.frame.size.height * 2.0);
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    self.usernameLabel.text = [[PFUser currentUser] objectForKey:kSFUserUserNameKey];
    
    [[SharedNetworkController sharedInstance] fetchFlavesForUser:[PFUser currentUser] withCompletion:^(NSArray *flaves) {
        if (flaves) {
            self.userFlaves = [NSMutableArray arrayWithArray:flaves];
        }
    }];

    self.backgroundQueue = [[NSOperationQueue alloc] init];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[SharedNetworkController sharedInstance] fetchFlavesForUser:[PFUser currentUser] withCompletion:^(NSArray *flaves) {
        if (flaves) {
            self.userFlaves = [NSMutableArray arrayWithArray:flaves];
            [self.collectionView reloadData];
        }
    }];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ProfilePageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.flave = [self.userFlaves objectAtIndex:indexPath.row];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.userFlaves.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"flaveSegue"]) {
        NSArray *indexPath = [self.collectionView indexPathsForSelectedItems];
        NSIndexPath *selectedItemIndexPath = [indexPath firstObject];
        
        FlavePageViewController *flaveVC = [segue destinationViewController];
        flaveVC.flave = [self.userFlaves objectAtIndex:selectedItemIndexPath.row];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"flaveSegue" sender:nil];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end










