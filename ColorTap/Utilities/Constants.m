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

+(NSDictionary *)getRandomGameImage{
    //Add all Possible Images
    
    NSDictionary *ci_f_1 = @{
                             @"name" : @"ci_f_1.png",
                             @"tag" : @0
                             };
    NSDictionary *ci_f_2 = @{
                             @"name" : @"ci_f_2.png",
                             @"tag" : @1
                             };
    NSDictionary *ci_f_3 = @{
                             @"name" : @"ci_f_3.png",
                             @"tag" : @2
                             };
    NSDictionary *ci_uf_1 = @{
                             @"name" : @"ci_uf_1.png",
                             @"tag" : @0
                             };
    NSDictionary *ci_uf_2 = @{
                             @"name" : @"ci_uf_2.png",
                             @"tag" : @0
                             };
    NSDictionary *ci_uf_3 = @{
                             @"name" : @"ci_uf_3.png",
                             @"tag" : @0
                             };
    NSDictionary *tr_f_1 = @{
                             @"name" : @"tr_f_1.png",
                             @"tag" : @0
                             };
    NSDictionary *tr_f_2 = @{
                             @"name" : @"tr_f_2.png",
                             @"tag" : @1
                             };
    NSDictionary *tr_f_3 = @{
                             @"name" : @"tr_f_3.png",
                             @"tag" : @2
                             };
    NSDictionary *tr_uf_1 = @{
                             @"name" : @"tr_uf_1.png",
                             @"tag" : @1
                             };
    NSDictionary *tr_uf_2 = @{
                             @"name" : @"tr_uf_2.png",
                             @"tag" : @1
                             };
    NSDictionary *tr_uf_3 = @{
                             @"name" : @"tr_uf_3.png",
                             @"tag" : @1
                             };
    NSDictionary *sq_f_1 = @{
                             @"name" : @"sq_f_1.png",
                             @"tag" : @0
                             };
    NSDictionary *sq_f_2 = @{
                             @"name" : @"sq_f_2.png",
                             @"tag" : @1
                             };
    NSDictionary *sq_f_3 = @{
                             @"name" : @"sq_f_3.png",
                             @"tag" : @2
                             };
    NSDictionary *sq_uf_1 = @{
                             @"name" : @"sq_uf_1.png",
                             @"tag" : @2
                             };
    NSDictionary *sq_uf_2 = @{
                             @"name" : @"sq_uf_2.png",
                             @"tag" : @2
                             };
    NSDictionary *sq_uf_3 = @{
                             @"name" : @"sq_uf_3.png",
                             @"tag" : @2
                             };
    NSArray *imagesArray = [NSArray arrayWithObjects:ci_f_1,ci_f_2,ci_f_3,ci_uf_1,ci_uf_2,ci_uf_3,tr_f_1,tr_f_2,tr_f_3,tr_uf_1,tr_uf_2,tr_uf_3,sq_f_1,sq_f_2,sq_f_3,sq_uf_1,sq_uf_2,sq_uf_3,nil];
    int lowerBound = 0;
    int upperBound = 17;
    int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
    
    return [imagesArray objectAtIndex:rndValue];
}

@end
