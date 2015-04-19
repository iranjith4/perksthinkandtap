//
//  MenuButton.m
//  ColorTap
//
//  Created by Ranjith on 12/04/15.
//  Copyright (c) 2015 RanjithKumar Matheswaran. All rights reserved.
//

#import "MenuButton.h"
#import "Constants.h"

@implementation MenuButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI{
    self.backgroundColor = [UIColor colorWithRed:(CGFloat)87/255 green:(CGFloat)81/255 blue:(CGFloat)217/255 alpha:1.0];
    [self.titleLabel setFont:[UIFont fontWithName:FONT_SEMIBOLD size:[Constants changeFontSizeWithWidth:IPHONE6_SIZE :14]]];
    self.layer.cornerRadius = 4.0;
    self.layer.masksToBounds = YES;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
}
@end
