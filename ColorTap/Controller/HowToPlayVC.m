//
//  HowToPlayVC.m
//  ColorTap
//
//  Created by Ranjith on 18/04/15.
//  Copyright (c) 2015 RanjithKumar Matheswaran. All rights reserved.
//

#import "HowToPlayVC.h"
#import "MenuButton.h"
#import "Constants.h"
#import "ColorBubble.h"
#import "GAIDictionaryBuilder.h"
#import "GAI.h"

@interface HowToPlayVC (){
    UIScrollView *scroll;
    float xPos;
    float yPos;
    MenuButton *closeButton;
}

@end

@implementation HowToPlayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [self addScrollView];
//    [self addCloseButton];
//    [self loadColorBubbles];
//    [self tutor];
    [self addImageTutor];
    [self addCloseButton];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"How to Play";
}
- (void)addScrollView{
    scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, [[UIApplication sharedApplication] statusBarFrame].size.height, self.view.frame.size.width, self.view.frame.size.height - [[UIApplication sharedApplication] statusBarFrame].size.height)];
    scroll.contentSize = CGSizeMake(self.view.frame.size.width, yPos);
    scroll.backgroundColor = [UIColor whiteColor];
    scroll.scrollEnabled = YES;
    scroll.alwaysBounceVertical = YES;
    [self.view addSubview:scroll];
}

- (void)addImageTutor {
    
    yPos = 40;
    
    UILabel *intro = [[UILabel alloc] initWithFrame:CGRectMake(10, yPos, self.view.frame.size.width - 20, 20)];
    intro.text = @"How to Play ?";
    intro.font = [UIFont fontWithName:FONT_SEMIBOLD size:15];
    intro.textAlignment = NSTextAlignmentCenter;
    intro.textColor = [UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000];
    [scroll addSubview:intro];
    yPos += 30;
    
    UIImage *image1 = [UIImage imageNamed:@"tut1.png"];
    UIImage *image2 = [UIImage imageNamed:@"tut2.jpg"];
    UIImage *image3 = [UIImage imageNamed:@"tut3.jpg"];
    
    
    
    UIImageView *tut1 = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 0.05, yPos, [self getNewSizeForImage:image1].width, [self getNewSizeForImage:image1].height)];
    tut1.backgroundColor = [UIColor orangeColor];
    [scroll addSubview:tut1];
    yPos += tut1.frame.size.height + 20;
    
    
    UILabel *filled = [[UILabel alloc] initWithFrame:CGRectMake(10, yPos, self.view.frame.size.width - 20, 20)];
    filled.text = @"Filled Shapes";
    filled.font = [UIFont fontWithName:FONT_SEMIBOLD size:15];
    filled.textAlignment = NSTextAlignmentCenter;
    filled.textColor = [UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000];
    [scroll addSubview:filled];
    yPos += 30;
    
    
    UIImageView *tut2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 0.05, yPos, [self getNewSizeForImage:image2].width, [self getNewSizeForImage:image1].height)];
    tut2.backgroundColor = [UIColor orangeColor];
    [scroll addSubview:tut2];
    yPos += tut2.frame.size.height + 20;
    
    UILabel *unFilled = [[UILabel alloc] initWithFrame:CGRectMake(10, yPos, self.view.frame.size.width - 20, 20)];
    unFilled.text = @"Unfilled Shapes";
    unFilled.font = [UIFont fontWithName:FONT_SEMIBOLD size:15];
    unFilled.textAlignment = NSTextAlignmentCenter;
    unFilled.textColor = [UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000];
    [scroll addSubview:unFilled];
    yPos += 30;
    
    UIImageView *tut3= [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 0.05, yPos, [self getNewSizeForImage:image3].width, [self getNewSizeForImage:image1].height)];
    tut3.backgroundColor = [UIColor orangeColor];
    [scroll addSubview:tut3];
    yPos += tut3.frame.size.height + 20;
    
    UILabel *scoring = [[UILabel alloc] initWithFrame:CGRectMake(10, yPos, self.view.frame.size.width - 20, 20)];
    scoring.text = @"Scoring";
    scoring.font = [UIFont fontWithName:FONT_SEMIBOLD size:15];
    scoring.textAlignment = NSTextAlignmentCenter;
    scoring.textColor = [UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000];
    [scroll addSubview:scoring];
    yPos += 30;
    
    UIImageView *tut4= [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 0.05, yPos, [self getNewSizeForImage:image3].width, [self getNewSizeForImage:image1].height)];
    tut4.backgroundColor = [UIColor orangeColor];
    [scroll addSubview:tut4];
    yPos += tut4.frame.size.height + 20;
    
    UILabel *end = [[UILabel alloc] initWithFrame:CGRectMake(10, yPos, self.view.frame.size.width - 20, 20)];
    end.text = @"That's it. Have Fun !";
    end.font = [UIFont fontWithName:FONT_SEMIBOLD size:15];
    end.textAlignment = NSTextAlignmentCenter;
    end.textColor = [UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000];
    [scroll addSubview:end];
    yPos += 30;

}

