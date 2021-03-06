//
//  ViewController.m
//  ColorTap
//
//  Created by Ranjith on 06/04/15.
//  Copyright (c) 2015 RanjithKumar Matheswaran. All rights reserved.
//

#import "ViewController.h"
#import "ColorBubble.h"
#import "Constants.h"
#import "ScoreView.h"
#import <QuartzCore/QuartzCore.h>
#import "SoundManager.h"
#import "HowToPlayVC.h"
#import "AppSettings.h"
#import "GAI.h"
#import "GAIDictionaryBuilder.h"
#import "AppsaholicSDK.h"
@import GoogleMobileAds;

@interface ViewController (){
    float xPos;
    float yPos;
    ScoreView *scores;
    GamePlayView *gamePlay;
    BOOL isTouched;
    BOOL isPoint;
    BOOL isGameCenterEnabled;
    int loadedTag;
    int score;
    int taps;
    float animTime;
    UIButton *start;
    NSString *scoreLeaderBoard;
    MenuView *menus;
    UIImageView *gc;
    UILabel *gcLabel;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadAppsaholic];
    NSLog(@"Google Mobile Ads SDK version: %@", [GADRequest sdkVersion]);
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [self authenticateLocalPlayer];
    xPos = 0;
    yPos = self.view.frame.size.height * 0.05; //TODO: Tobe changed after adding the previous views
    [self initValues];
    [self addScoreBoard];
    [self gameView];
    [self loadColorBubbles];
    [self addStartButton];
    [self addGCWarning];
    [self addMenus];
    [self loadAdMob];
    [self blockAllUserInteraction];
    
    //GA
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"events"     // Event category (required)
                                                          action:@"app_launch"  // Event action (required)
                                                           label:@"app_open"          // Event label
                                                           value:nil] build]];    // Event value
}
- (void) initValues{
    isTouched = NO;
    animTime = MINIMUM_SPEED; // This is the starting game speed
    score = 0;
    taps = 0;
    [SoundManager sharedManager].allowsBackgroundMusic = YES;
    [[SoundManager sharedManager] prepareToPlay];
    //Set sound ON / OFF
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    if ([settings objectForKey:@"sound"] == nil) {
        [settings setObject:[NSNumber numberWithBool:YES] forKey:@"sound"];
    }
    
    if ([settings objectForKey:@"show_tutorial"] == nil) {
        [settings setObject:[NSNumber numberWithBool:YES] forKey:@"show_tutorial"];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Game Screen";
}

- (void)addScoreBoard{
    NSString *personalHigh;
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    if ([settings objectForKey:@"personal_high"] != nil) {
        personalHigh = [settings objectForKey:@"personal_high"];
    }else{
        personalHigh = @"0";
    }
    
    NSDictionary *scoreData = @{
                                @"score" : @"0",
                                @"personal_high" : personalHigh
                                };
    scores = [[ScoreView alloc] initWithFrame:CGRectMake(0, yPos, self.view.frame.size.width, self.view.frame.size.height * 0.12) andData:scoreData];
    yPos += scores.frame.size.height + self.view.frame.size.height * 0.03;
    [self.view addSubview:scores];
}

- (void)loadAppsaholic{
    ((AppsaholicSDK *)[AppsaholicSDK sharedManager]).rootViewController = self;
    [[AppsaholicSDK sharedManager] startSession:APPSAHOLIC_KEY withSuccess:^(BOOL success, NSString* status) {
        
    }];
}

- (void)gameView{
    gamePlay = [[GamePlayView alloc] initWithFrame:CGRectMake(0, yPos, self.view.frame.size.width, self.view.frame.size.height * 0.14)];
    [self.view addSubview:gamePlay];
    yPos += gamePlay.frame.size.height + self.view.frame.size.height * 0.1;
    gamePlay.delegate = self;
   // [gamePlay moveGameImage:@"tr_f_2.png"];
}

- (void)addStartButton {
    start = [[UIButton alloc] initWithFrame:CGRectMake(0, yPos, self.view.frame.size.width * 0.60, self.view.frame.size.height * 0.07)];
    start.backgroundColor = [UIColor colorWithRed:(CGFloat)85/255 green:(CGFloat)172/255 blue:(CGFloat)238/255 alpha:1.0];
    [start setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [start setTitleColor:[UIColor colorWithWhite:0.8 alpha:1.0] forState:UIControlStateSelected];
    [start setTitle:@"Start" forState:UIControlStateNormal];
    start.titleLabel.font = [UIFont fontWithName:FONT_SEMIBOLD size:[Constants changeFontSizeWithHeight:IPHONE6_SIZE :18]];
    [start addTarget:self action:@selector(startButton) forControlEvents:UIControlEventTouchUpInside];
    start.center = CGPointMake(self.view.center.x, start.center.y);
    start.layer.cornerRadius = 5.0;
    start.layer.masksToBounds = YES;
    yPos += start.frame.size.height + self.view.frame.size.height * 0.02;
    [self.view addSubview:start];
}

- (void)addGCWarning{
    gc = [[UIImageView alloc] initWithFrame:CGRectMake(10, yPos, self.view.frame.size.height * 0.05, self.view.frame.size.height * 0.05)];
    [gc setImage:[UIImage imageNamed:@"gc-icon"]];
    [self.view addSubview:gc];
    
    gcLabel = [[UILabel alloc] initWithFrame:CGRectMake(gc.frame.origin.x + gc.frame.size.width + 5, yPos, self.view.frame.size.width - gc.frame.origin.x - gc.frame.size.width - 10, gc.frame.size.height)];
    gcLabel.text = @"Log in to Game Center App to avoid losing high scores.";
    gcLabel.textColor = [UIColor lightGrayColor];
    gcLabel.font = [UIFont fontWithName:FONT_REGULAR size:[Constants changeFontSizeWithWidth:IPHONE6PLUS_SIZE :13]];
    [self.view addSubview:gcLabel];
    yPos += gc.frame.size.height ;
}

- (void) addMenus{
    menus = [[MenuView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 50 - self.view.frame.size.height * 0.12 , self.view.frame.size.width, self.view.frame.size.height * 0.09)];
    menus.delegate = self;
    [self.view addSubview:menus];
}

- (void)startButton{
    //GA
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"button_press"  // Event action (required)
                                                           label:@"start_button"          // Event label
                                                           value:nil] build]];    // Event value
    
    [self startGame];
    start.hidden = YES;
}

