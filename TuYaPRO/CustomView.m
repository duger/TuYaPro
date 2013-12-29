//
//  customView.m
//  TuYaPRO
//
//  Created by Duger on 13-9-23.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "CustomView.h"


@implementation CustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setFrame:CGRectMake(0, 0, 320, 480)];
        self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.5];
        self.hidden = YES;
        
        self.changeView = [[UIView alloc]initWithFrame:CGRectMake(60, 170, 200, 180)];
        self.changeView.backgroundColor = [UIColor whiteColor];
        self.changeView.layer.borderWidth = 1;
        self.changeView.layer.borderColor = [UIColor blackColor].CGColor;
        self.titleTextField.frame = CGRectMake(60, 0, 80, 30);
        [self.titleTextField setTextColor:[UIColor blackColor]];
        [self.titleTextField setTextAlignment:NSTextAlignmentCenter];
        [self.titleTextField setFont:[UIFont fontWithName:@"Arial" size:23.0f]];
        self.titleTextField.text = @"hahah";
        self.titleTextField.layer.borderWidth = 1;
        self.titleTextField.layer.borderColor = [UIColor blackColor].CGColor;
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelButton.layer.borderWidth = 1;
        cancelButton.layer.borderColor = [UIColor blackColor].CGColor;
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cancelButton setFrame:CGRectMake(0, 0, 60, 30)];
        [cancelButton addTarget:self action:@selector(didClickedCancelButton:) forControlEvents:UIControlEventTouchUpInside];
        UIButton *finishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        finishButton.layer.borderWidth = 1;
        finishButton.layer.borderColor = [UIColor blackColor].CGColor;
        [finishButton setTitle:@"完成" forState:UIControlStateNormal];
        [finishButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [finishButton setFrame:CGRectMake(140, 0, 60, 30)];
        [finishButton addTarget:self action:@selector(didClickedFinishButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.changeView];
//        [self insertSubview:self.changeView atIndex:0];
        [self.changeView addSubview:self.titleTextField];
        [self.changeView addSubview:cancelButton];
        [self.changeView addSubview:finishButton];
        
        
    }
    return self;
}

-(void)didClickedCancelButton:(UIButton *)button
{
    self.hidden = YES;
}

-(void)didClickedFinishButton:(UIButton *)button
{
    self.hidden = YES;
}

- (void)dealloc
{
    self.titleTextField = nil;

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
