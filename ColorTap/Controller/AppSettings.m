//
//  AppSettings.m
//  ColorTap
//
//  Created by Ranjith on 18/04/15.
//  Copyright (c) 2015 RanjithKumar Matheswaran. All rights reserved.
//

#import "AppSettings.h"
#import "Constants.h"
#import "MenuButton.h"
#import "GAI.h"
#import "GAIDictionaryBuilder.h"


@interface AppSettings (){
    UIScrollView *scroll;
    float xPos;
    float yPos;
}

@end

@implementation AppSettings

- (void)viewDidLoad {
    [super viewDidLoad];
    
    yPos = self.view.frame.size.width * 0.03;
    self.view.backgroundColor = [UIColor whiteColor];
    scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, [[UIApplication sharedApplication] statusBarFrame].size.height,self.view.frame.size.width , self.view.frame.size.height - [[UIApplication sharedApplication] statusBarFrame].size.height)];
    scroll.alwaysBounceVertical = YES;
    scroll.scrollEnabled = YES;
    scroll.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scroll];
    // Do any additional setup after loading the view.
    
    [self addName];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"About us";
}

- (void)addName{
    UILabel *unFilled = [[UILabel alloc] initWithFrame:CGRectMake(10, yPos, self.view.frame.size.width - 20, 40)];
    unFilled.text = @"Think & Tap";
    unFilled.font = [UIFont fontWithName:FONT_BOLD size:25];
    unFilled.textAlignment = NSTextAlignmentCenter;
    unFilled.textColor = [UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000];
    [scroll addSubview:unFilled];
    yPos += 55;
    
    UIImageView *logo = [[UIImageView alloc] initWithFrame:CGRectMake(0, yPos,90, 90)];
    logo.image = [UIImage imageNamed:@"logo.jpg"];
    logo.layer.cornerRadius = 14;
    logo.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    logo.layer.borderWidth = 0.5;
    logo.layer.masksToBounds = YES;
    logo.center = CGPointMake(self.view.center.x, logo.center.y);
    [scroll addSubview:logo];
    
    yPos += logo.frame.size.height + self.view.frame.size.width * 0.03;
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(10, yPos, self.view.frame.size.width - 20, 30)];
    name.text = @"Developer";
    name.font = [UIFont fontWithName:FONT_LIGHT size:[Constants changeFontSizeWithWidth:IPHONE5_SIZE :15]];
    name.textAlignment = NSTextAlignmentCenter;
    name.textColor = [UIColor grayColor];
    [scroll addSubview:name];
    yPos += 20;
    
    UILabel *ranjith = [[UILabel alloc] initWithFrame:CGRectMake(10, yPos, self.view.frame.size.width - 20, 30)];
    ranjith.text = @"Ranjithkumar Matheswaran";
    ranjith.font = [UIFont fontWithName:FONT_REGULAR size:[Constants changeFontSizeWithWidth:IPHONE5_SIZE :15]];
    ranjith.textAlignment = NSTextAlignmentCenter;
    ranjith.textColor = [UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000];
    [scroll addSubview:ranjith];
    yPos += 20;
    
    UILabel *twitter = [[UILabel alloc] initWithFrame:CGRectMake(10, yPos, self.view.frame.size.width - 20, 30)];
    twitter.text = @"@iranjith4";
    twitter.font = [UIFont fontWithName:FONT_REGULAR size:[Constants changeFontSizeWithWidth:IPHONE5_SIZE :13]];
    twitter.textAlignment = NSTextAlignmentCenter;
    twitter.textColor = [UIColor darkGrayColor];
    [scroll addSubview:twitter];
    yPos += 30;
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, yPos, self.view.frame.size.width, 1)];
    line.backgroundColor = [UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000];
    [scroll addSubview: line];
    
    
    UILabel *settingLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, yPos, self.view.frame.size.width - 20, 30)];
    settingLabel.text = @"SETTINGS";
    settingLabel.font = [UIFont fontWithName:FONT_REGULAR size:[Constants changeFontSizeWithWidth:IPHONE5_SIZE :15]];
    settingLabel.textAlignment = NSTextAlignmentCenter;
    settingLabel.textColor = [UIColor grayColor];
    [scroll addSubview:settingLabel];
    yPos += 30;
    
    
    UILabel *sound = [[UILabel alloc] initWithFrame:CGRectMake(10, yPos, self.view.frame.size.width - 20, 30)];
    sound.text = @"Game Sounds";
    sound.font = [UIFont fontWithName:FONT_REGULAR size:[Constants changeFontSizeWithWidth:IPHONE5_SIZE :15]];
    sound.textAlignment = NSTextAlignmentLeft;
    sound.textColor = [UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000];
    [scroll addSubview:sound];

    UISwitch *musicSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 80, yPos, 30, 15)];
    musicSwitch.onTintColor = [UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000];
    [musicSwitch addTarget:self action:@selector(changeSwitch:) forControlEvents:UIControlEventValueChanged];
    
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    BOOL switchOn = [[settings objectForKey:@"sound"] boolValue];
    if (switchOn) {
        musicSwitch.on = YES;
    }else
        musicSwitch.on = NO;
    
    yPos += 60;
    
    MenuButton  *closeButton = [[MenuButton alloc] initWithFrame:CGRectMake(0, yPos, self.view.frame.size.width * 0.80, 30)];
    closeButton.backgroundColor = [UIColor whiteColor];
    [closeButton setTitle:@"Reset Game Center Achievements" forState:UIControlStateNormal];
    [closeButton setTitleColor: [UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000] forState:UIControlStateNormal];
    [closeButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    closeButton.titleLabel.font = [UIFont fontWithName:FONT_MEDIUM size:[Constants changeFontSizeWithWidth:IPHONE5_SIZE :13]];
    closeButton.layer.borderColor = [[UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000] CGColor];
    closeButton.layer.borderWidth = 0.5;
    [closeButton addTarget:self action:@selector(resetGC) forControlEvents:UIControlEventTouchUpInside];
    closeButton.center = CGPointMake(self.view.center.x, closeButton.center.y);
    [scroll addSubview:closeButton];
    yPos += closeButton.frame.size.height + 20;
    
    
    UILabel *madein = [[UILabel alloc] initWithFrame:CGRectMake(10, yPos, self.view.frame.size.width - 20, 30)];
    madein.text = @"Made with ♥ in BANGALORE";
    madein.numberOfLines = 2;
    madein.font = [UIFont fontWithName:FONT_REGULAR size:[Constants changeFontSizeWithWidth:IPHONE5_SIZE :15]];
    madein.textAlignment = NSTextAlignmentCenter;
    madein.textColor = [UIColor grayColor];
    [scroll addSubview:madein];
    yPos += 40;

    
    [self addCloseButton];
    
    [scroll addSubview:musicSwitch];
    
}

