//
//  PointManger.h
//  TuYaPRO
//
//  Created by Duger on 13-9-25.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangeLineColorManger.h"

@protocol PointMangerDelegate <NSObject>
@optional


-(void)resetPointWidth:(CGFloat)lineWidth;

@end


@interface PointManger : UIView


-(void)resetPointWidth;
@end
