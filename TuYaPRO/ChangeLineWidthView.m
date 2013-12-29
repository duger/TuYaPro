//
//  ChangeLineWidthView.m
//  TuYaPRO
//
//  Created by Duger on 13-9-23.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "ChangeLineWidthView.h"
#import "PointManger.h"

@implementation ChangeLineWidthView

static ChangeLineWidthView *s_ChangeLineWidthView = nil;
+(ChangeLineWidthView *)instance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (s_ChangeLineWidthView == nil) {
            s_ChangeLineWidthView = [[ChangeLineWidthView alloc]initWithFrame:CGRectZero];
        }
    });
    return s_ChangeLineWidthView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UISlider *lineSlider = [[UISlider alloc]initWithFrame:CGRectMake(10, 85, 130, 3)];
        lineSlider.maximumValue = 40;
        lineSlider.minimumValue = 1;
        lineSlider.value = 8;
        [lineSlider addTarget:self action:@selector(didChangeLineWidthSlider:) forControlEvents:UIControlEventValueChanged];
        [self.changeView addSubview:lineSlider];
        PointManger *point = [[PointManger alloc]init];
        point.tag = 111;
        [self addSubview:point];
        
//        [self.changeView drawRect:self.changeView.bounds];
    }
    return self;
}

-(void)didClickedFinishButton:(UIButton *)button
{
    [self.delegate resetLineWidth:[ChangeLineWidthView instance].lineWidth];
    self.hidden = YES;
}


-(void)didChangeLineWidthSlider:(UISlider *)sender
{
    [ChangeLineWidthView instance].lineWidth = sender.value;
    
//    [self drawRect:self.bounds];
    PointManger *point = (PointManger *)[self viewWithTag:111];
    [point resetPointWidth];
    
    
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
