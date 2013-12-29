//
//  AboutViewController.m
//  TuYaPRO
//
//  Created by Duger on 13-9-23.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController
{
    UITextView *textView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"About";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = self.color;
    textView = [[UITextView alloc] initWithFrame:self.view.frame];
    
    textView.textColor = [UIColor blackColor];
    textView.font = [UIFont fontWithName:@"Arial" size:23.0];
    textView.backgroundColor = [UIColor lightGrayColor];
    textView.layer.borderColor = [UIColor blackColor].CGColor;
    textView.layer.borderWidth = 1;
    textView.text = @"涂鸦一词起源于唐朝卢仝说其儿子乱写乱画顽皮之行，后逐渐演变成了带有时代色彩的艺术行为。涂鸦主要的介质为墙，但进入20世纪后期，涂鸦所创造的介质不只是墙了。到了21世纪，许多年轻人把涂鸦与时尚的嘻哈元素结合，像多元化发展。";
    textView.scrollEnabled = YES;
    textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:textView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