- (void)addCloseButton{
    closeButton = [[MenuButton alloc] initWithFrame:CGRectMake(0, yPos, self.view.frame.size.width * 0.30, 30)];
    closeButton.backgroundColor = [UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000];
    [closeButton setTitle:@"Start Tapping" forState:UIControlStateNormal];
    [closeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [closeButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    closeButton.titleLabel.font = [UIFont fontWithName:FONT_MEDIUM size:[Constants changeFontSizeWithWidth:IPHONE5_SIZE :13]];
    [closeButton addTarget:self action:@selector(closeButton) forControlEvents:UIControlEventTouchUpInside];
    closeButton.center = CGPointMake(self.view.center.x, closeButton.center.y);
    [scroll addSubview:closeButton];
    yPos += closeButton.frame.size.height + 30;
    
    scroll.contentSize = CGSizeMake(self.view.frame.size.width, yPos);
}

- (CGSize)getNewSizeForImage:(UIImage *)image{
    float width = image.size.width;
    float height = image.size.height;
    float newWidth = self.view.frame.size.width * 0.90;
    float ratio = newWidth / width;
    float newHeight = ratio * height;
    return CGSizeMake(newWidth, newHeight);
}

- (void)tutor{
    UILabel *intro = [[UILabel alloc] initWithFrame:CGRectMake(10, yPos, self.view.frame.size.width - 20, 20)];
    intro.text = @"Three bubbles bear a COLOR and a SHAPE.";
    intro.font = [UIFont fontWithName:FONT_SEMIBOLD size:15];
    intro.textAlignment = NSTextAlignmentCenter;
    intro.textColor = [UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha: 1.000];
    [intro sizeToFit];
    [self.view addSubview:intro];
    yPos += 30;
    
    
    UIImageView *outline = [[UIImageView alloc] initWithFrame:CGRectMake(0, yPos, self.view.frame.size.width * 0.20, self.view.frame.size.width * 0.20)];
    outline.image = [UIImage imageNamed:@"tr_f_3.png"];
    outline.center = CGPointMake(self.view.center.x/4 * 2, outline.center.y);
    [self.view addSubview:outline];
    
    UIImageView *outline1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, yPos, self.view.frame.size.width * 0.20, self.view.frame.size.width * 0.20)];
    outline1.image = [UIImage imageNamed:@"sq_f_2.png"];
    outline1.center = CGPointMake(self.view.center.x * 3/4 *2, outline1.center.y);
    [self.view addSubview:outline1];
    
    yPos += self.view.frame.size.width * 0.30;
    
    UILabel *start = [[UILabel alloc] initWithFrame:CGRectMake(10, yPos, self.view.frame.size.width - 20, 20)];
    start.text = @"Tap corresponding colors for FILLED Shapes.";
    start.font = [UIFont fontWithName:FONT_SEMIBOLD size:15];
    start.textAlignment = NSTextAlignmentCenter;
    start.textColor = [UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000];
    [start sizeToFit];
    [self.view addSubview:start];
    yPos += start.frame.size.height + 20;
    
    UIImageView *outline3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, yPos, self.view.frame.size.width * 0.20, self.view.frame.size.width * 0.20)];
    outline3.image = [UIImage imageNamed:@"tr_uf_1.png"];
    outline3.center = CGPointMake(self.view.center.x/4 * 2, outline3.center.y);
    [self.view addSubview:outline3];
    
    UIImageView *outline2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, yPos, self.view.frame.size.width * 0.20, self.view.frame.size.width * 0.20)];
    outline2.image = [UIImage imageNamed:@"ci_uf_3.png"];
    outline2.center = CGPointMake(self.view.center.x * 3/4 *2, outline2.center.y);
    [self.view addSubview:outline2];
    
    yPos += self.view.frame.size.width * 0.30;
    
    
    UILabel *start1 = [[UILabel alloc] initWithFrame:CGRectMake(10, yPos, self.view.frame.size.width - 20, 20)];
    start1.text = @"Tap corresponding shape for UNFILLED Shapes.";
    start1.font = [UIFont fontWithName:FONT_SEMIBOLD size:15];
    start1.textAlignment = NSTextAlignmentCenter;
    start1.textColor = [UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000];
    [start1 sizeToFit];
    [self.view addSubview:start1];
    yPos += start1.frame.size.height + 20;
    
    
    UILabel *start2 = [[UILabel alloc] initWithFrame:CGRectMake(10, yPos, self.view.frame.size.width - 20, 20)];
    start2.text = @"SCORING";
    start2.font = [UIFont fontWithName:FONT_BOLD size:15];
    start2.textAlignment = NSTextAlignmentCenter;
    start2.textColor = [UIColor colorWithWhite:0.325 alpha:1.000];
    [self.view addSubview:start2];
    yPos += start2.frame.size.height + 20;
    
    
    UILabel *start3 = [[UILabel alloc] initWithFrame:CGRectMake(10, yPos, self.view.frame.size.width - 20, 20)];
    start3.text = @"Faster you Tap, High you score.";
    start3.font = [UIFont fontWithName:FONT_SEMIBOLD size:15];
    start3.textAlignment = NSTextAlignmentCenter;
    start3.textColor = [UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000];
    [start3 sizeToFit];
    [self.view addSubview:start3];
    yPos += start3.frame.size.height + 20;
    
    
    xPos = 0;
    
    NSArray * scoreColors = [NSArray arrayWithObjects:[UIColor colorWithWhite:0.850 alpha:1.0],[UIColor colorWithWhite:0.900 alpha:1.0],[UIColor colorWithWhite:0.950 alpha:1.0],nil];
    NSArray *scoreValues = [NSArray arrayWithObjects:@"20 pts",@"10 pts",@"5 pts",nil];
    for (int i = 0; i < 3; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(xPos,yPos, self.view.frame.size.width / 3, self.view.frame.size.width * 0.20)];
        view.backgroundColor = [scoreColors objectAtIndex:i];
        UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, view.frame.size.height * 0.85, view.frame.size.width, view.frame.size.height * 0.15)];
        scoreLabel.text = [scoreValues objectAtIndex:i];
        scoreLabel.textAlignment = NSTextAlignmentCenter;
        scoreLabel.font = [UIFont fontWithName:FONT_SEMIBOLD size:10];
        scoreLabel.textColor = [UIColor darkGrayColor];
        [view addSubview:scoreLabel];
        [scroll addSubview:view];
        xPos += view.frame.size.width;
    }
}

