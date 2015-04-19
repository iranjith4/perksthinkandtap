//
//  ViewController.h
//  ColorTap
//
//  Created by Ranjith on 06/04/15.
//  Copyright (c) 2015 RanjithKumar Matheswaran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GamePlayView.h"
#import "MenuView.h"
#import <GameKit/GameKit.h>
#import "GAITrackedViewController.h"
@import GoogleMobileAds;
#define TIME_REDUCTION_FACTOR 0.05
#define MAXIMUM_SPEED 1.5
#define MINIMUM_SPEED 3.5

@interface ViewController : GAITrackedViewController<GamePlayProtocol,MenuViewProtocol,GKGameCenterControllerDelegate>

@property (nonatomic, strong) GADBannerView *adBanner;

@end