-(void)resetGC{
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"about_us"  // Event action (required)
                                                           label:@"gc_reset_alert"          // Event label
                                                           value:nil] build]];    // Event value
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Clear Achievements ?"
                                                                   message:@"Cleared data can't be recovered.Are you sure want to reset all Achievements ?"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIPopoverPresentationController *popover = alert.popoverPresentationController;
    if (popover)
    {
        popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
    }
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                          
                                                              id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
                                                              
                                                              [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                                                                                    action:@"about_us"  // Event action (required)
                                                                                                                     label:@"gc_reset_cancel"          // Event label
                                                                                                                     value:nil] build]];    // Event value
                                                              
                                                          }];
    
    [alert addAction:defaultAction];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
                                                              
                                                              [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                                                                                    action:@"about_us"  // Event action (required)
                                                                                                                     label:@"gc_reset_yes"          // Event label
                                                                                                                     value:nil] build]];    // Event value
                                                          
                                                              [GKAchievement resetAchievementsWithCompletionHandler:^(NSError *error)
                                                               {
                                                                   if (error != nil){
                                                                       id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
                                                                       
                                                                       [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                                                                                             action:@"about_us"  // Event action (required)
                                                                                                                              label:@"gc_reset_success"          // Event label
                                                                                                                              value:nil] build]];    // Event value
                                                                       
                                                                   }else{
                                                                       id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
                                                                       
                                                                       [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                                                                                             action:@"about_us"  // Event action (required)
                                                                                                                              label:@"gc_reset_failure"          // Event label
                                                                                                                              value:nil] build]];    // Event value
                                                                   }
                                                               }];
                                                          }];
    
    [alert addAction:ok];
    
    
    [self presentViewController:alert animated:YES completion:nil];

}

