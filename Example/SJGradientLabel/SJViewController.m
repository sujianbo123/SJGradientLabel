//
//  SJViewController.m
//  SJGradientLabel
//
//  Created by sujianbo123 on 12/26/2018.
//  Copyright (c) 2018 sujianbo123. All rights reserved.
//

#import "SJViewController.h"
#import "SJGradientLabel.h"


@interface SJViewController ()

@end

@implementation SJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    SJGradientLabel * label = [[SJGradientLabel alloc] init];
    label.frame = CGRectMake(50, 100, 200, 50);
    label.textLabel.text = @"1111111";
    label.textLabel.font = [UIFont boldSystemFontOfSize:25];
    label.tag = 1001;
    [label.textLabel setPreferredMaxLayoutWidth:120];
    label.textLabel.numberOfLines = 0;
    [self.view addSubview:label];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    SJGradientLabel * label = [self.view viewWithTag:1001];
    label.textLabel.text = [NSString stringWithFormat:@"%@,susu",label.textLabel.text];
    [label sizeToFit];
}


@end
