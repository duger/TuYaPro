//
//  ChangeColorView.m
//  TuYaPRO
//
//  Created by Duger on 13-9-23.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "ChangeColorView.h"
#import "DrawView.h"
#import "CustomView.h"
@implementation ChangeColorView
{
    CGFloat redColor;
    CGFloat greenColor;
    CGFloat blueColor;
}

static ChangeColorView *s_ChangeColorView = nil;
+(ChangeColorView *)instance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (s_ChangeColorView == nil) {
            s_ChangeColorView = [[ChangeColorView alloc]initWithFrame:CGRectZero];
        }
    });
    return s_ChangeColorView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        redColor = 6;
        greenColor = 9;
        blueColor = 9;
        
        
        UISlider *redSlider = [[UISlider alloc]initWithFrame:CGRectMake(10, 48, 130, 3)];
        redSlider.maximumValue = 100;
        redSlider.minimumValue = 0;
        redSlider.value = 30;
        redSlider.maximumTrackTintColor = [UIColor redColor];
        redSlider.minimumTrackTintColor = [UIColor whiteColor];
        [redSlider addTarget:self action:@selector(didChangeRedSlider:) forControlEvents:UIControlEventValueChanged];
        UISlider *greenSlider = [[UISlider alloc]initWithFrame:CGRectMake(10, 88, 130, 3)];
        greenSlider.maximumValue = 100;
        greenSlider.maximumTrackTintColor = [UIColor greenColor];
        greenSlider.minimumValue = 0;
        greenSlider.value = 30;
        greenSlider.minimumTrackTintColor = [UIColor whiteColor];
        [greenSlider addTarget:self action:@selector(didChangeGreenSlider:) forControlEvents:UIControlEventValueChanged];
        UISlider *blueSlider = [[UISlider alloc]initWithFrame:CGRectMake(10, 128, 130, 3)];
        blueSlider.maximumValue = 100;
        blueSlider.maximumTrackTintColor = [UIColor blueColor];
        blueSlider.minimumValue = 0;
        blueSlider.value = 30;
        blueSlider.minimumTrackTintColor = [UIColor whiteColor];
        [greenSlider addTarget:self action:@selector(didChangeBlueSlider:) forControlEvents:UIControlEventValueChanged];
        UITextField *redBox = [[UITextField alloc]initWithFrame:CGRectMake(150, 45, 45, 30)];
        redBox.text = @"red";
        redBox.textAlignment = NSTextAlignmentCenter;
        redBox.backgroundColor = [UIColor redColor];
        redBox.userInteractionEnabled = NO;
        UITextField *greenBox = [[UITextField alloc]initWithFrame:CGRectMake(150, 85, 45, 30)];
        greenBox.text = @"green";
        greenBox.textAlignment = NSTextAlignmentCenter;
        
        greenBox.backgroundColor = [UIColor greenColor];
        greenBox.userInteractionEnabled = NO;
        UITextField *blueBox = [[UITextField alloc]initWithFrame:CGRectMake(150, 125, 45, 30)];
        blueBox.text =  @"blue";
        blueBox.textAlignment = NSTextAlignmentCenter;
        blueBox.backgroundColor = [UIColor blueColor];
        blueBox.userInteractionEnabled = NO;
        
        self.titleTextField.text = @"背景颜色";
        
        [self.changeView addSubview:redSlider];
        [self.changeView addSubview:greenSlider];
        [self.changeView addSubview:blueSlider];
        [self.changeView addSubview:redBox];
        [self.changeView addSubview:greenBox];
        [self.changeView addSubview:blueBox];
        [redSlider release];
        [redBox release];
        [greenBox release];
        [greenSlider release];
        [blueBox release];
        [blueSlider release];
        
        
        
    }
    return self;
}

-(void)didClickedFinishButton:(UIButton *)button
{
    [DrawView intance].backgroundColor = [ChangeColorView instance].changedColor;
    self.hidden = YES;

    [self.delegate reSetBackgroundColor];
}



-(void)didChangeRedSlider:(UISlider *)sender
{
    //    DrawView *drawView = [[DrawView alloc]init];
    redColor = sender.value / 100.0f;
    [ChangeColorView instance].changedColor = [UIColor colorWithRed:redColor green:greenColor blue:blueColor alpha:1];
    
}

-(void)didChangeGreenSlider:(UISlider *)sender
{
    greenColor = sender.value / 100.0f;
    [ChangeColorView instance].changedColor = [UIColor colorWithRed:redColor green:greenColor blue:blueColor alpha:1];
}

-(void)didChangeBlueSlider:(UISlider *)sender
{
    blueColor = sender.value / 100.0f;
    [ChangeColorView instance].changedColor = [UIColor colorWithRed:redColor green:greenColor blue:blueColor alpha:1];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
