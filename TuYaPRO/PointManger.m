//
//  PointManger.m
//  TuYaPRO
//
//  Created by Duger on 13-9-25.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "PointManger.h"
#import "ChangeLineWidthView.h"

@implementation PointManger

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.frame = CGRectMake(205, 245, 45, 45);
        self.backgroundColor = [UIColor whiteColor];
//        
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGPoint point1 = CGPointMake(20,20);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, point1.x , point1.y);
    CGPathAddQuadCurveToPoint(path, NULL, point1.x, point1.y, point1.x, point1.y);
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, path);
    
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context,[ChangeLineWidthView instance].lineWidth);
//                          [ChangeLineWidthView instance].lineWidth)
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextStrokePath(context);
    [self setNeedsDisplayInRect:rect];
}
-(void)resetPointWidth
{
    [self drawRect:self.bounds];
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
