//
//  ColorBubble.m
//  ColorTap
//
//  Created by Ranjith on 07/04/15.
//  Copyright (c) 2015 RanjithKumar Matheswaran. All rights reserved.
//

#import "ColorBubble.h"
#import "Constants.h"

@implementation ColorBubble{
    NSString *shapeName;
}

-(instancetype)initWithFrame:(CGRect)frame andShape:(NSString *)imageName{
    self = [super initWithFrame:frame];
    if (self) {
        shapeName = imageName;
        [self initUI];
    }
    return self;
}

- (void)initUI{
    self.backgroundColor = [UIColor grayColor];
    self.shapeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width / 2, self.frame.size.height / 2)];
    self.shapeView.image = [UIImage imageNamed:shapeName];
    CGRect frame =self.shapeView.frame;
    frame.origin.x = self.frame.size.width / 4;
    frame.origin.y = self.frame.size.height / 4;
    self.shapeView.frame = frame;
    [self addSubview:self.shapeView];
    
    self.layer.cornerRadius = self.frame.size.width / 2;
    self.layer.masksToBounds = YES;
}
@end
