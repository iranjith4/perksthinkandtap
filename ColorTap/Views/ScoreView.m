//
//  ScoreView.m
//  ColorTap
//
//  Created by Ranjith on 07/04/15.
//  Copyright (c) 2015 RanjithKumar Matheswaran. All rights reserved.
//

#import "ScoreView.h"
#import "Constants.h"

@implementation ScoreView{
    NSDictionary *data;
    float yPos;
}

- (instancetype)initWithFrame:(CGRect)frame andData:(NSDictionary *)dict
{
    self = [super initWithFrame:frame];
    if (self) {
        data = dict;
        [self initUI];
    }
    return self;
}

- (void) initUI{
//    self.backgroundColor = [UIColor colorWithRed:0.822 green:0.990 blue:0.556 alpha:1.000];
    yPos = self.frame.size.width * SPACE_FACTOR;
    self.scoreLabel = [[UILabel alloc] init];
    self.scoreLabel.text = @"Score";
    self.scoreLabel.font = [UIFont fontWithName:FONT_LIGHT size:[Constants changeFontSizeWithHeight:IPHONE4_SIZE :11]];
    self.scoreLabel.textColor = [UIColor orangeColor];
    self.scoreLabel.textAlignment = NSTextAlignmentLeft;
    [self.scoreLabel sizeToFit];
    CGRect frame = self.scoreLabel.frame;
    frame.origin.x = yPos;
    frame.origin.y = self.frame.size.width * SPACE_FACTOR;
    self.scoreLabel.frame = frame;
    [self addSubview:self.scoreLabel];
    
    yPos += self.scoreLabel.frame.size.height;
    
    self.score = [[UILabel alloc] init];
    self.score.text = [data objectForKey:@"score"];
    self.score.font = [UIFont fontWithName:FONT_SEMIBOLD size:[Constants changeFontSizeWithHeight:IPHONE4_SIZE :21]];
    self.score.textColor = [UIColor grayColor];
    self.score.textAlignment = NSTextAlignmentLeft;
    [self.score sizeToFit];
    frame = self.score.frame;
    frame.origin.x = self.frame.size.width * SPACE_FACTOR;
    frame.origin.y = yPos;
    self.score.frame = frame;
    [self addSubview:self.score];
    
    self.personalLabel = [[UILabel alloc] init];
    self.personalLabel.text = @"Personal High";
    self.personalLabel.font = [UIFont fontWithName:FONT_LIGHT size:[Constants changeFontSizeWithHeight:IPHONE4_SIZE :11]];
    self.personalLabel.textColor = [UIColor orangeColor];
    self.personalLabel.textAlignment = NSTextAlignmentRight;
    [self.personalLabel sizeToFit];
    frame = self.personalLabel.frame;
    frame.origin.x = self.frame.size.width - self.frame.size.width * SPACE_FACTOR - frame.size.width;
    frame.origin.y = self.frame.size.width * SPACE_FACTOR;
    self.personalLabel.frame = frame;
    [self addSubview:self.personalLabel];
    
    self.personalScore = [[UILabel alloc] init];
    self.personalScore.text = [data objectForKey:@"personal_high"];
    self.personalScore.font = [UIFont fontWithName:FONT_SEMIBOLD size:[Constants changeFontSizeWithHeight:IPHONE4_SIZE :21]];
    self.personalScore.textColor = [UIColor grayColor];
    self.personalScore.textAlignment = NSTextAlignmentLeft;
    [self.personalScore sizeToFit];
    frame = self.personalScore.frame;
    frame.origin.x = self.frame.size.width - self.frame.size.width * SPACE_FACTOR - frame.size.width;
    frame.origin.y = yPos;
    self.personalScore.frame = frame;
    [self addSubview:self.personalScore];

}

- (void)updateGameScore:(NSString *)scoreValue{
    self.score.text = scoreValue;
    self.score.font = [UIFont fontWithName:FONT_SEMIBOLD size:[Constants changeFontSizeWithHeight:IPHONE4_SIZE :21]];
    self.score.textColor = [UIColor grayColor];
    self.score.textAlignment = NSTextAlignmentLeft;
    [self.score sizeToFit];
    CGRect frame = self.score.frame;
    frame.origin.x = self.frame.size.width * SPACE_FACTOR;
    frame.origin.y = yPos;
    self.score.frame = frame;
}

- (void)updatePersonalScore:(NSString *)scoreValue{
    self.personalScore.text = scoreValue;
    self.personalScore.font = [UIFont fontWithName:FONT_SEMIBOLD size:[Constants changeFontSizeWithHeight:IPHONE4_SIZE :21]];
    self.personalScore.textColor = [UIColor grayColor];
    self.personalScore.textAlignment = NSTextAlignmentRight;
    [self.personalScore sizeToFit];
    CGRect frame = self.personalScore.frame;
    frame.origin.x = self.frame.size.width - self.frame.size.width * SPACE_FACTOR - frame.size.width;
    frame.origin.y = yPos;
    self.personalScore.frame = frame;
}

/*NOTE:
DATA Model
  @{
@"score" : @"870",
@"personal_high" : @"36400"
};
*/

@end
