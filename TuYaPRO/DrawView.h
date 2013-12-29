//
//  DrawView.h
//  TuYaPRO
//
//  Created by Duger on 13-9-23.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomScrollView.h"

@interface DrawView : UIView<CustomScrollViewDelegate>

+(DrawView *)intance;
@property(assign,nonatomic) CGPoint prePoint;
@property(assign,nonatomic) CGPoint thePoint;
@property(assign,nonatomic) CGPoint lastPoint;
@property(retain,nonatomic) UIImage *myImage;
@property(assign,nonatomic) CGFloat linewidth;
@property(assign,nonatomic) CGMutablePathRef path;
@property(assign,nonatomic) CFMutableArrayRef lineArray;
@property(retain,nonatomic) UIColor *lineColor;
@property(retain,nonatomic) NSMutableArray *lineDicArray;

-(void)roDo;
-(UIImage *)getMyImage;



@end
