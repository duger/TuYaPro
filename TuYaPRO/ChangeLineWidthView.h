//
//  ChangeLineWidthView.h
//  TuYaPRO
//
//  Created by Duger on 13-9-23.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "CustomView.h"

@protocol ChangeLineWidthViewDelegate <NSObject>
@optional

-(NSString *)giveMeYourLineWidthTitle;
-(void)resetLineWidth:(CGFloat)lineWidth;
//-(void)resetPointWidth;
@end

@interface ChangeLineWidthView : CustomView
+(ChangeLineWidthView *)instance;

@property(nonatomic,assign) CGFloat lineWidth;

@property(nonatomic,assign) id<ChangeLineWidthViewDelegate> delegate;


@end
