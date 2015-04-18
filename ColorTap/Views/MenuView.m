//
//  MenuView.m
//  ColorTap
//
//  Created by Ranjith on 12/04/15.
//  Copyright (c) 2015 RanjithKumar Matheswaran. All rights reserved.
//

#import "MenuView.h"

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
    [self.gameCenter addTarget:self action:@selector(gameCenterTapped) forControlEvents:UIControlEventTouchUpInside];
    self.gameCenter.backgroundColor = [UIColor whiteColor];
    [self.gameCenter setTitleColor:[UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000] forState:UIControlStateNormal];
    self.gameCenter.layer.borderWidth = 0.5;
    self.gameCenter.layer.borderColor = [[UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000] CGColor];
    [self addSubview:self.gameCenter];
    
    self.howToPlay = [[MenuButton alloc] initWithFrame:CGRectMake(0, 0, (self.frame.size.width / 3) -  SPACE_FACTOR_BUTTONS * self.frame.size.width, SCREEN_HEIGHT * 0.045)];
    [self.howToPlay setTitle:@"How to Play" forState:UIControlStateNormal];
    self.howToPlay.center = CGPointMake(self.frame.size.width / 2, (self.frame.size.height - self.howToPlay.frame.size.height));
    [self.howToPlay addTarget:self action:@selector(howToPlayTapped) forControlEvents:UIControlEventTouchUpInside];
    self.howToPlay.backgroundColor = [UIColor whiteColor];
    [self.howToPlay setTitleColor:[UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000] forState:UIControlStateNormal];
    self.howToPlay.layer.borderWidth = 0.5;
    self.howToPlay.layer.borderColor = [[UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000] CGColor];
    [self addSubview:self.howToPlay];
    
    //About us name changed to app details
    self.aboutUs = [[MenuButton alloc] initWithFrame:CGRectMake(0, 0, (self.frame.size.width / 3) -  SPACE_FACTOR_BUTTONS * self.frame.size.width, SCREEN_HEIGHT * 0.045)];
    [self.aboutUs setTitle:@"App Details" forState:UIControlStateNormal];
    self.aboutUs.center = CGPointMake(self.frame.size.width * 5 / 6, (self.frame.size.height - self.aboutUs.frame.size.height));
    [self.aboutUs addTarget:self action:@selector(aboutUsTapped) forControlEvents:UIControlEventTouchUpInside];
    self.aboutUs.backgroundColor = [UIColor whiteColor];
    [self.aboutUs setTitleColor:[UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000] forState:UIControlStateNormal];
    self.aboutUs.layer.borderWidth = 0.5;
    self.aboutUs.layer.borderColor = [[UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000] CGColor];
    [self addSubview:self.aboutUs];
}

- (void)gameCenterTapped{
    [self.delegate menuClicked:MenuTypeGameCenter];
}

- (void)howToPlayTapped{
    [self.delegate menuClicked:MenuTypeHowToPlay];
}

- (void)aboutUsTapped{
    [self.delegate menuClicked:MenuTypeAppDetails];
}

@end
