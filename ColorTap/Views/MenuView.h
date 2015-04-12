//
//  MenuView.h
//  ColorTap
//
//  Created by Ranjith on 12/04/15.
//  Copyright (c) 2015 RanjithKumar Matheswaran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuButton.h"
#define SPACE_FACTOR_BUTTONS 0.03

@interface MenuView : UIView

@property (nonatomic, strong) MenuButton *gameCenter;
@property (nonatomic, strong) MenuButton *howToPlay;
@property (nonatomic, strong) MenuButton *aboutUs;

@end
