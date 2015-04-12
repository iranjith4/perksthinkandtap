//
//  MenuView.m
//  ColorTap
//
//  Created by Ranjith on 12/04/15.
//  Copyright (c) 2015 RanjithKumar Matheswaran. All rights reserved.
//

#import "MenuView.h"
#import "Constants.h"

@implementation MenuView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.backgroundColor = [UIColor whiteColor];
    
    self.gameCenter = [[MenuButton alloc] initWithFrame:CGRectMake(0, 0, (self.frame.size.width / 3) -  SPACE_FACTOR_BUTTONS * self.frame.size.width, SCREEN_HEIGHT * 0.045)];
    [self.gameCenter setTitle:@"Game Center" forState:UIControlStateNormal];
    self.gameCenter.center = CGPointMake(self.frame.size.width / 6, (self.frame.size.height - self.gameCenter.frame.size.height));
    [self addSubview:self.gameCenter];
    
    self.howToPlay = [[MenuButton alloc] initWithFrame:CGRectMake(0, 0, (self.frame.size.width / 3) -  SPACE_FACTOR_BUTTONS * self.frame.size.width, SCREEN_HEIGHT * 0.045)];
    [self.howToPlay setTitle:@"How to Play" forState:UIControlStateNormal];
    self.howToPlay.center = CGPointMake(self.frame.size.width / 2, (self.frame.size.height - self.howToPlay.frame.size.height));
    [self addSubview:self.howToPlay];
    
    self.aboutUs = [[MenuButton alloc] initWithFrame:CGRectMake(0, 0, (self.frame.size.width / 3) -  SPACE_FACTOR_BUTTONS * self.frame.size.width, SCREEN_HEIGHT * 0.045)];
    [self.aboutUs setTitle:@"About Us" forState:UIControlStateNormal];
    self.aboutUs.center = CGPointMake(self.frame.size.width * 5 / 6, (self.frame.size.height - self.aboutUs.frame.size.height));
    [self addSubview:self.aboutUs];
}

@end
