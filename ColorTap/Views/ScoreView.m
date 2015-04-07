//
//  ScoreView.m
//  ColorTap
//
//  Created by Ranjith on 07/04/15.
//  Copyright (c) 2015 RanjithKumar Matheswaran. All rights reserved.
//

#import "ScoreView.h"

@implementation ScoreView{
    NSDictionary *data;
}

- (instancetype)initWithFrame:(CGRect)frame andData:(NSDictionary *)dict
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void) initUI{
    self.globalLabel = [[UILabel alloc] init];
    self.globalLabel.text = @"Global High";
}

/*NOTE:
DATA Model
  @{
@"global_high" : @"2349300",
@"personal_high" : @"36400"
};
*/

@end
