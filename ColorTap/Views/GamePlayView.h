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

@end

@interface GamePlayView : UIView

@property (nonatomic, strong) UIImageView *gameImage;
@property (nonatomic) id<GamePlayProtocol> delegate;
-(void)setGameImageAtRandomPlace:(NSString *)imageName;
- (void) moveGameImage:(NSString *)imageName;
- (void) stopAnimations;


@end
