//
//  HomePageContentViewController.h
//  20140119_SpiceFeed
//
//  Created by Ivan Lesko on 2/6/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageContentViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic) NSUInteger *pageIndex;
@property NSString *titleText;
@property NSString *imageFile;


@end
