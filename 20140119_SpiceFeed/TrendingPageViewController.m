//
//  TrendingPageViewController.m
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/9/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "TrendingPageViewController.h"

@interface TrendingPageViewController ()

@end

@implementation TrendingPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.index = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.scrollView.delegate = self;
    
    PFQuery *flavesQuery = [PFQuery queryWithClassName:kSFFlaveClassKey];
    flavesQuery.cachePolicy = kPFCachePolicyCacheElseNetwork;
    self.trendingFlaves = [NSMutableArray arrayWithArray:[flavesQuery findObjects]];
    
    self.collectionView.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection View Data Source

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.trendingFlaves.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TrendingCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"trendingCell" forIndexPath:indexPath];
    
    if (!cell.flave) {
        cell.flave = [self.trendingFlaves objectAtIndex:indexPath.row];
    }
    
    return cell;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//}



@end










