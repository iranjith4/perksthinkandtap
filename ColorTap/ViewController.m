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

@interface ViewController (){
    float xPos;
    float yPos;
    ScoreView *scores;
    GamePlayView *gamePlay;
    BOOL isTouched;
    int loadedTag;
    int score;
    float animTime;
    UIButton *start;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    xPos = 0;
    yPos = self.view.frame.size.height * 0.20; //TODO: Tobe changed after adding the previous views
    [self initValues];
    [self addScoreBoard];
    [self gameView];
    [self loadColorBubbles];
    [self addStartButton];
    [self loadAdMob];
    [self blockAllUserInteraction];
}
- (void) initValues{
    isTouched = NO;
    animTime = MINIMUM_SPEED; // This is the starting game speed
    score = 0;
}

- (void)addScoreBoard{
    NSDictionary *scoreData = @{
                                @"score" : @"0",
                                @"personal_high" : @"430"
                                };
    scores = [[ScoreView alloc] initWithFrame:CGRectMake(0, yPos, self.view.frame.size.width, self.view.frame.size.height * 0.10) andData:scoreData];
    yPos += scores.frame.size.height + self.view.frame.size.height * 0.02;
    [self.view addSubview:scores];
}

- (void)gameView{
    gamePlay = [[GamePlayView alloc] initWithFrame:CGRectMake(0, yPos, self.view.frame.size.width, self.view.frame.size.height * 0.12)];
    [self.view addSubview:gamePlay];
    yPos += gamePlay.frame.size.height + self.view.frame.size.height * 0.05;
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

- (void)startButton{
    [self startGame];
    start.hidden = YES;
}

- (void)loadColorBubbles{
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *colorsArray = [NSArray arrayWithObjects:[UIColor colorWithRed:0.604 green:0.576 blue:0.173 alpha:1.000],[UIColor colorWithRed:0.157 green:0.137 blue:0.388 alpha:1.000],[UIColor colorWithRed:0.992 green:0.608 blue:0.039 alpha:1.000], nil];
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
    yPos += bubbleSize + self.view.frame.size.height * 0.04;
}

-(void)bubbleTapped :(UIGestureRecognizer *)gesture{
    int tagValue = (int)gesture.view.tag;
    NSLog(@"%d",tagValue);
    isTouched = YES;
    switch (tagValue) {
        case 0:
            //TODO: Tap Handle for Red
            break;
        case 1:
            //TODO: Tap Handle for Green
            break;
        case 2:
            //TODO: Tap Handle for Blue
            break;
        default:
            break;
    }
    
    [gamePlay stopAnimations];  //Stop Moving Animation
    if (loadedTag == tagValue) {
        [self startGame];
        [self updateScore];
    }else{
        [self blockAllUserInteraction];
        NSString *alertMessage = [NSString stringWithFormat:@"You missed the game. Your score is %d",score];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over" message:alertMessage delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
        [self resetScores];
        [alert show];
    }
}

- (void)updateScore{
    score += 10;
    [scores updateGameScore:[NSString stringWithFormat:@"%d",score]];
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
}

-(void)loadAdMob{
    CGRect adMobFrame = CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50);
    UIView *adMob = [[UIView alloc] initWithFrame:adMobFrame];
    adMob.backgroundColor = [UIColor colorWithRed:0.510 green:0.755 blue:1.000 alpha:1.000];
    [self.view addSubview:adMob];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startGame{
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
    [gamePlay stopAnimations];
}

- (void)resetScores{
    score = 0;
    animTime = MINIMUM_SPEED;
    [scores updateGameScore:[NSString stringWithFormat:@"%d",score]];
    start.hidden = NO;
}

-(void)animationEnds{
    if (!isTouched) {
        NSString *alertMessage = [NSString stringWithFormat:@"You missed the Touch. Your score is %d",score];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over" message:alertMessage delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
        [self resetScores];
        [self blockAllUserInteraction];
        [alert show];
    }
}

@end