- (void)loadColorBubbles{
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *colorsArray = [NSArray arrayWithObjects:[UIColor colorWithRed:0.349 green:0.737 blue:0.318 alpha:1.000],[UIColor colorWithRed:0.341 green:0.675 blue:0.953 alpha:1.000],[UIColor colorWithRed:0.937 green:0.388 blue:0.404 alpha:1.000], nil];
    NSArray *shapesArray = [NSArray arrayWithObjects:@"ci_w.png",@"tr_w.png",@"sq_w.png",nil];
    xPos = 10;
    float bubbleSize = (self.view.frame.size.width /  NUMBER_OF_COLORS) - 10 - (10 / NUMBER_OF_COLORS);
    if (colorsArray.count == NUMBER_OF_COLORS) {
        for (int i = 0; i<NUMBER_OF_COLORS; i++) {
            CGRect bubbleFrame = CGRectMake(xPos, yPos,bubbleSize,bubbleSize);
            ColorBubble *bubble = [[ColorBubble alloc] initWithFrame:bubbleFrame andShape:[shapesArray objectAtIndex:i]];
            bubble.backgroundColor = [colorsArray objectAtIndex:i];
            bubble.tag = i;
            
            //Gesture Recogniser
            UITapGestureRecognizer *tapBubble = [[UITapGestureRecognizer alloc] init];
            tapBubble.numberOfTapsRequired = 1;
            [tapBubble addTarget:self action:@selector(bubbleTapped:)];
            [bubble addGestureRecognizer:tapBubble];
            [self.view addSubview:bubble];
            xPos += bubble.frame.size.width + 10;
        }
    }
    yPos += bubbleSize + self.view.frame.size.height * 0.02;
}

