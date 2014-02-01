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
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"sampleImage"];
    
    self.usernameLabel.text = [PFUser currentUser][@"username"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"userFlaveThumbnail" forIndexPath:indexPath];
    
    UIImageView *bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                         0,
                                                                         50,
                                                                         50)];
    
    bgImage.image = [UIImage imageNamed:@"profileAvatar.png"];
    
    cell.backgroundView = bgImage;
    
    return cell;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[[PFUser currentUser] objectForKey:@"flaveCount"] integerValue];
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

@end










