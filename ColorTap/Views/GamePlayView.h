//
//  GamePlayView.h
//  ColorTap
//
//  Created by Ranjith on 08/04/15.
//  Copyright (c) 2015 RanjithKumar Matheswaran. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GamePlayProtocol<NSObject>

- (void)animationEnds;
- (void)scoreUpdater:(int)scoreVal;

@end

@interface GamePlayView : UIView

@property (nonatomic, strong) UIImageView *gameImage;
@property (nonatomic) id<GamePlayProtocol> delegate;
@property (nonatomic) float imagePlace;

- (void)moveGameImage:(NSString *)imageName animTime:(float)animTime;
- (void) stopAnimations;


@end