-(void)bubbleTapped :(UIGestureRecognizer *)gesture{
    
    int tagValue = (int)gesture.view.tag;
    NSLog(@"%d",tagValue);
    isTouched = YES;
    isPoint = NO;
    
    if (tagValue == 0) {
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                              action:@"bubble_press"  // Event action (required)
                                                               label:@"red_circle"          // Event label
                                                               value:nil] build]];    // Event value
    }
    
    if (tagValue == 1) {
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                              action:@"bubble_press"  // Event action (required)
                                                               label:@"green_triangle"          // Event label
                                                               value:nil] build]];    // Event value
    }
    
    if (tagValue == 2) {
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                              action:@"bubble_press"  // Event action (required)
                                                               label:@"square_blue"          // Event label
                                                               value:nil] build]];    // Event value
    }
    
    //GA
    
    
    CGRect tempFrame = gesture.view.frame;
    CGRect animFrame = tempFrame;
    animFrame.size.width -= 1;
    animFrame.size.height -= 1;
    [UIView animateWithDuration:0.2f
                     animations:^
     {
         [gesture.view setAlpha:0.5f];
         gesture.view.frame = animFrame;
     }
                     completion:^(BOOL finished)
     {
         [gesture.view setAlpha:1.0f];
         gesture.view.frame = tempFrame;
            }
     ];
    
    if (loadedTag == tagValue) {
        
        // Order should not be changed !
        [self playSound:0];
        isPoint = YES;
        [gamePlay stopAnimations]; // This should be called after setting isPoint to YES
        [self startGame];
        
        //GA
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"events"     // Event category (required)
                                                              action:@"game_play"  // Event action (required)
                                                               label:@"win"          // Event label
                                                               value:nil] build]];    // Event value
        
    }else{
        
        //GA
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"events"     // Event category (required)
                                                              action:@"game_play"  // Event action (required)
                                                               label:@"loss"          // Event label
                                                               value:nil] build]];    // Event value

        [self playSound:1];
        [self blockAllUserInteraction];
        [gamePlay stopAnimations];
        NSString *alertMessage = [NSString stringWithFormat:@"Oh ohh ! Your score is %d",score];
        [self showGameEndAlert:alertMessage andScore:[NSString stringWithFormat:@"%d",score]];
        [self resetScores];
    }
}

- (void)scoreUpdater:(int)scoreVal{
    //GA
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"events"     // Event category (required)
                                                          action:@"game_play"  // Event action (required)
                                                           label:@"score_update"          // Event label
                                                           value:[NSNumber numberWithInt:scoreVal]] build]];    // Event value

    
    if (isPoint) {
        score += scoreVal;
        taps +=1;
    }
    [scores updateGameScore:[NSString stringWithFormat:@"%d",score]];
}



- (void)updatePersonalHighScore:(int)gameScore{
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    if (gameScore > [[settings objectForKey:@"personal_high"] intValue]) {
        
        //GA
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"events"     // Event category (required)
                                                              action:@"game_play"  // Event action (required)
                                                               label:@"highscore_update"          // Event label
                                                               value:[NSNumber numberWithInt:gameScore]] build]];    // Event value

        
        
        [settings setObject:[NSString stringWithFormat:@"%d",score] forKey:@"personal_high"];
        [scores updatePersonalScore:[settings objectForKey:@"personal_high"]];
        [self scoreToGamecenter:gameScore];
    }
}

- (void)releaseAllUserInteractionBlock{
    for (ColorBubble *bubble in self.view.subviews) {
        bubble.userInteractionEnabled = YES;
    }
}

- (void)blockAllUserInteraction{
    for (ColorBubble *bubble in self.view.subviews) {
        bubble.userInteractionEnabled = NO;
    }
    start.userInteractionEnabled = YES;
    menus.userInteractionEnabled = YES;
}

-(void)loadAdMob{
    CGRect adMobFrame;
    NSString *deviceType = [UIDevice currentDevice].model;
    if([deviceType hasPrefix:@"iPhone"])
    {
        adMobFrame = CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50);
    }else{
        adMobFrame = CGRectMake(0, self.view.frame.size.height - 90, self.view.frame.size.width, 90);
    }
    
    self.adBanner = [[GADBannerView alloc] initWithFrame:adMobFrame];
    self.adBanner.adUnitID = @"ca-app-pub-3860374128691547/4167946710";
    self.adBanner.rootViewController = self;
    [self.adBanner loadRequest:[GADRequest request]];
    [self.view addSubview:self.adBanner];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startGame{
    
    
    //GA
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"events"     // Event category (required)
                                                          action:@"game_play"  // Event action (required)
                                                           label:@"game_start"          // Event label
                                                           value:nil] build]];    // Event value   // Event value
    
    isTouched = NO;
    [self releaseAllUserInteractionBlock];
    NSDictionary *gameValues = [Constants getRandomGameImage];
    loadedTag = [[gameValues valueForKey:@"tag"] intValue];
    [gamePlay moveGameImage:[gameValues objectForKeyedSubscript:@"name"] animTime:animTime];
    if (animTime > MAXIMUM_SPEED) {
        animTime -= TIME_REDUCTION_FACTOR;
    }
    NSLog(@"TIME %f",animTime);
}

