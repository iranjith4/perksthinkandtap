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
    //self.backgroundColor = [UIColor colorWithWhite:0.947 alpha:1.000];
    float xPos = 0;
    NSArray * scoreColors = [NSArray arrayWithObjects:[UIColor colorWithWhite:0.850 alpha:1.0],[UIColor colorWithWhite:0.900 alpha:1.0],[UIColor colorWithWhite:0.950 alpha:1.0],nil];
    for (int i = 0; i < 3; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(xPos,0, self.frame.size.width / 3, self.frame.size.height)];
        view.backgroundColor = [scoreColors objectAtIndex:i];
        [self addSubview:view];
        xPos += view.frame.size.width;
    }
    self.gameImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height * 0.125, self.frame.size.height * 0.75, self.frame.size.height * 0.75)];
    [self addSubview:self.gameImage];
}

- (void) moveGameImage:(NSString *)imageName animTime:(float)animTime{
    
    self.gameImage.image = [UIImage imageNamed:imageName];
    CGRect frame = self.gameImage.frame;
    frame.origin.x = 0 - self.gameImage.frame.size.width;
    self.gameImage.frame = frame;
    
    CALayer *pLayer = [self.gameImage.layer presentationLayer];
    CGRect frameStop = pLayer.frame;
    NSLog(@"%f",frameStop.origin.x);
    [UIView animateWithDuration:animTime //Time for the animation
                     animations:^{
                         self.gameImage.frame = CGRectMake (self.frame.size.width,self.gameImage.frame.origin.y,self.gameImage.frame.size.width,self.gameImage.frame.size.height);
                     }
                     completion:^(BOOL finished){
                         if (finished) {
                             [self.delegate animationEnds];
                         }
                     }];

}

- (void)stopAnimations{
    CALayer *pLayer = [self.gameImage.layer presentationLayer];
    CGRect frameStop = pLayer.frame;
    self.imagePlace = frameStop.origin.x ;
    NSLog(@"POITION : %f",self.imagePlace);
    int score = [self determineScore:self.imagePlace];
    [self.delegate scoreUpdater:score];
    [self.gameImage.layer removeAllAnimations];
}

- (int)determineScore:(float)position{
    float div = self.frame.size.width / 3;
    float div2 = div * 2;
    float div3 = div * 3;
    if (position < div) {
        return 20;
    }else if(position > div && position < div2){
        return 10;
    }else if(position > div2 && position < div3){
        return 5;
    }else{
        return 0;
    }
}

//TODO: Include Game Center
//TODO: Checkout Trello


@end