- (void)loadColorBubbles{
        self.view.backgroundColor = [UIColor whiteColor];
        NSArray *colorsArray = [NSArray arrayWithObjects:[UIColor colorWithRed:0.604 green:0.576 blue:0.173 alpha:1.000],[UIColor colorWithRed:0.157 green:0.137 blue:0.388 alpha:1.000],[UIColor colorWithRed:0.992 green:0.608 blue:0.039 alpha:1.000], nil];
        NSArray *shapesArray = [NSArray arrayWithObjects:@"ci_w.png",@"tr_w.png",@"sq_w.png",nil];
        xPos = 120;
        float bubbleSize = (self.view.frame.size.width /  NUMBER_OF_COLORS) - 60 - (60 / NUMBER_OF_COLORS);
        if (colorsArray.count == NUMBER_OF_COLORS) {
            for (int i = 0; i<NUMBER_OF_COLORS; i++) {
                CGRect bubbleFrame = CGRectMake(xPos, yPos,bubbleSize,bubbleSize);
                ColorBubble *bubble = [[ColorBubble alloc] initWithFrame:bubbleFrame andShape:[shapesArray objectAtIndex:i]];
                bubble.backgroundColor = [colorsArray objectAtIndex:i];
                bubble.tag = i;
                
                //Gesture Recogniser
                UITapGestureRecognizer *tapBubble = [[UITapGestureRecognizer alloc] init];
                tapBubble.numberOfTapsRequired = 1;
                [bubble addGestureRecognizer:tapBubble];
                [self.view addSubview:bubble];
                xPos += bubble.frame.size.width + 10;
            }
        }
        yPos += bubbleSize + self.view.frame.size.height * 0.04;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)closeButton{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"button_press"  // Event action (required)
                                                           label:@"how_to_play_close"          // Event label
                                                           value:nil] build]];    // Event value
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setObject:[NSNumber numberWithBool:NO] forKey:@"show_tutorial"];
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