- (void)loseGame{
    
    //GA
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"events"     // Event category (required)
                                                          action:@"game_play"  // Event action (required)
                                                           label:@"lose_game"          // Event label
                                                           value:nil] build]];    // Event value
    [gamePlay stopAnimations];
}

- (void)resetScores{
    score = 0;
    taps = 0;
    animTime = MINIMUM_SPEED;
    [scores updateGameScore:[NSString stringWithFormat:@"%d",score]];
    start.hidden = NO;
}

-(void)animationEnds{
    if (!isTouched) {
        NSString *alertMessage = [NSString stringWithFormat:@"You have not Tapped !. Your score is %d",score];
        [self showGameEndAlert:alertMessage andScore:[NSString stringWithFormat:@"%d",score]];
        [self resetScores];
        [self blockAllUserInteraction];
    }
}

- (void)showGameEndAlert:(NSString *)alertMsg andScore:(NSString*)scoreString;{
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Game Over"
                                                                   message:alertMsg
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIPopoverPresentationController *popover = alert.popoverPresentationController;
    if (popover)
    {
        popover.sourceView = scores;
        popover.sourceRect = scores.bounds;
        popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
    }
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                          
[[AppsaholicSDK sharedManager] trackEvent:EVNT_GAMESCORE notificationType:NO withController:self withSuccess:^(BOOL success, NSString *notificationtext, NSNumber *pointEarned) {
                                                                  NSLog(@"%@ and %@",notificationtext,pointEarned);
                                                              }];
                                                              
                                                          }];
    UIAlertAction* share = [UIAlertAction actionWithTitle:@"Share" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self shareScore:scoreString];
    }];
    [alert addAction:defaultAction];
    [alert addAction:share];

    [self presentViewController:alert animated:YES completion:nil];
    [self updateTaps];
    [self updatePersonalHighScore:[scoreString intValue]];
    [self updateAchievements];
}

- (void)updateAchievements{
    //GA
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"events"     // Event category (required)
                                                          action:@"game_play"  // Event action (required)
                                                           label:@"achievement_update"          // Event label
                                                           value:nil] build]];    // Event value
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    long long int tempTap = [[settings objectForKey:@"taps"] longLongValue];
    int tempScore = [[settings objectForKey:@"personal_high"] intValue];
    [Constants calculateAchievementProgressForTap:tempTap andScore:tempScore];
}

- (void)updateTaps{
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    if ([settings objectForKey:@"taps"] != nil) {
        unsigned long long tapValue = [[settings objectForKey:@"taps"] longLongValue];
        tapValue += taps;
        [settings setObject:[NSString stringWithFormat:@"%llu",tapValue] forKey:@"taps"];
    }else{
        [settings setObject:[NSString stringWithFormat:@"%u",taps] forKey:@"taps"];
    }
    [self tapsToGameCenter:taps];
}

#pragma mark - Game Center Methods

- (void)authenticateLocalPlayer{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    
    localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error){
        if (viewController != nil) {
            [self presentViewController:viewController animated:YES completion:nil];
        }
        else{
            if ([GKLocalPlayer localPlayer].authenticated) {
                //
                //GA
                id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
                
                [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"events"     // Event category (required)
                                                                      action:@"game_play"  // Event action (required)
                                                                       label:@"gc_authenticate"          // Event label
                                                                       value:nil] build]];
                 
                 // Event value
                isGameCenterEnabled = YES;
                gc.hidden = YES;
                gcLabel.hidden = YES;
                [self updateDataFromGameCenter];
                
                //Checking for showing the tutorial
                NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
                if ([settings objectForKey:@"show_tutorial"] != nil) {
                    if ([[settings objectForKey:@"show_tutorial"] boolValue]) {
                        [self loadHowToPlay];
                    }
                }
            }
        }
    };
}

