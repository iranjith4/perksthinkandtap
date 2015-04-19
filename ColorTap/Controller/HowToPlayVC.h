//
//  HowToPlayVC.h
//  ColorTap
//
//  Created by Ranjith on 18/04/15.
//  Copyright (c) 2015 RanjithKumar Matheswaran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"
@import GoogleMobileAds;

@interface HowToPlayVC : GAITrackedViewController

@property(nonatomic, strong) GADBannerView *adBanner;
@end
