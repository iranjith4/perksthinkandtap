//
//  ScoreView.h
//  ColorTap
//
//  Created by Ranjith on 07/04/15.
//  Copyright (c) 2015 RanjithKumar Matheswaran. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SPACE_FACTOR 0.02

@interface ScoreView : UIView

- (instancetype)initWithFrame:(CGRect)frame andData:(NSDictionary *)dict;
@property (nonatomic, strong) UILabel *scoreLabel;
@property (nonatomic, strong) UILabel *personalLabel;
@property (nonatomic, strong) UILabel *score;
@property (nonatomic, strong) UILabel *personalScore;

- (void)updateGameScore:(NSString *)scoreValue;
- (void)updatePersonalScore:(NSString *)scoreValue;
@end
