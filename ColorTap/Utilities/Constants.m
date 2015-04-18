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

+ (UIImage *) imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

+(void)calculateAchievementProgressForTap:(long long int)taps andScore:(int)score{
    
    GKAchievement *a1000p3 = [[GKAchievement alloc] initWithIdentifier:@"grp.a1000p3"];
    GKAchievement *a2000p7 = [[GKAchievement alloc] initWithIdentifier:@"grp.a2000p7"];
    GKAchievement *a3000p10 = [[GKAchievement alloc] initWithIdentifier:@"grp.a3000p10"];
    GKAchievement *a4000p20 = [[GKAchievement alloc] initWithIdentifier:@"grp.a4000p20"];
    GKAchievement *a5000p30 = [[GKAchievement alloc] initWithIdentifier:@"grp.a5000p30"];
    GKAchievement *a6000p40 = [[GKAchievement alloc] initWithIdentifier:@"grp.a6000p40"];
    GKAchievement *a7000p50 = [[GKAchievement alloc] initWithIdentifier:@"grp.a7000p50"];
    GKAchievement *a8000p60 = [[GKAchievement alloc] initWithIdentifier:@"grp.a8000p60"];
    GKAchievement *a9000p70 = [[GKAchievement alloc] initWithIdentifier:@"grp.a9000p70"];
    GKAchievement *a10000p80 = [[GKAchievement alloc] initWithIdentifier:@"grp.a10000p80"];
    GKAchievement *a20000p90 = [[GKAchievement alloc] initWithIdentifier:@"grp.a20000p90"];
    GKAchievement *a50000p100 = [[GKAchievement alloc] initWithIdentifier:@"grp.a50000p100"];
    GKAchievement *b1000t5 = [[GKAchievement alloc] initWithIdentifier:@"grp.b1000t5"];
    GKAchievement *b5000t10 = [[GKAchievement alloc] initWithIdentifier:@"grp.b5000t10"];
    GKAchievement *b10000t15 = [[GKAchievement alloc] initWithIdentifier:@"grp.b10000t15"];
    GKAchievement *b20000t20 = [[GKAchievement alloc] initWithIdentifier:@"grp.b20000t20"];
    GKAchievement *b40000t40 = [[GKAchievement alloc] initWithIdentifier:@"grp.b40000t40"];
    GKAchievement *b80000t50 = [[GKAchievement alloc] initWithIdentifier:@"grp.b80000t50"];
    GKAchievement *b160000t60 = [[GKAchievement alloc] initWithIdentifier:@"grp.b160000t60"];
    GKAchievement *b250000t70 = [[GKAchievement alloc] initWithIdentifier:@"grp.b250000t70"];
    GKAchievement *b500000t80 = [[GKAchievement alloc] initWithIdentifier:@"grp.b500000t80"];
    GKAchievement *b1000000t90 = [[GKAchievement alloc] initWithIdentifier:@"grp.b1000000t90"];
    
    a1000p3.percentComplete = [self getAchievementPercentage:score base:1000];
    a2000p7.percentComplete = [self getAchievementPercentage:score base:2000];;
    a3000p10.percentComplete = [self getAchievementPercentage:score base:3000];
    a4000p20.percentComplete = [self getAchievementPercentage:score base:4000];
    a5000p30.percentComplete = [self getAchievementPercentage:score base:5000];
    a6000p40.percentComplete = [self getAchievementPercentage:score base:6000];
    a7000p50.percentComplete = [self getAchievementPercentage:score base:7000];
    a8000p60.percentComplete = [self getAchievementPercentage:score base:8000];
    a9000p70.percentComplete = [self getAchievementPercentage:score base:9000];
    a10000p80.percentComplete = [self getAchievementPercentage:score base:10000];
    a20000p90.percentComplete = [self getAchievementPercentage:score base:20000];
    a50000p100.percentComplete = [self getAchievementPercentage:score base:50000];
    b1000t5.percentComplete = [self getAchievementPercentage:taps base:1000];
    b5000t10.percentComplete = [self getAchievementPercentage:taps base:5000];
    b10000t15.percentComplete = [self getAchievementPercentage:taps base:10000];
    b20000t20.percentComplete = [self getAchievementPercentage:taps base:20000];
    b40000t40.percentComplete = [self getAchievementPercentage:taps base:40000];
    b80000t50.percentComplete = [self getAchievementPercentage:taps base:80000];
    b160000t60.percentComplete = [self getAchievementPercentage:taps base:160000];
    b250000t70.percentComplete = [self getAchievementPercentage:taps base:250000];
    b500000t80.percentComplete = [self getAchievementPercentage:taps base:500000];
    b1000000t90.percentComplete = [self getAchievementPercentage:taps base:1000000];
    
    NSArray *achievements = [NSArray arrayWithObjects:a1000p3,
                             a2000p7,
                             a3000p10,
                             a4000p20,
                             a5000p30,
                             a6000p40,
                             a7000p50,
                             a8000p60,
                             a9000p70,
                             a10000p80,
                             a20000p90,
                             a50000p100,
                             b1000t5,
                             b5000t10,
                             b10000t15,
                             b20000t20,
                             b40000t40,
                             b80000t50,
                             b160000t60,
                             b250000t70,
                             b500000t80,
                             b1000000t90,nil];
    
    [GKAchievement reportAchievements: achievements withCompletionHandler:^(NSError *error)
     {
         if (error != nil)
         {
             NSLog(@"Error in reporting achievements: %@", error);
         }
         else{
             NSLog(@"Achievements success");
         }
     }];


/*  a1000p3
    a2000p7
    a3000p10
    a4000p20
    a5000p30
    a6000p40
    a7000p50
    a8000p60
    a9000p70
    a10000p80
    a20000p90
    a50000p100
    b1000t5
    b5000t10
    b10000t15
    b20000t20
    b40000t40
    b80000t50
    b160000t60
    b250000t70
    b500000t80
    b1000000t90
 */
   
}

+(void)clearAllAchivements{
    [GKAchievement resetAchievementsWithCompletionHandler:^(NSError *error)
     {
         if (error != nil){
             
         }
    }];
}

+(float)getAchievementPercentage:(long long int)score base:(int)baseScore{
    float returnValue;
    
    float percent = (float)score / baseScore * 100;;
    if (percent > 100.00) {
        returnValue = 100.00;
    }else if(returnValue > 0 && returnValue < 100){
        returnValue = percent;
    }else {
        returnValue = 0;
    }
    return returnValue;
}


@end
