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

@interface ViewController (){
    float xPos;
    float yPos;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    xPos = 0;
    yPos = self.view.frame.size.height * 0.60; //TODO: Tobe changed after adding the previous views
    [self loadColorBubbles];
    [self loadAdMob];
}

- (void)loadColorBubbles{
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *colorsArray = [NSArray arrayWithObjects:[UIColor redColor],[UIColor greenColor],[UIColor blueColor], nil];
    xPos = 10;
    float bubbleSize = (self.view.frame.size.width /  NUMBER_OF_COLORS) - 10 - (10 / NUMBER_OF_COLORS);
    if (colorsArray.count == NUMBER_OF_COLORS) {
        for (int i = 0; i<NUMBER_OF_COLORS; i++) {
            CGRect bubbleFrame = CGRectMake(xPos, yPos,bubbleSize,bubbleSize);
            ColorBubble *bubble = [[ColorBubble alloc] initWithFrame:bubbleFrame andShape:@"triangle"];
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
}

-(void)bubbleTapped :(UIGestureRecognizer *)gesture{
    int tagValue = gesture.view.tag;
    NSLog(@"%d",tagValue);
    
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

@end