- (void)updateDataFromGameCenter{
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    
    [GKLeaderboard loadLeaderboardsWithCompletionHandler:^(NSArray *leaderboards, NSError *nsError) {
        if( nsError != nil )
        {
            //GA
            id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
            
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"events"     // Event category (required)
                                                                  action:@"game_play"  // Event action (required)
                                                                   label:@"gc_to_local_error"          // Event label
                                                                   value:nil] build]];    // Event value
            return ;
        }
        
        //GA
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"events"     // Event category (required)
                                                              action:@"game_play"  // Event action (required)
                                                               label:@"gc_to_local_success"          // Event label
                                                               value:nil] build]];    // Event value
        for( GKLeaderboard* board in leaderboards )
        {
            [board loadScoresWithCompletionHandler:^(NSArray *scoresArray, NSError *error) {
                if ([board.identifier isEqualToString:LEADERBOARD_TAPS]) {
                    NSLog(@"TAPS %lld",board.localPlayerScore.value);
                    [settings setObject:[NSString stringWithFormat:@"%lld",board.localPlayerScore.value] forKey:@"taps"];
                }
                if ([board.identifier isEqualToString:LEADERBOARD_SCORE]) {
                    NSLog(@"SCORE %lld",board.localPlayerScore.value);
                    [settings setObject:[NSString stringWithFormat:@"%lld",board.localPlayerScore.value] forKey:@"personal_high"];
                    [scores updatePersonalScore:[settings objectForKey:@"personal_high"]];
                }
            }] ;
        }
    }] ;
}

- (void)scoreToGamecenter:(int)scoreValue{
    GKScore *scoreInGameCenter = [[GKScore alloc] initWithLeaderboardIdentifier:LEADERBOARD_SCORE];
    scoreInGameCenter.value = scoreValue;
    [GKScore reportScores:@[scoreInGameCenter] withCompletionHandler:^(NSError *error) {
        if (error != nil) {
            //GA
            id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
            
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"events"     // Event category (required)
                                                                  action:@"game_play"  // Event action (required)
                                                                   label:@"score_to_gc_success"          // Event label
                                                                   value:nil] build]];    // Event value
            NSLog(@"%@", [error localizedDescription]);
        }else{
            //GA
            id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
            
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"events"     // Event category (required)
                                                                  action:@"game_play"  // Event action (required)
                                                                   label:@"score_to_gc_error"          // Event label
                                                                   value:nil] build]];    // Event value
        }
    }];
}

- (void)tapsToGameCenter:(int)tapValue{
    
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    long long int tapsCount = [[settings objectForKey:@"taps"] longLongValue];
    tapsCount += tapValue;
    GKScore *tapInGC = [[GKScore alloc] initWithLeaderboardIdentifier:LEADERBOARD_TAPS];
    tapInGC.value = tapsCount;
    [GKScore reportScores:@[tapInGC] withCompletionHandler:^(NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
            //GA
            id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
            
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"events"     // Event category (required)
                                                                  action:@"game_play"  // Event action (required)
                                                                   label:@"taps_to_gc_success"          // Event label
                                                                   value:nil] build]];    // Event value
        }else{
            //GA
            id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
            
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"events"     // Event category (required)
                                                                  action:@"game_play"  // Event action (required)
                                                                   label:@"taps_to_gc_error"          // Event label
                                                                   value:nil] build]];    // Event value
        }
    }];
}

#pragma mark - menu clicks methods and delegate methods

- (void)menuClicked:(MenuType)menuType{
    
    start.hidden = NO;
    switch (menuType) {
        case MenuTypeGameCenter:
        {
            //GA
            id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
            
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                                  action:@"menu_press"  // Event action (required)
                                                                   label:@"game_center"          // Event label
                                                                   value:nil] build]];    // Event value
        }
            break;
        case MenuTypeHowToPlay:{
            id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
            
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                                  action:@"menu_press"  // Event action (required)
                                                                   label:@"how_to_play"          // Event label
                                                                   value:nil] build]];    // Event value
        }
            break;
        case MenuTypeAppDetails:{
            id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
            
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                                  action:@"menu_press"  // Event action (required)
                                                                   label:@"about_us"          // Event label
                                                                   value:nil] build]];    // Event value
        }
            break;
        default:
            break;
    }
    
    switch (menuType) {
        case MenuTypeGameCenter:
            [self showGameCenter];
            break;
            
        case MenuTypeHowToPlay:
            [self loadHowToPlay];
            break;
            
        case MenuTypeAppDetails:
            [self loadSettings];
            break;
            
        default:
            break;
    }
}