- (void)changeSwitch:(id)sender{
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    if ([sender isOn]) {
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                              action:@"about_us"  // Event action (required)
                                                               label:@"music_on"          // Event label
                                                               value:nil] build]];    // Event value
        [settings setObject:[NSNumber numberWithBool:YES] forKey:@"sound"];
    }else{
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                              action:@"about_us"  // Event action (required)
                                                               label:@"music_off"          // Event label
                                                               value:nil] build]];    // Event value
        [settings setObject:[NSNumber numberWithBool:NO] forKey:@"sound"];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)closeButton{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"about_us"  // Event action (required)
                                                           label:@"close"          // Event label
                                                           value:nil] build]];    // Event value
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addCloseButton{
    MenuButton  *closeButton = [[MenuButton alloc] initWithFrame:CGRectMake(0, yPos, self.view.frame.size.width * 0.30, 30)];
    closeButton.backgroundColor = [UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000];
    [closeButton setTitle:@"Play Game" forState:UIControlStateNormal];
    [closeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [closeButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    closeButton.titleLabel.font = [UIFont fontWithName:FONT_MEDIUM size:[Constants changeFontSizeWithWidth:IPHONE5_SIZE :13]];
    [closeButton addTarget:self action:@selector(closeButton) forControlEvents:UIControlEventTouchUpInside];
    closeButton.center = CGPointMake(self.view.center.x, closeButton.center.y);
    [scroll addSubview:closeButton];
    yPos += closeButton.frame.size.height + 20;
    
    
    
    MenuButton  *rateButton = [[MenuButton alloc] initWithFrame:CGRectMake(0, yPos, self.view.frame.size.width * 0.30, 30)];
    rateButton.backgroundColor = [UIColor whiteColor];
    [rateButton setTitle:@"Rate us" forState:UIControlStateNormal];
    [rateButton setTitleColor:[UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000] forState:UIControlStateNormal];
    [rateButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    rateButton.titleLabel.font = [UIFont fontWithName:FONT_MEDIUM size:[Constants changeFontSizeWithWidth:IPHONE5_SIZE :13]];
    [rateButton addTarget:self action:@selector(rateApp) forControlEvents:UIControlEventTouchUpInside];
    rateButton.layer.borderWidth = 0.5;
    rateButton.layer.borderColor = [[UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000] CGColor];
    rateButton.center = CGPointMake(self.view.center.x, rateButton.center.y);
    [scroll addSubview:rateButton];
    yPos += rateButton.frame.size.height + 10;
    
    
    MenuButton  *write = [[MenuButton alloc] initWithFrame:CGRectMake(0, yPos, self.view.frame.size.width * 0.30, 30)];
    write.backgroundColor = [UIColor whiteColor];
    [write setTitle:@"Write us" forState:UIControlStateNormal];
    [write setTitleColor:[UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000] forState:UIControlStateNormal];
    [write setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    write.titleLabel.font = [UIFont fontWithName:FONT_MEDIUM size:[Constants changeFontSizeWithWidth:IPHONE5_SIZE :13]];
    [write addTarget:self action:@selector(writeUs) forControlEvents:UIControlEventTouchUpInside];
    write.layer.borderColor = [[UIColor colorWithRed:0.259 green:0.596 blue:0.929 alpha:1.000] CGColor];
    write.layer.borderWidth = 0.5;
    write.center = CGPointMake(self.view.center.x, write.center.y);
    [scroll addSubview:write];
    yPos += write.frame.size.height + 30;
    
    UILabel *madein = [[UILabel alloc] initWithFrame:CGRectMake(10, yPos, self.view.frame.size.width - 20, 30)];
    madein.text = @"iranjith4.com/thinkandtap";
    madein.numberOfLines = 1;
    madein.font = [UIFont fontWithName:FONT_REGULAR size:[Constants changeFontSizeWithWidth:IPHONE5_SIZE :15]];
    madein.textAlignment = NSTextAlignmentCenter;
    madein.textColor = [UIColor grayColor];
    [scroll addSubview:madein];
    yPos += 40;
    
    
    scroll.contentSize = CGSizeMake(self.view.frame.size.width, yPos);
}

- (void)rateApp{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"about_us"  // Event action (required)
                                                           label:@"rate_us"          // Event label
                                                           value:nil] build]];    // Event value
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/app/id987177092"]];
}

- (void)writeUs{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"about_us"  // Event action (required)
                                                           label:@"write_us"          // Event label
                                                           value:nil] build]];    // Event value
    // Email Subject
    NSString *emailTitle = @"think and tap player voice";
    // Email Content
    NSString *messageBody = [NSString stringWithFormat:@"\n\n------------------please write above this line\n %@ - %@",[[UIDevice currentDevice] model],[[UIDevice currentDevice] systemVersion]];
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"thinkandtap@iranjith4.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:^(void){
        if (result == MFMailComposeResultSent) {
            [self alert];
        }
        
    }];
}

- (void)alert{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Thanks !"
                                                                   message:@"Thanks for writing us. We will get back to you soon."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIPopoverPresentationController *popover = alert.popoverPresentationController;
    if (popover)
    {
        popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
    }
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];

    [alert addAction:defaultAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}


@end
