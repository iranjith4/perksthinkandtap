//
//  Constants.m
//  ColorTap
//
//  Created by Ranjith on 07/04/15.
//  Copyright (c) 2015 RanjithKumar Matheswaran. All rights reserved.
//

#import "Constants.h"

@implementation Constants

+(float)changeFontSizeWithWidth:(CGSize)referenceDevice :(float)space{
    space = space * (SCREEN_WIDTH/referenceDevice.width);
    return space;
}

+(float)changeFontSizeWithHeight:(CGSize)referenceDevice :(float)space{
    space = space * (SCREEN_HEIGHT/referenceDevice.height);
    return space;
}

@end
