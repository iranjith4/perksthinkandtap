//
//  GamePlayView.m
//  ColorTap
//
//  Created by Ranjith on 08/04/15.
//  Copyright (c) 2015 RanjithKumar Matheswaran. All rights reserved.
//

#import "GamePlayView.h"

@implementation GamePlayView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void) initUI{
    self.backgroundColor = [UIColor colorWithWhite:0.947 alpha:1.000];
    self.gameImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height * 0.125, self.frame.size.height * 0.75, self.frame.size.height * 0.75)];
    [self addSubview:self.gameImage];
}

-(void)setGameImageAtRandomPlace:(NSString *)imageName{
    
}

- (void) moveGameImage:(NSString *)imageName{
    
    self.gameImage.image = [UIImage imageNamed:imageName];
    CGRect frame = self.gameImage.frame;
    frame.origin.x = 0 - self.gameImage.frame.size.width;
    self.gameImage.frame = frame;
    
    CALayer *pLayer = [self.gameImage.layer presentationLayer];
    CGRect frameStop = pLayer.frame;
    NSLog(@"%f",frameStop.origin.x);
    [UIView animateWithDuration:3.5 //Time for the animation
                     animations:^{
                         self.gameImage.frame = CGRectMake (self.frame.size.width,self.gameImage.frame.origin.y,self.gameImage.frame.size.width,self.gameImage.frame.size.height);
                     }
                     completion:^(BOOL finished){
                         if (finished) {
                             [self.delegate animationEnds];
                         }
                     }];

}

- (void) stopAnimations{
    [self.gameImage.layer removeAllAnimations];
}

@end
