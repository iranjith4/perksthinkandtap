//
//  ColorBubble.h
//  ColorTap
//
//  Created by Ranjith on 07/04/15.
//  Copyright (c) 2015 RanjithKumar Matheswaran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorBubble : UIView

-(instancetype)initWithFrame:(CGRect)frame andShape:(NSString *)imageName;
@property (nonatomic, strong) UIImageView *shapeView;

@end