- (void)loadSettings{
    AppSettings *settingVC = [[AppSettings alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:settingVC animated:YES completion:nil];
}

- (void)showGameCenter{
    GKGameCenterViewController *gcViewController = [[GKGameCenterViewController alloc] init];
    gcViewController.gameCenterDelegate = self;
    gcViewController.viewState = GKGameCenterViewControllerStateDefault;
    [self presentViewController:gcViewController animated:YES completion:nil];
}

- (void)loadHowToPlay{
    HowToPlayVC *howToPlay = [[HowToPlayVC alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:howToPlay animated:YES completion:nil];
}

-(void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController{
    [gameCenterViewController dismissViewControllerAnimated:YES completion:^(void){
        NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
        if ([settings objectForKey:@"show_tutorial"] != nil) {
            if ([[settings objectForKey:@"show_tutorial"] boolValue]) {
                [self loadHowToPlay];
            }
        }
    }];
}


- (void)shareScore :(NSString *)scr{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"share_score"  // Event action (required)
                                                           label:@"share"          // Event label
                                                           value:[NSNumber numberWithInt:[scr intValue]]] build]];    // Event value
    UIImage *shareImage = [self scoreCreator:scr];
    NSString *text = [NSString stringWithFormat:@"Download Think & Tap at App Store. http://www.iranjith4.com/thinkandtap"];
    NSArray *objectsToShare = @[shareImage,text];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    
    NSArray *excludeActivities = @[UIActivityTypeAirDrop,
                                   UIActivityTypeAssignToContact,
                                   UIActivityTypeSaveToCameraRoll,
                                   UIActivityTypePostToFlickr,
                                   UIActivityTypePostToVimeo];
    
    activityVC.excludedActivityTypes = excludeActivities;
    
    [activityVC completionWithItemsHandler];
    //if iPhone
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        [self presentViewController:activityVC animated:YES completion:nil];
    }
    //if iPad
    else {
        // Change Rect to position Popover
        UIPopoverController *popup = [[UIPopoverController alloc] initWithContentViewController:activityVC];
        [popup presentPopoverFromRect:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/4, 0, 0)inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
    
    [[AppsaholicSDK sharedManager] trackEvent:EVNT_SCORESHARE notificationType:NO withController:self withSuccess:^(BOOL success, NSString *notificationtext, NSNumber *pointEarned) {
        NSLog(@"%@ and %@",notificationtext,pointEarned);
    }];

}

- (UIImage *) scoreCreator:(NSString *)scoreString{
    UIImageView *temp = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)];
    temp.image = [UIImage imageNamed:@"logo_score.png"];
    UIView *view = [[UIView alloc] initWithFrame:temp.frame];
    [view addSubview:temp];
    UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, temp.frame.size.width * 0.27, temp.frame.size.width,temp.frame.size.width * 0.225)];
    [scoreLabel setText:scoreString];
    scoreLabel.textAlignment = NSTextAlignmentCenter;
    scoreLabel.font =  [UIFont fontWithName:FONT_BOLD size:60];
    scoreLabel.textColor = [UIColor colorWithRed:0.275 green:0.604 blue:0.918 alpha:1.000];
    [view addSubview:scoreLabel];
    return [Constants imageWithView:view];
}

- (void)playSound:(int)tag{
    BOOL playSound;
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    playSound = [[settings objectForKey:@"sound"] boolValue];
    
    if (playSound) {
        switch (tag) {
            case 0:
                [[SoundManager sharedManager] playSound:@"click2.wav" looping:NO];
                break;
                
            case 1:
                [[SoundManager sharedManager] playSound:@"wongfire.wav" looping:NO];
                break;
                
            default:
                break;
        }
    }
    }


@end
