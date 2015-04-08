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
        data = @{
                 @"global_high" : @"324564200",
                 @"personal_high" : @"2340"
                 };
        [self initUI];
    }
    return self;
}

- (void) initUI{
//    self.backgroundColor = [UIColor colorWithRed:0.822 green:0.990 blue:0.556 alpha:1.000];
    yPos = self.frame.size.width * SPACE_FACTOR;
    self.globalLabel = [[UILabel alloc] init];
    self.globalLabel.text = @"Global High";
    self.globalLabel.font = [UIFont fontWithName:FONT_LIGHT size:[Constants changeFontSizeWithHeight:IPHONE4_SIZE :11]];
    self.globalLabel.textColor = [UIColor orangeColor];
    self.globalLabel.textAlignment = NSTextAlignmentLeft;
    [self.globalLabel sizeToFit];
    CGRect frame = self.globalLabel.frame;
    frame.origin.x = yPos;
    frame.origin.y = self.frame.size.width * SPACE_FACTOR;
    self.globalLabel.frame = frame;
    [self addSubview:self.globalLabel];
    
    yPos += self.globalLabel.frame.size.height;
    
    self.globalScore = [[UILabel alloc] init];
    self.globalScore.text = [data objectForKey:@"global_high"];
    self.globalScore.font = [UIFont fontWithName:FONT_SEMIBOLD size:[Constants changeFontSizeWithHeight:IPHONE4_SIZE :21]];
    self.globalScore.textColor = [UIColor grayColor];
    self.globalScore.textAlignment = NSTextAlignmentLeft;
    [self.globalScore sizeToFit];
    frame = self.globalScore.frame;
    frame.origin.x = self.frame.size.width * SPACE_FACTOR;
    frame.origin.y = yPos;
    self.globalScore.frame = frame;
    [self addSubview:self.globalScore];
    
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

/*NOTE:
DATA Model
  @{
@"global_high" : @"2349300",
@"personal_high" : @"36400"
};
*/

@end
