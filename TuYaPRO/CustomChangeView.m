//
//  CustomChangeView.m
//  TuYaPRO
//
//  Created by Duger on 13-9-24.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "CustomChangeView.h"

@implementation CustomChangeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.baseView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
        //        self.baseView.backgroundColor = [UIColor lightGrayColor];
        self.baseView.backgroundColor = [UIColor colorWithRed:.7 green:0 blue:0 alpha:0.6];
        //        self.baseView.hidden = YES;
        self.changeView = [[UIView alloc]initWithFrame:CGRectMake(60, 170, 200, 180)];
        self.changeView.backgroundColor = [UIColor whiteColor];
        self.titleTextField.frame = CGRectMake(60, 0, 80, 30);
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [cancelButton setFrame:CGRectMake(0, 0, 60, 30)];
        [cancelButton addTarget:self action:@selector(didClickedCancelButton:) forControlEvents:UIControlEventTouchUpInside];
        UIButton *finishButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [finishButton setTitle:@"完成" forState:UIControlStateNormal];
        [finishButton setFrame:CGRectMake(140, 0, 60, 30)];
        [finishButton addTarget:self action:@selector(didClickedFinishButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.baseView addSubview:self.changeView];
        [self.changeView addSubview:self.titleTextField];
        [self.changeView addSubview:cancelButton];
        [self.changeView addSubview:finishButton];
        
        
    }
    return self;
}

-(void)didClickedCancelButton:(UIButton *)button
{
    self.baseView.hidden = YES;
}

-(void)didClickedFinishButton:(UIButton *)button
{
    self.baseView.hidden = YES;
}

- (void)dealloc
{
    self.titleTextField = nil;
    self.baseView = nil;
    self.changeView = nil;
    [super dealloc];
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
