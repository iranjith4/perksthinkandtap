//
//  Constants.h
//  ColorTap
//
//  Created by Ranjith on 07/04/15.
//  Copyright (c) 2015 RanjithKumar Matheswaran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>

// Game Configurations
#define NUMBER_OF_COLORS 3

//APPSAHOLIC KEY

#define APPSAHOLIC_KEY @"1e8b0b4e3b62ea6b013f89c4854a2b872d880fd5"

//Event ids

#define EVNT_GAMESCORE @"c4b564ab4e094d3ce61d8175acba29322448afe8"
#define EVNT_SCORESHARE @"980e78f34b0e13e98898c75f27ff948cfc10aec7"

//Font Settings
#define FONT_REGULAR @"AppleSDGothicNeo-Regular"
#define FONT_THIN @"AppleSDGothicNeo-Thin"
#define FONT_LIGHT @"AppleSDGothicNeo-Light"
#define FONT_MEDIUM @"AppleSDGothicNeo-Medium"
#define FONT_SEMIBOLD @"AppleSDGothicNeo-SemiBold"
#define FONT_BOLD @"AppleSDGothicNeo-Bold"

//iPhone Screen Sizes

#define IPHONE4_SIZE CGSizeMake(320,480)
#define IPHONE5_SIZE CGSizeMake(320,568)
#define IPHONE6_SIZE CGSizeMake(375,667)
#define IPHONE6PLUS_SIZE CGSizeMake(414,736)

//Current Device Sizes
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define STATUS_BAR_HEIGHT [UIApplication sharedApplication].statusBarFrame.size.height
#define SCREEN_RESOLUTION_WIDTH [[UIScreen mainScreen] bounds].size.width * [UIScreen mainScreen].scale

//Leaderboard Names Constants
#define LEADERBOARD_SCORE @"grp.colortapscore"
#define LEADERBOARD_TAPS @"grp.colortaptaps"

//Menu Types
typedef enum : NSUInteger {
    MenuTypeGameCenter,
    MenuTypeHowToPlay,
    MenuTypeAppDetails,
} MenuType;

@interface Constants : NSObject

+(float)changeFontSizeWithWidth:(CGSize)referenceDevice :(float)space;
+(float)changeFontSizeWithHeight:(CGSize)referenceDevice :(float)space;
+(NSDictionary *)getRandomGameImage;
+ (UIImage *) imageWithView:(UIView *)view;
+(void)calculateAchievementProgressForTap:(long long int)taps andScore:(int)score;
+(void)clearAllAchivements;

@end
