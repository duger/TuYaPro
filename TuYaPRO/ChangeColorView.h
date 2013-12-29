//
//  ChangeColorView.h
//  TuYaPRO
//
//  Created by Duger on 13-9-23.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "CustomView.h"

@protocol ChangeColorViewDelegate <NSObject>
@optional
-(NSString *)giveMeYourBackgroundTitle;
-(void)reSetBackgroundColor;

@end

@interface ChangeColorView : CustomView

+(ChangeColorView *)instance;

@property(nonatomic,assign)id<ChangeColorViewDelegate> delegate;
@property(nonatomic,retain) UIColor *changedColor;
@end
