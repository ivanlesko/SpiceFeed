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
    
    self.usernameLabel.text = [[PFUser currentUser] objectForKey:kSFUserUserNameKey];
    
    self.userFlaves = [NSMutableArray new];
    
    self.profileInfoView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.profileInfoView.layer.shadowOffset = CGSizeMake(0, 5);
    self.profileInfoView.layer.shadowRadius = 5;
    self.profileInfoView.layer.shadowOpacity = 0.8;
    
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
    
    PFQuery *flaveQuery = [PFQuery queryWithClassName:@"Flave"];
    flaveQuery.cachePolicy = kPFCachePolicyCacheThenNetwork;
    [flaveQuery whereKey:kSFFlaveUserKey equalTo:[PFUser currentUser]];
    [flaveQuery orderByDescending:@"createdAt"];
    [flaveQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            self.userFlaves = [NSMutableArray arrayWithArray:objects];
            [self.collectionView reloadData];
        } else {
            
        }
    }];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"userFlaveThumbnail" forIndexPath:indexPath];
    
    UIImageView *bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                         0,
                                                                         50,
                                                                         50)];
    bgImage.contentMode = UIViewContentModeScaleAspectFit;
    
    PFObject *flaveThumbnail = [self.userFlaves objectAtIndex:indexPath.row];
    PFFile *flaveFile = [flaveThumbnail objectForKey:kSFFlaveThumbnailKey];
    [flaveFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!error) {
            [self.backgroundQueue addOperationWithBlock:^{
                UIImage *flaveImage = [UIImage imageWithData:data];
                bgImage.image = flaveImage;
                cell.backgroundView = bgImage;                
            }];
        } else {
            NSLog(@"%@", error.localizedDescription);
            NSLog(@"%@", error.debugDescription);
        }
    }];
    
    NSLog(@"reloading collectionViewCell");
    
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

@end










