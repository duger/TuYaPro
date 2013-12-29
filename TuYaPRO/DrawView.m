//
//  DrawView.m
//  TuYaPRO
//
//  Created by Duger on 13-9-23.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "DrawView.h"
#import <QuartzCore/QuartzCore.h>

static inline CGPoint midPoint(CGPoint value1,CGPoint  value2){
    return CGPointMake((value1.x + value2.x) / 2, (value1.y + value2.y) / 2);
}

@implementation DrawView
{
    CGMutablePathRef totalPath;
    NSMutableArray *totalColor;
    NSMutableArray *totalLineWidth;
}

static DrawView *s_drawView = nil;
+(DrawView *)intance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (s_drawView == nil) {
            s_drawView = [[DrawView alloc]initWithFrame:CGRectZero];
        }
    });
    return s_drawView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.lineArray = CFArrayCreateMutable(kCFAllocatorDefault, 0, NULL);
        totalPath = CGPathCreateMutable();
//        totalColor = [[NSMutableArray alloc]init];
//        totalLineWidth = [[NSMutableArray alloc] init];
        self.linewidth = 3.0f;
        self.lineColor = [UIColor yellowColor];
        self.backgroundColor = [UIColor whiteColor];
        self.lineDicArray = [[NSMutableArray alloc]init];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(roDo)];
        [tapGesture setNumberOfTapsRequired:2];
        [tapGesture setNumberOfTouchesRequired:1];
        [self addGestureRecognizer:tapGesture];
        
        
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}


-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    if (CGPointEqualToPoint(self.lastPoint, CGPointZero)) {
        return;
    }
    NSLog(@"写入前%d",self.lineDicArray.count);
        CGContextRef context = UIGraphicsGetCurrentContext();
//        CGContextClearRect(context, rect);
    
    for (NSDictionary *item in self.lineDicArray) {
        CGMutablePathRef tempPath = (CGMutablePathRef)[item objectForKey:@"lineArray"];
        UIColor *tempLineColor = [item objectForKey:@"linecolor"];
        CGFloat tempLineWidth = [[item objectForKey:@"linewidth"]floatValue];
        
        
        
        CGContextAddPath(context, tempPath);
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextSetLineWidth(context, tempLineWidth);
        CGContextSetStrokeColorWithColor(context, tempLineColor.CGColor);
        CGContextStrokePath(context);
    }
    
    
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    @try {
        self.path = CGPathCreateMutable();
        CFArrayAppendValue(self.lineArray, self.path);
            
        
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    NSDictionary *pathDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%f",self.linewidth],@"linewidth",self.lineColor,@"linecolor",self.path,@"lineArray", nil];
    [self.lineDicArray addObject:pathDic];
    
    UITouch *touch = [touches anyObject];
    
    self.prePoint = [touch locationInView:self];
    self.thePoint = [touch locationInView:self];
    self.lastPoint = [touch locationInView:self];
    
    
    CGPathMoveToPoint(self.path, NULL, self.prePoint.x, self.prePoint.y);
    CGPathAddQuadCurveToPoint(self.path, NULL, self.thePoint.x, self.thePoint.y, self.lastPoint.x, self.lastPoint.y);
        
    
    [self setNeedsDisplay];
    
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.prePoint = self.thePoint;
    self.thePoint = [touch previousLocationInView:self];
    self.lastPoint = [touch locationInView:self];
    
    CGPoint midPoint1 = midPoint(self.prePoint, self.thePoint);
    CGPoint midPoint2 = midPoint(self.thePoint, self.lastPoint);
    
    CGPathMoveToPoint(self.path, NULL, midPoint1.x, midPoint1.y);
    CGPathAddQuadCurveToPoint(self.path, NULL, self.thePoint.x, self.thePoint.y, midPoint2.x, midPoint2.y);
    CGPathAddPath(totalPath, NULL, self.path);
    

    [self setNeedsDisplay];
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate date]];
    
    
}

-(void)roDo
{
    NSLog(@"LRload");

    NSLog(@"删除前%d",self.lineDicArray.count);
    [self.lineDicArray removeLastObject];
    [self.lineDicArray removeLastObject];
    NSLog(@"删除环%d",self.lineDicArray.count);
    
    [self setNeedsDisplay];
    
}


-(UIImage *)getMyImage
{
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    self.myImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return self.myImage;
}


- (void)dealloc
{
    self.myImage = nil;
    [super dealloc];
}


#pragma mark CustomScrollView delegate
-(void)getImages
{
    
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
