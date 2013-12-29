//
//  ChangeLineColorManger.h
//  TuYaPRO
//
//  Created by Duger on 13-9-24.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "CustomView.h"
@protocol ChangeLineColorMangerDelegate <NSObject>
@optional
-(NSString *)giveMeYourLineColorTitle;
-(void)reSetColor:(UIColor *)color;
@end


@interface ChangeLineColorManger : CustomView

@property(nonatomic,assign) id<ChangeLineColorMangerDelegate> delegate;
@property(nonatomic,retain) UIColor *changedColor;
@end
